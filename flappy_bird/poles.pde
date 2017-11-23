import java.util.Random;


class poles{
  int x,y,spd,acc,wid,gap;
  int xstart;
  Random randomGenerator = new Random();
  
poles(int x1,int spd_start1,int acc1){
  xstart=x1;
  x=x1;
  spd=spd_start1;
  acc=acc1;
  y= randomGenerator.nextInt(abs(height-200));
  wid=30;
  gap=120;
}

void tick(){
  
rect(x,0,wid,y);
rect(x,y+gap,wid,height);
x-=acc;
if(x<-wid){
x=width+300;
y= randomGenerator.nextInt(height-200);
player.score+=1;
}


}

void reset(){
x=xstart;
y=randomGenerator.nextInt(abs(height-200));
}

}