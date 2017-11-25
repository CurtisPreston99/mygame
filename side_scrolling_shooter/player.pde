class player {
  int xspd=0;
  int yspd=0;
  int x, y, grav, jump, spd, floor;
  int w=30;
  int h=30;
  Boolean grounded=false;
  player(int x1, int y1, int grav1, int jump1, int spd1, int floor1) {
    x=x1;
    y=y1;
    grav=grav1;
    jump=jump1;
    spd=spd1;
    floor=floor1;
  }



  void update(ArrayList obj) {
    println("yspd  :",yspd);
    if(global.keys[97]){
      xspd=spd;
    }
    if(global.keys[100]){
      xspd=-spd;
    }
    
    
    if(!global.keys[100]&&!global.keys[97]){
    xspd=0;
    }
    //println("x :",x);
    //println("y :",y);
    yspd+=grav;
    if (global.keys[119] && grounded) {
      yspd=-jump;
      grounded=false;
    }

    if (colva()&&yspd>0) {
      println("ground");
      grounded=true;
      yspd=0;
    }
    if (colvb()&&yspd<0) {
      
      println("no-ground");
      grounded=false;
      yspd=0;
    }

 


    if (y+yspd+h<height-floor) {

      y=y+yspd;
    } else {
      y=height-floor-h/2;
      grounded=true;
      yspd=0;
    }
  }



  void dra() {
    ellipse(x-15, y-15, w, h);
    line(0, height-floor, 7000, height-floor);
  }

  public boolean colva() {//colliision from above
    boolean coll=false;

    for (int i = 0; i < col.size(); i++) {
      step part = col.get(i);

      //println(part.x);
      //println(part.w);
      if (part.x-w/2<0&& part.x+w/2>-part.w) {


        if (part.y<y+h/2+yspd && part.y+(part.h)>y+yspd) {
          
          coll=true;
          //println(true);
        }
      }
    }

    return coll;
  }

  public boolean colvb() {//colliision from below
    boolean coll=false;

    for (int i = 0; i < col.size(); i++) {
      step part = col.get(i);

      //println(part.x);
      //println(part.w);
      if (part.x-w/2<0&& part.x+w/2>-part.w) {


        if (part.y<y+h/2 && part.y+part.w+h/2>y) {
          coll=true;
          //println(true);
        }
      }
    }

    return coll;
  }

  public boolean colh() {//colliision from the sides
    boolean coll=false;

    for (int i = 0; i < col.size(); i++) {
      step part = col.get(i);

      //println(part.x);
      //println(part.w);
      if (part.y<y+w/2 && part.y+part.h>y) {
        if (part.x+xspd-w/2<0&& part.x+w+xspd/2>-part.w) {



          coll=true;
          //println(true);
        }
      }
    }

    return coll;
  }
}


class bullet {
  int dx, dy;
  float m;
  bullet(int x, int y) {
    m=(mouseX-x)/(mouseY-y);
    //println(m);
  }
}