class Particles_fire{
  PVector pos = new PVector(0,0);
  PVector start_pos = new PVector(0,0);
  PVector speed = new PVector(0,0);
  PVector boost = new PVector(0,-0.01);
  float size = 30;
  float intensity;
  Particles_fire(float x, float y, float size,float i){
    this.pos.x = x;
    this.pos.y = y;
    this.size = size;
    start_pos = pos;
    intensity = i;
  }
  void show(){
    fill(255,0,0,200);
    circle(pos.x,pos.y,size);
  }
  void update(){
    pos.add(speed);
    speed.add(boost);
    size-=size/intensity;
  }
}
