// open a file and read its binary data 
byte b[] = loadBytes("g3784.bmp");

println();

println("** BMP Info **");
print("bmp data offset address: ");
int offset_address = (b[10] & 0xff) + ((b[11] & 0xff)<<8) + ((b[12] & 0xff)<<16)+ ((b[13] & 0xff)<<24);
println(offset_address);
print("bmp width in pixels (<=96*5=480): ");
int bmp_width = (b[18] & 0xff) + ((b[19]& 0xff)<<8) + ((b[20]& 0xff)<<16)+ ((b[21]& 0xff)<<24);
println(bmp_width);
print("bmp height in pixels (<=96*5=480): ");
int bmp_height = (b[22] & 0xff) + ((b[23] & 0xff)<<8) + ((b[24] & 0xff)<<16)+ ((b[25] & 0xff)<<24);
println(bmp_height);
print("bits per pixel (s/b 1): ");
int bits_per_pixel = (b[28] & 0xff) + ((b[29] & 0xff)<<8);
println(bits_per_pixel);
print("compression used (s/b 0): ");
int compression = (b[30] & 0xff) + ((b[31] & 0xff)<<8) + ((b[32] & 0xff)<<16)+ ((b[33] & 0xff)<<24);
println(compression);
print("row size: ");
float temp_bits_per_pixel = bits_per_pixel;
float temp_bmp_width = bmp_width;
float temp_row_size = temp_bits_per_pixel*temp_bmp_width/32;
int row_size =  ceil(temp_row_size)*4;
println(row_size);

println("** Print Info **");
println("number of passes (height): ");
float temp_bmp_height = bmp_height;
int number_of_passes = ceil(temp_bmp_height/12);
println(number_of_passes);
println("number of print rows (height): ");
int number_of_print_rows = number_of_passes*12;
println(number_of_print_rows);
println("number of blank print rows (bottom): ");
int number_of_blank_print_rows = number_of_print_rows - bmp_height;
println(number_of_blank_print_rows);
println("minimum row size: ");
int min_row_size =  ceil(temp_bmp_width/8);
println(min_row_size);
println();

boolean[][] d = new boolean[bmp_width][number_of_print_rows];
int temp_column = 0;
int temp_row = 0;
for (int i = offset_address; i < b.length; i++) { 
  for(int j = 7;j>=0;j--){
    // at end of row start a new line
    if (temp_column == row_size*8) {
      temp_column = 0;
      temp_row++;
 
    }
    int a = b[i]>>j & 0x01; 
    if(temp_column<bmp_width){
      d[temp_column][number_of_print_rows-(temp_row+1)]=(a==0);
    }
    temp_column++; 
  }

}

//for(int j = 0; j<number_of_print_rows;j++){
//  for(int i = 0; i<bmp_width;i++){
//    byte t = byte(d[i][j]);
//    print(t);
//  }
//  println();
//}
int layer_size = (bmp_width+1)*number_of_passes*2;

byte[] print_data =new byte[layer_size];
int temp=0;
int index=0;
for(int i = 0; i<number_of_passes;i++){
  println(i);
  for(int j = 0; j<bmp_width;j++){
    for(int k=0; k<12; k++){
      //using ! to turn 1's into 0's  (BMP 0=black, 1=white - Data file 1=black, 0=white)
      // (11-k) is to flip the pixels over (top nozzle is #12 bottom is #1
      int temp1 = int(!d[j][12*i+k])<<(11-k);
      temp += temp1;
    }
    println(binary(temp,12));
    print_data[index] = byte(temp);
    index++;
    print_data[index] = byte(temp>>8);
    index++;
    temp = 0;
  }
  //end of pass
  print_data[index] = byte(0x00);
  index++;
  print_data[index] = byte(0xf0);
  index++;

  if(i<number_of_passes-1){
    i++;
    println(i);
    for(int j = bmp_width-1; j>=0;j--){
      for(int k=0; k<12; k++){
        int temp1 = int(!d[j][12*i+k])<<(11-k);
        temp += temp1;
      }
      println(binary(temp,12));
      print_data[index] = byte(temp);
      index++;
      print_data[index] = byte(temp>>8);
      index++;
      temp = 0;
    }
    //end of pass
    print_data[index] = byte(0x00);
    index++;
    print_data[index] = byte(0xf0);
    index++;

  }
}

saveBytes("print.dat", print_data);
println("done");

