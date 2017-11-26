class player {
  ArrayList<bullet> bul = new ArrayList<bullet>();
  PImage[] temp={loadImage("player/1.png"),loadImage("player/2.png"),loadImage("player/3.png"),loadImage("player/2.png")};
  sprite spr = new sprite(0,15,temp);
  int xspd=0;
  int yspd=0;
  int x, y, grav, jump, spd, floor;
  int w=32;
  int h=32;
  Boolean grounded=false;
  player(int x1, int y1, int grav1, int jump1, int spd1, int floor1) {
    x=x1;
    y=y1;
    grav=grav1;
    jump=jump1;
    spd=spd1;
    floor=floor1;
  }



  void update() {                
    //scale(global.ScaleX,global.ScaleY);
    //println("yspd  :",yspd);
    //key press
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
    yspd+=grav;//gravitty
    if (global.keys[119] && grounded) {
      yspd=-jump;
      grounded=false;
    }
    
    //collisions
    if (colva()&&yspd>0) {
      //println("ground");
      grounded=true;
      yspd=0;
    }
    if (colvb()&&yspd<0) {
      
      //println("no-ground");
      grounded=false;
      yspd=0;
    }
    if(colh()&&xspd!=0){
      xspd=0;
    }

 

    //adding floor
    if (y+yspd+h/2<hig-floor) {

      y=y+yspd;
    } else {
      y=(hig-floor-h/2);
      grounded=true;
      yspd=0;
    }
    
    //sprite facing the right way
    if(xspd<0){
    spr.facing=1;
    }
    if(xspd>0){
    spr.facing=0;
    }
    
    //draw bullet from player
    for(bullet x :bul){
      x.drw();
      //println(x.dx);
    }
  }



  void dra() {
    
    
    line(0, hig-floor, 7000, hig-floor);
    spr.drw(x-h/2,y-w/2);
    noFill();
    rect(x-15, y-15, 30, 30);
    fill(255);
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


        if (part.y<y+h/2 && part.y+part.w+h>y) {
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
      if (part.y<y+h/2 && part.y+part.w+h/2>y) {
        if (part.x-(w/2)+xspd<0&& part.x+w/2+xspd>-part.w) {

          print(true);

          coll=true;
          //println(true);
        }
      }
    }

    return coll;
  }
  
  
  
  void bullet(){
    bul.add(new bullet(x,y,mouseX-x,mouseY-y,2));
  
  }
}