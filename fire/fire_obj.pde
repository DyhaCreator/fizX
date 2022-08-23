class Fire{
  ArrayList<Particles_fire>part = new ArrayList();
  PVector pos = new PVector(0,0);
  float intensity = 30;
  Fire(float x,float y, float i){
    this.pos.x = x;
    this.pos.y = y;
    this.intensity = i;
    /*Particles_fire a = new Particles_fire(pos.x+random(-intensity/2,intensity/2),pos.y+random(-intensity/2,intensity/2),intensity/3,intensity);
    part.add(a);*/
  }
  void show(){
    for(int i=0;i<part.size();i++){
      part.get(i).show();
      part.get(i).update();
      if(part.get(i).size<0){part.remove(i);}
    }
    fill(color(255,0,0),200);
    //circle(pos.x,pos.y,30);
    for(int i=0;i<intensity;i++){
    Particles_fire a = new Particles_fire(pos.x+random(-intensity/2,intensity/2),pos.y+random(-intensity/2,intensity/2),intensity/random(10,intensity),intensity);
    part.add(a);}
  }
}
