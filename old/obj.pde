class World{
  float boost,fric;
  World(float b,float f){
    boost = b;
    fric = f;
  }
}

class Object{
  String type;
  float x,y,speedX,speedY,elast,rad;
  Object(String typ, int tx, int ty, float el, int r){
    type = typ;
    x = tx;
    y = ty;
    elast = el;
    rad = r;
  }
  Object(String typ){
    type = typ;
  }
  void fiz(){  
    if(y+rad/2>width){
      speedY=0-speedY*elast;
      if(speedX>0){speedX-=w.fric;}
      else{speedX+=w.fric;}
      y=width-rad/2;
    }
    if(y-rad/2<0){
      speedY=-speedY*elast;
      if(speedX>0){speedX-=w.fric;}
      else{speedX+=w.fric;}
      y=0+rad/2;
    }
    if(x-rad/2<0){
      speedX=-speedX*elast;
      if(speedY>0){speedY-=w.fric;}
      else{speedY+=w.fric;}
      x=0+rad/2;
    }
    if(x+rad/2>height){
      speedX=-speedX*elast;
      if(speedY>0){speedY-=w.fric;}
      else{speedY+=w.fric;}
      x=height-rad/2;
    }
    speedY+=w.boost;
    x+=speedX;
    y+=speedY;
  }
  void draw(){
    circle(x,y,rad);
  }
}
