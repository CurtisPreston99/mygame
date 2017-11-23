
class Stringinput{
  String txt="";
Stringinput(){

}

void txtinput(String keyx){
txt+=keyx;
}

void backspace(){
  if(txt.length() - 1<0){
  txt="";
  }else{
  txt=txt.substring(0, txt.length() - 1);
  }
}
void reset(){
txt="";
}

}