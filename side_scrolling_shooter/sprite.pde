class sprite{
PImage[] sheet;
PImage[] sheetflip;
int facing=0;
int len;
int index;
int speed;
  sprite(int start, int speed1,PImage[] img){
speed=speed1;
sheet = img;
len=img.length-1;
index=start;
sheetflip=flip(sheet);
}

void drw(int x,int y){
if(facing==0){
image(sheet[index], x, y);
}else{
  image(sheetflip[index], x, y);
}
if(frameCount%speed==0){
next();
}
}
void next(){
index+=1;
if(index>len){
index=0;
}
}
void prev(){
index-=1;
if(index<0){
index=len;
}
}

public PImage[] flip(PImage[] img){
PImage[] sheetfliped = new PImage[img.length];

for(int x =0;x<img.length;x++){
sheetfliped[x]=flips(img[x]);
}
return sheetfliped;
}

public PImage flips(PImage img){
PImage flipped = createImage(img.width,img.height,RGB);//create a new image with the same dimensions
for(int i = 0 ; i < flipped.pixels.length; i++){       //loop through each pixel
  int srcX = i % flipped.width;                        //calculate source(original) x position
  int dstX = flipped.width-srcX-1;                     //calculate destination(flipped) x position = (maximum-x-1)
  int y    = i / flipped.width;                        //calculate y coordinate
  flipped.pixels[y*flipped.width+dstX] = img.pixels[i];//write the destination(x flipped) pixel based on the current pixel  
}

//PImage flipped = createImage(img.width,img.height,RGB);//create a new image with the same dimensions
//for(int y = 0; y < img.height; y++){
//  for(int x = 0; x < img.width; x++){
//    flipped.set(img.width-x-1,y,img.get(x,y));
//  }
//}

//PImage flipped = createImage(img.width,img.height,RGB);//create a new image with the same dimensions
//for(int x = 0 ; x < flipped.width; x++){               //loop through each columns
//  flipped.set(flipped.width-x-1,0,img.get(x,0,1,img.height));       //copy a column in reverse x order
//}
return flipped;

}
}