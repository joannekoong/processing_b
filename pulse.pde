ArrayList particles = new ArrayList();
 
float compress = 150;
 
void setup(){
  size(640, 640);
  for(int i = 0; i < 30; i++){
    particles.add(new Particle(new PVector(random(width/2-compress, width/2+compress), random(height/2-compress, height/2+compress))));
  }
  noStroke(); 
}
 
void draw(){
  // background color
  fill(0, 50);
  rect(0, 0, width, height);
  // color of ball 
  fill(200, 255, 150);
  for(int i = 0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    p.draw();
    p.boundary();
    for(int q = 0; q < particles.size(); q++){
      Particle p2 = (Particle) particles.get(q);
      if(PVector.dist(p.loc, p2.loc) < 50){
        stroke(255, 0, 0, 25);
        line(p.loc.x, p.loc.y, p2.loc.x, p2.loc.y);
        noStroke();
      }
    }
  }
}
 
class Particle {
  PVector loc, vel;
   
  // radius of circle 
  int r = (int)random(3, 15);
   
  Particle(PVector loc){
    this.loc = loc;
    // initialize pvector x y z to 0 
    vel = new PVector();
  }
   
  void draw(){
    if(abs(vel.x) < 0.1 && abs(vel.y) < 0.1){
      vel = newVel();
    } 
    else{
      loc.add(vel);
    }

    vel.mult(0.97);
     
    ellipse(loc.x, loc.y, r, r);
  }
   
  PVector newVel(){
    float xr = random(-180, 180);
    float yr = random(-180, 180);
    return new PVector(sin(radians(xr))*3, cos(radians(yr))*3);
  }
   
  void boundary(){
    if(loc.x <= r+compress) vel.x *= -1;
    if(loc.x >= width-r-compress) vel.x *= -1;
    if(loc.y <= r+compress) vel.y *= -1;
    if(loc.y >= height-r-compress) vel.y *= -1;
  }
}
