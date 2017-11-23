import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class flappy_bird extends PApplet {


button but = new button(200,300,200,100,"play",color(255));
button playagain = new button(200,300,200,100,"play again",color(255));
int dis=300;
int start_delay=400;
int spd=2;
poles[] a = new poles[]{new poles(start_delay+(0*dis),10,2),new poles(start_delay+(1*dis),10,2),new poles(start_delay+(2*dis),10,2)};
int[] col={100,20,20};
player player = new player(col,100);
int room=2;
Table score;
Stringinput nam = new  Stringinput();

public void setup(){
   textAlign(CENTER);
  //score = new Table();
  //score.addColumn("score");
  //score.addColumn("name");
  //saveTable(score, "data/score.csv");
  score = loadTable("data/score.csv", "header");
  println(score.getRowCount() + " total rows in table"); 
  score.setColumnType(0,"int");
    score.sortReverse(0);
  for (TableRow row : score.rows()) {
    
    int rowscore = row.getInt(0);
    String name = row.getString(1);
    
    println(name + " (" + rowscore + ")");
  }
  
  //TableRow row = score.getRow(score.getRowCount()-1);
  //println(row.getInt("score"));
  
  
}





public void draw(){
  if(room ==0){
    background(100);
    fill(255 );
    for(int x=0;x<a.length;x++){
    a[x].tick();
    }
    player.tick(frameCount);
    col_cheak();
    textSize(48);
    fill(0 );
    text(player.score,width/2,height-100);
    textSize(12);
  }
  if(room ==1){
    death();
  }
  if(room ==2){
  mainmenu();
  }
}
public void col_cheak(){
  for(int x=0;x<a.length;x++){
    //println(player.x , a[x].x);
    if(!(player.y>a[x].y && player.y<a[x].y+a[x].gap)){
      if(a[x].x<player.x+player.size && a[x].x+30>player.x){
        player.tick(3);
      room=1;
      }
      }
    
    }
}
public void keyPressed(){
    if(room ==0){
      player.jump(20);
    }
    if(room == 1 || room ==2){
      if (key == BACKSPACE) {

        nam.backspace();
        //print("back");
           
      }else{
      String sk = str(key);
       nam.txtinput(sk);
      }
    }

    
}

public void mousePressed(){
  if(but.pressed()&&room==2){
    room=0;
  }
  if(playagain.pressed()&&room==1){
    for(int x=0;x<a.length;x++){
    a[x].reset();
    }
    TableRow newRow = score.addRow();
    newRow.setInt("score",player.score);
    newRow.setString("name", nam.txt);
    score.setColumnType(0,"int");
    score.sortReverse(0);
 
    saveTable(score, "data/score.csv");
    player.reset();
    //nam.reset();
    room=0;
    TableRow row = score.getRow(0);
    println(row.getInt("score"));
    
    
  }
  
}
class button{
int x,y,xsize,ysize;
String lable;
int col;
button(int x1, int y1, int xsize1,int ysize1,String lable1,int col1){
x=x1;
y=y1;
xsize=xsize1;
ysize=ysize1;
lable=lable1;
col=col1;
}

public void update(){
fill(col);
rect(x,y,xsize,ysize);
fill(0);
text(lable,x+(xsize/2),y+(ysize/2));

}

public boolean pressed(){
if(x<mouseX &&x+xsize>mouseX){
  if(y<mouseY && y+ysize>mouseY){
    return true;
  }
  
}
return false;
}

}
public void mainmenu(){
  background(255,200,200);
  TableRow row = score.getRow(0);
  textSize(20);
  text("high score "+str(row.getInt("score"))+" set by "+(row.getString("name")),width/2,200);
  textSize(12);
  but.update();
  text("name :"+nam.txt,width/2,height/2-100);
}


public void death(){
  fill(255,200,200);
  rect(100,100,400,400);
  fill(0);
  textSize(20);
  TableRow row = score.getRow(0);
  text("high score "+str(row.getInt("score"))+" set by "+(row.getString("name")),width/2,450);
  textSize(12);
text("score :"+player.score,width/2,height/2-200);
text("game over",width/2,height/2-100);
text("name :"+nam.txt,width/2,height/2-150);

playagain.update();

}
class player{
int grav=4;
int yspd=0;
int y;
int x;
int[] col;
int score =0;
int size = 30;
player(int[] col1,int x1){
  x=x1;
  y=height/2;
  col=col1;
}
public void tick(int frame){
  fill(col[0],col[1],col[2]);
  ellipse(x,y,size,size);
  fill(255);
  if(frame%3==0){
  y=y+yspd;
  yspd=yspd+grav;
  }
  if(y>height){
    room=1;
  }
  
}

public void jump(int jh){
yspd=-jh;
}

public void reset(){
score=0;
y=height/2;
}
}



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

public void tick(){
  
rect(x,0,wid,y);
rect(x,y+gap,wid,height);
x-=acc;
if(x<-wid){
x=width+300;
y= randomGenerator.nextInt(height-200);
player.score+=1;
}


}

public void reset(){
x=xstart;
y=randomGenerator.nextInt(abs(height-200));
}

}

class Stringinput{
  String txt="";
Stringinput(){

}

public void txtinput(String keyx){
txt+=keyx;
}

public void backspace(){
  if(txt.length() - 1<0){
  txt="";
  }else{
  txt=txt.substring(0, txt.length() - 1);
  }
}
public void reset(){
txt="";
}

}
  public void settings() {  size(600,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "flappy_bird" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
