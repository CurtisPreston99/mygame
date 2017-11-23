class button{
int x,y,xsize,ysize;
String lable;
color col;
button(int x1, int y1, int xsize1,int ysize1,String lable1,color col1){
x=x1;
y=y1;
xsize=xsize1;
ysize=ysize1;
lable=lable1;
col=col1;
}

void update(){
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