float boostXMouse,boostYMouse;

World w = new World(0.5,0.01);
Object c = new Object("circle",width/2,height/2,0.9,50);
Object c2 = new Object("circle",width/2+100,height/2,0.9,50);

void setup(){
  size(400,400);
  fill(#FF0000);
  noStroke();
  frameRate(100);
  c.speedX=1;
  c2.speedX=random(-10,10);
}

void draw(){
  background(200);
  if(dist(mouseX,mouseY,c.x,c.y)<c.rad && mousePressed == true){
    c.x=mouseX;
    c.y=mouseY;
    c.speedX=mouseX-pmouseX;
    c.speedY=mouseY-pmouseY;
  }
  else{
    c.fiz();
  }
  c2.fiz();
  //colide();
  fill(#FF0000);
  text(frameRate,10,20);
  c.draw();
  fill(#00FF00);
  c2.draw();
}

void colide(){
  if(dist(c.x,c.y,c2.x,c2.y)<c.rad/2+c2.rad/2){
    c.speedX=(-c.speedX+(-c2.speedX*0.2)-(-c.speedX*0.2))*c.elast;
    c.speedY=(-c.speedY+(-c2.speedY*0.2)-(-c.speedY*0.2))*c.elast;
    c2.speedX=(-c2.speedX+(-c.speedX*0.2)-(-c2.speedX*0.2))*c2.elast;
    c2.speedY=(-c2.speedY+(-c.speedY*0.2)-(-c2.speedY*0.2))*c2.elast;
  }
}
