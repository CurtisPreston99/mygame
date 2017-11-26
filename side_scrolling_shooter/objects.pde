class step{
  int x,y,h,w;
  step(int x1,int y1,int h1,int w1){
    x=x1;
    y=y1;
    h=h1;
    w=w1;
    
  }
  
  void update(){
      x=x+player.xspd;
    
    if(x+player.x<wid&&x+player.x+w>0){
      //scale(global.ScaleX,global.ScaleY);
      //println(true);
      rect(x+player.x,y,w,h);
    }else{
    //println(false);
    }
    
  }
  
}


class bullet {
  float dx, dy;
  float m;
  int x;
  int y;
  bullet(int x1, int y1,int dx1, float dy1,float spd) {
    x=x1;
    y=y1;
    if(dx1==0){
    dx=0;
    dy=spd;
    }else{
    dx=spd;
    dy=(dy1/dx1)*spd;
    }
    println("dx :",dx);
    println("dy :",dy);
  }
  
  void drw(){
    
    rect(x,y,10,10);
    x+=dx;
    y+=dy;
  }
}