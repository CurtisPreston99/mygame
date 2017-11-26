player player;

globals global = new globals();

ArrayList<step> col = new ArrayList<step>();


int wid, hig;
int scalex, scaley;
void setup() {
  ellipseMode(CORNER);
  size(500, 720);
  surface.setResizable(true);
  //fullScreen();
  wid=width;
  hig=height;
  player=new player(width/2, height/2, 1, 20, 10, 20);
  col.add(new step(150, 450, 50, 50));
  col.add(new step(100, 500, 50, 50));
  col.add(new step(300, 600, 50, 50));
  col.add(new step(500, 650, 50, 50));
  col.add(new step(450, 700, 50, 50));
  scalex=0;
  scaley=0;
}

void draw() {
  if(mousePressed){
  player.bullet();
  }
  scale(global.ScaleX, global.ScaleY);

  background(255);
  player.update();
  player.dra();


  for (int i = 0; i < col.size(); i++) {
    step part = col.get(i);
    part.update();
  }
  float xs=(float)width/wid;
  float ys=(float)height/hig;
  global.updatescale(xs, ys);
  //println("x scale :", global.ScaleX, " should be", ys);
  //println("y scale :", global.ScaleY, " should be", xs);
}


void keyPressed() {
  global.updatekeys(char(key), true);
}

void keyReleased() {
  global.updatekeys(char(key), false);
}

void mousePressed(){


}

class globals {
  Boolean[] keys = new Boolean[255];
  float ScaleX, ScaleY;

  globals() {
    ScaleX=1.5;
    ScaleY=1;
    for (int x=0; x<keys.length; x++) {
      keys[x]=false;
    }
  }

  void updatekeys(char keyy, Boolean swit) {
    int iteam = (int) keyy;
    println(keyy);
    println(iteam);
    if (iteam<255) {
      keys[iteam]=swit;
    }
  }
  void updatescale(float newx, float newy) {
    ScaleX=(float)newx;
    ScaleY=(float)newy;
  }
}