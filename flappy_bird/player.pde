class player{
int grav=4;
int yspd=0;
int y;
int x;
int[] col;
int score =0;
int size = 30;
player(int[] col1,int x1){
  x=x1;
  y=height/2;
  col=col1;
}
void tick(int frame){
  fill(col[0],col[1],col[2]);
  ellipse(x,y,size,size);
  fill(255);
  if(frame%3==0){
  y=y+yspd;
  yspd=yspd+grav;
  }
  if(y>height){
    room=1;
  }
  
}

void jump(int jh){
yspd=-jh;
}

void reset(){
score=0;
y=height/2;
}
}