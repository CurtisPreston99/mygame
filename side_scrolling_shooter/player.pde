class player{
  int xspd=0;
  int yspd=0;
  int x, y, grav, jump, spd, floor;
  int w=30;
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
    
    yspd+=grav;
    if (global.keys[119] && grounded) {
      yspd=-jump;
      grounded=false;
    }
    
    if(colv(obj)){
     
    grounded=true;
    yspd=0;
    }
    if(colh(obj)){
    xspd=0;
    
    }
    
    
    if (y+yspd+w/2<height-floor) {
      
      y=y+yspd;
    }else{
    y=height-floor-w/2;
    grounded=true;
    yspd=0;
    }
    
  }
  
   
  
  void dra(){
  ellipse(x-15,y-15,w,w);
  line(0,height-floor,7000,height-floor);
  }
  
  public boolean colv(ArrayList obj){
    boolean coll=false;
    
    for (int i = 0; i < col.size(); i++) {
      step part = col.get(i);
      
      println(part.x);
      println(part.w);
      if(part.x-w/2<0&& part.x+w/2>-part.w){
        
        
        if(part.y<y+yspd+w/2 && part.y+part.h>y+yspd){
          coll=true;
        println(true);  
      }
      }
      
    }
    
    return coll;
  }
  
   public boolean colh(ArrayList obj){
    boolean coll=false;
    
    for (int i = 0; i < col.size(); i++) {
      step part = col.get(i);
      
      println(part.x);
      println(part.w);
      if(part.x-w/2<0&& part.x+w/2>-part.w){
        
        
        if(part.y<y+yspd+w/2 && part.y+part.h>y+yspd){
          coll=true;
        println(true);  
      }
      }
      
    }
    
    return coll;
  }
}


class bullet(){

  bullet(x,y){

}
}