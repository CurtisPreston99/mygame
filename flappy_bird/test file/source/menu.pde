void mainmenu(){
  background(255,200,200);
  TableRow row = score.getRow(0);
  textSize(20);
  text("high score "+str(row.getInt("score"))+" set by "+(row.getString("name")),width/2,200);
  textSize(12);
  but.update();
  text("name :"+nam.txt,width/2,height/2-100);
}


void death(){
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