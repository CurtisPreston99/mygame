class step {
  int x, y, h, w;
  step(int x1, int y1, int h1, int w1) {
    x=x1;
    y=y1;
    h=h1;
    w=w1;
  }

  void update() {
    x=x+player.xspd;

    if (x+player.x<wid&&x+player.x+w>0) {
      //scale(global.ScaleX,global.ScaleY);
      //println(true);
      rect(x+player.x, y, w, h);
    } else {
      //println(false);
    }
  }
}


//class playersbullet {
//  float dx, dy;
//  float m;
//  int x;
//  int y;
//  playersbullet(float dx1, float dy1,float spd) {
//    x=player.x;
//    y=player.y;
//    if(y-dy1<0){
//    if(x-dx1<0){

//    dy=((y-dy1)/(x-dx1))*spd;
//    dx=((x-dx1)/(y-dy1))*spd;;
//    }else{

//    dy=-((y-dy1)/(x-dx1))*spd;
//    dx=((x-dx1)/(y-dy1))*spd;
//    }
//    println(dx,"==",pow((pow(spd,2))-(pow(m,2)),0.5));;
//    println(dy);
//    println(dy1,"   :dy1");
//  }else{

//    if(x-dx1<0){
//    dy=((y-dy1)/(x-dx1))*spd;
//    dx=-((x-dx1)/(y-dy1))*spd;;
//    }else{

//    dy=-((y-dy1)/(x-dx1))*spd;
//    dx=-((x-dx1)/(y-dy1))*spd;
//    }
//  }
//  }


//  void drw(){

//    rect(x,y,10,10);
//    x+=dx;
//    y+=dy;
//  }
//}



class bullet {
  PImage img =loadImage("bullet/bullet.png");
  float dx, dy;
  float m;
  float x;
  float y;
  bullet(float x1, float y1, float dx1, float dy1, float spd) {
    x=x1;
    y=y1;
    if (y-dy1<0) {
      if (x-dx1<0) {

        dy=((y-dy1)/(x-dx1))*spd;
        dx=((x-dx1)/(y-dy1))*spd;
        ;
      } else {

        dy=-((y-dy1)/(x-dx1))*spd;
        dx=((x-dx1)/(y-dy1))*spd;
      }
      println(dx, "==", pow((pow(spd, 2))-(pow(m, 2)), 0.5));
      ;
      println(dy);
      println(dy1, "   :dy1");
    } else {

      if (x-dx1<0) {
        dy=((y-dy1)/(x-dx1))*spd;
        dx=-((x-dx1)/(y-dy1))*spd;
        ;
      } else {

        dy=-((y-dy1)/(x-dx1))*spd;
        dx=-((x-dx1)/(y-dy1))*spd;
      }
    }

    if (dx>spd) {
      dx=spd;
    }
    if (dy>spd) {
      dy=spd;
    }
    if (dx<-spd) {
      dx=-spd;
    }
    if (dy<-spd) {
      dy=-spd;
    }
  }


  void drw() {

    rect(x, y, 10, 10);
    pushMatrix();
    rectMode(CENTER);

    translate(x, y);
    if (dx>0) {
      rotate(atan(dy/dx));
    } else {
      rotate(atan(dy/dx)+PI);
    }
    
    image(img, 0, 0);
    rectMode(CORNER);
    popMatrix();
    x+=dx+player.xspd;
    y+=dy;
  }

  public boolean update() {
    if (x>width||x<0) {
      return true;
    }
    if (y>height||y<0) {
      return true;
    }
    return false;
  }
}