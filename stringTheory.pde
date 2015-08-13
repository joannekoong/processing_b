// example taken from particlesAKE taken from akeric
// this is SO DAMN COOL 
 
ParticleGenerator pg;
boolean makeParticles;
 
void setup() {
  size(1000, 700);
  makeParticles =  false;
  pg = new ParticleGenerator();
}
 
void draw() {
  background(0);
  pg.run();
}
 
void mousePressed(){
  makeParticles = true;
}

void mouseReleased(){
  makeParticles = false;
}

class ParticleGenerator {
  ArrayList<Particle> particles;
  ArrayList<Particle2> particles2;
  PVector pos;
 
  ParticleGenerator() {
    pos = new PVector();
    particles = new ArrayList<Particle>();
    particles2 = new ArrayList<Particle2>();
  }
 
  void run() {
    if (makeParticles) {
      pos.set(mouseX, mouseY);
      // limit particle generation frequency
      if (frameCount % 5 == 0) {
        particles.add(new Particle(pos));
      }
      // increase frequency
      for (int i = 0; i < 5; i++) {
        particles2.add(new Particle2(pos));
      }
    }
    for (int i = particles.size ()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
    for (int i = particles2.size ()-1; i >= 0; i--) {
      Particle2 p = particles2.get(i);
      p.run();
      if (p.isDead()) {
        particles2.remove(i);
      }
    }
    connect();
  }
 
  // skinny lines from Keith Peters
  void connect() {
    for (int outer = 0; outer <  particles.size ()-1; outer++) {
      for (int inner = outer + 1; inner <  particles.size (); inner++) {
        Particle p1 = particles.get(outer);
        Particle p2 = particles.get(inner);
        float dist = PVector.dist(p1.pos, p2.pos);
        float max = 120;
        if (dist < max) {
          float alpha =  max * (pow(1/(dist/(2 * max)+1), 6));
          stroke(255, alpha*3);
          strokeWeight(1);
          line(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
        }
      }
    }
  }
}
 
class Particle {
  PVector pos;
  PVector vel;
  float lifespanFill, lifespanStroke, sze;
  color c;
 
 
  Particle(PVector l) {
    vel = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    pos = l.get();
    lifespanFill = 255;
    lifespanStroke = 255;
    c = color(random(255), random(255), 0);
    sze = random(5,40);
    ellipseMode(CENTER);
  }
 
  void run() {
    move();
    display();
  }
 
  void move() {
    pos.add(vel);
    lifespanFill -= .6;
    lifespanStroke -= .4;
    sze += .05;
  }
 
  void display() {
    strokeWeight(1);
    stroke(255, lifespanStroke);
    fill(c, lifespanFill);
    ellipse(pos.x, pos.y, sze, sze);
  }
 
  boolean isDead() {
    if (lifespanStroke < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
 
// champagne bubbles
class Particle2 {
  PVector pos;
  PVector vel;
  float lifespan;
 
  Particle2(PVector l) {
    pos = l.get();
    vel = new PVector(random(-2, 2), random(-2, 2));
    vel.mult(.4);
    lifespan = 255;
  }
 
  void run() {
    move();
    display();
  }
 
  void move() {
    pos.add(vel);
    lifespan -= 2;
  }
 
  void display() {
    stroke(255);
    point(pos.x, pos.y);
  }
 
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
