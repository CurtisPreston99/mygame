class step{
  int x,y,h,w;
  step(int x1,int y1,int h1,int w1){
    x=x1;
    y=y1;
    h=h1;
    w=w1;
    
  }
  
  void update(){
    if(global.keys[97]){
      x=x-player.spd;
    }
    if(global.keys[100]){
      x=x+player.spd;
    }
    
    if(x+player.x<width&&x+player.x>0){
      //println(true);
      rect(x+player.x,y,w,h);
    }else{
    //println(false);
    }
    
  }
  
}