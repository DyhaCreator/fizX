World world = new World();
ArrayList<Obj>obj = new ArrayList();
void setup(){
  size(500,500);
  noStroke();
  frameRate(60);
  //Obj a = new Obj(new PVector(100,100),new PVector(3,0),50,0.5,color(255,0,0));
  //obj.add(a);
  //a = new Obj(new PVector(width/2,height/2),new PVector(0.5,0),50,0.5,color(0,255,0));
  //obj.add(a);
}
void draw(){
  background(0);
  for(int i=0;i<obj.size();i++){
    obj.get(i).show();
    obj.get(i).update();
  }
  /*if(mousePressed){
    Obj a = new Obj(new PVector(mouseX,mouseY),new PVector(0,0),50,random(0.9),color(random(255),random(255),random(255)));
    obj.add(a);
  }*/
  fill(255);
  text(frameRate,0,10);
}

void mousePressed(){
  Obj a = new Obj(new PVector(mouseX,mouseY),new PVector(0,0),50,random(0.5,0.9),color(random(255),random(255),random(255)));
  obj.add(a);
}
