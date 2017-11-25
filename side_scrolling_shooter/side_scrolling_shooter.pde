player player;

globals global = new globals();

ArrayList<step> col = new ArrayList<step>();
int wid, hig;

void setup() {
  ellipseMode(CORNER);
  size(500, 500);
  surface.setResizable(true);
  //fullScreen();
  wid=width;
  hig=height;
  player=new player(width/2, height/2, 1, 20, 10, 20);
  col.add(new step(100, 350, 50, 50));
  col.add(new step(150, 400, 50, 50));
  col.add(new step(300, 300, 50, 50));
  col.add(new step(500, 350, 50, 50));
  col.add(new step(600, 400, 50, 50));
}

void draw() {
  background(255);
  player.update(col);
  player.dra();


  for (int i = 0; i < col.size(); i++) {
    step part = col.get(i);
    part.update();
  }
}


void keyPressed() {
  global.updatekeys(char(key), true);
}

void keyReleased() {
  global.updatekeys(char(key), false);
}

class globals {

  Boolean[] keys = new Boolean[255];


  globals() {
    for (int x=0; x<keys.length; x++) {
      keys[x]=false;
    }
  }

  void updatekeys(char keyy, Boolean swit) {
    int iteam = (int) keyy;
    //println(keyy);
    //println(iteam);
    if (iteam<255) {
      keys[iteam]=swit;
    }
  }
}