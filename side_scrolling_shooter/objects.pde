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



class bullet {
  int count=1000;
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
    rectMode(CENTER);
    rect(x, y, 10, 10);
    rectMode(CORNER);
    pushMatrix();

    translate(x, y);
    if (dx>0) {
      rotate(atan(dy/dx));
    } else {
      rotate(atan(dy/dx)+PI);
    }
    
    image(img, 0, 0);
    popMatrix();
    x+=dx+player.xspd/2;
    y+=dy;
  }

  public boolean update() {
    for (int i = 0; i < col.size(); i++) {
      step temp=col.get(i);
      if(x+10>temp.x+player.x && x-10<temp.x+player.x+temp.h){
        if(y>temp.y&&y<temp.y+temp.h){
      return true;
        }
      }
      }
     if(y+10>hig-player.floor){

           println(y," True  ",hig-player.floor);
                      return true;

     }
    count-=1;
    if(count<0){
      //println("bul del");
    return true;
    }else{
    return false;
    }
  }
}