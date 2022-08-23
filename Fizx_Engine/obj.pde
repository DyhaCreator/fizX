class World{
  PVector boost = new PVector(0,0.5);
  float friction = 0.991;
}

class Obj{
  PVector pos = new PVector(0,0);
  PVector speed = new PVector(0,0);
  color c;
  float size,elast;
  Obj(PVector pos,PVector speed,float size,float elast,color c){
    this.speed = speed;
    this.pos = pos;
    this.size = size;
    this.elast = elast;
    this.c = c;
  }
  void show(){
    fill(c);
    circle(pos.x,pos.y,size);
  }
  void update(){
    getColaide();
    speed.add(world.boost);
    pos.add(speed);
  }
  void getColaide(){
    if(pos.y>height-size/2){
      speed.y=-speed.y*elast;
      pos.y=height-size/2;
    }
    if(pos.y<0+size/2){
      speed.y=-speed.y*elast;
      pos.y=0+size/2;
    }
    if(pos.x>width-size/2){
      speed.x=-speed.x*elast;
      pos.x=width-size/2;
    }
    if(pos.x<0+size/2){
      speed.x=-speed.x*elast;
      pos.x=0+size/2;
    }
    if(pos.x==0+size/2){speed.y*=world.friction;}
    if(pos.x==width-size/2){speed.y*=world.friction;}
    if(pos.y==0+size/2){speed.x*=world.friction;}
    if(pos.y==height-size/2){speed.x*=world.friction;}
    
    stroke(color(225,0,0));
    line(pos.x,pos.y,speed.x+pos.x,speed.y+pos.y);
    
    for(int i=0;i<obj.size();i++){
      if(obj.get(i).pos!=pos){
        if(dist(obj.get(i).pos.x,obj.get(i).pos.y,pos.x,pos.y)<obj.get(i).size/2+size/2){
          PVector vect = new PVector(0,0);
          vect.x=obj.get(i).pos.x-pos.x;
          vect.y=obj.get(i).pos.y-pos.y;
          stroke(color(0,255,0));
          line(pos.x,pos.y,vect.x+pos.x,vect.y+pos.y);
          float engle = vect.heading()-speed.heading();
          if(engle>-HALF_PI){
            float leng = dist(0,0,speed.x,speed.y);
            speed.x=leng*cos(engle*2-speed.heading())*elast;
            speed.y=leng*sin(engle*2-speed.heading())*elast;
            //leng = dist(0,0,vect.x,vect.y);
            vect.x=-vect.x;
            vect.y=-vect.y;
            leng = size/2+obj.get(i).size/2;
            engle = vect.heading();
            pos.x=leng*cos(engle)+obj.get(i).pos.x;
            pos.y=leng*sin(engle)+obj.get(i).pos.y;
          }
          
          vect.x=pos.x-obj.get(i).pos.x;
          vect.y=pos.y-obj.get(i).pos.y;
          engle = vect.heading()-obj.get(i).speed.heading();
          if(engle>-HALF_PI){
            float leng = dist(0,0,obj.get(i).speed.x,obj.get(i).speed.y);
            obj.get(i).speed.x=leng*cos(engle*2-obj.get(i).speed.heading())*obj.get(i).elast;
            obj.get(i).speed.y=leng*sin(engle*2-obj.get(i).speed.heading())*obj.get(i).elast;
            
            
            vect.x=-vect.x;
            vect.y=-vect.y;
            leng = size/2+obj.get(i).size/2;
            engle = vect.heading();
            obj.get(i).pos.x=leng*cos(engle)+pos.x;
            obj.get(i).pos.y=leng*sin(engle)+pos.y;
          }
          
          /*vect.x=pos.x-obj.get(i).pos.x;
          vect.y=pos.y-obj.get(i).pos.y;
          engle = vect.heading()-obj.get(i).speed.heading();
          leng = dist(0,0,obj.get(i).speed.x,obj.get(i).speed.y);
          speed.x=leng*cos(engle*2-obj.get(i).speed.heading());
          speed.y=leng*sin(engle*2-obj.get(i).speed.heading());
          
          vect.x=pos.x-obj.get(i).pos.x;
          vect.y=pos.y-obj.get(i).pos.y;
          obj.get(i).speed.x=-obj.get(i).speed.x;
          obj.get(i).speed.y=-obj.get(i).speed.y;*/
        }
      }
    }
  }
}
