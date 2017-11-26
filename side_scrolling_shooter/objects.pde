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