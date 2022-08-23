Fire fire;
void setup(){
  size(500,500);
  noStroke();
  fire = new Fire(width/2,height-100,50);
}
void draw(){
  background(0);
  fire.show();
  text(frameRate,0,10);
}
