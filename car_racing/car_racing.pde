car car = new car(275,400,20);
boolean[] keys=new boolean[256];

void setup(){
size(800,800);

}

void draw(){
//rect(0,0,width,height);
car.dra();
//car.directionupdate(car.direction+5);
}

void keyPressed(){
  if(key=='a'){
    car.directionupdate(car.direction+5);
    keys[97]=true;
  }
  if(key=='d'){
  car.directionupdate(car.direction-5);

  }
  if(key=='w'){
  car.spdup(1);
  }
  if(key=='s'){
  car.spdup(-1);
  }
}