float e = HALF_PI;
float size = 50;
PVector a = new PVector(size*cos(e),size*sin(e));
PVector b = new PVector(size,0);
PVector c = new PVector(0,0);
void setup(){
  size(500,500);
  stroke(255);
  strokeWeight(5);
}
void draw(){
  //управление
  float v = mouseX;
  b=new PVector(size*cos(v/50),size*sin(v/50));
  //drawing
  background(0);
  stroke(255);
  circle(size*2*cos(v/50)+width/2,size*2*sin(v/50)+height/2,size*2);
  circle(width/2,height/2,size*2);
  stroke(color(255,0,0));
  line(width/2,height/2,a.x+width/2,a.y+height/2);
  stroke(color(0,255,0));
  line(width/2,height/2,b.x+width/2,b.y+height/2);
  stroke(color(0,0,255));
  line(a.x+width/2,a.y+height/2,c.x+a.x+width/2,c.y+a.y+height/2);
  
  //formula
  
  float engle = b.heading()-a.heading();
  if(engle>-HALF_PI){
    println(engle);
    float leng = dist(0,0,a.x,a.y);
    c.x=leng*cos(engle*2-e);
    c.y=leng*sin(engle*2-e);
  }
  
}
