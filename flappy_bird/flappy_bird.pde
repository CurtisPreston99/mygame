
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

void setup(){
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
  
  size(600,700);
}





void draw(){
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
void col_cheak(){
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
void keyPressed(){
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

void mousePressed(){
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