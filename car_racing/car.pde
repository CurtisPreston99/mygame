class car{
float x;
float y;
float dx;
float dy;
int direction;
int speed;
int maxspd;

car(int x1,int y1,int msp1){
  directionupdate(0);
dx=0;
dy=0;
direction=0;
speed=0;
x=x1;
y=y1;
maxspd=msp1;
}
void spdup(int ds){
  speed+=ds;
  if(speed>maxspd){
  speed=maxspd;
  }
  if(speed<-maxspd){
  speed=-maxspd;
  }
}

void directionupdate(int nd){
  
direction=nd;
dx=sin(radians(direction));
dy=cos(radians(direction));

}

void dra(){
  
rect(x,y,30,30);
x=(x+(dx*speed));
y=(y+(dy*speed));

}
}