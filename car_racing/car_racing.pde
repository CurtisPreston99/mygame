car car = new car(275,400);

void setup(){
size(800,800);

}

void draw(){
tint(0, 153, 204);
//rect(0,0,width,height);
car.dra();
//car.directionupdate(car.direction+5);
}

void keyPressed(){
  if(key=='a'){
    car.directionupdate(car.direction+5);

  }
  if(key=='d'){
  car.directionupdate(car.direction-5);

  }
}


class car{
float x;
float y;
float dx;
float dy;
int direction;
int speed;

car(int x1,int y1){
dx=0;
dy=0;
direction=0;
speed=10;
x=x1;
y=y1;
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