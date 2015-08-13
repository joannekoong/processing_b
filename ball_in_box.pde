PVector location, velocity;
float r=-.25, sz=90;
int d=200, frames=300;
 
void setup() {
  // render in 3D 
  size(700, 700, P3D);
  location = new PVector(0, 0, 0);
  velocity = new PVector(2, 3, 1.5);
}
 
void draw() {
  background(0);

  // make ball move 
  location.add(velocity);
  
  // position of box
  translate(width/2, height/2, -170);
  rotateY(r);
  noFill();
  // outline color of box
  stroke(255, 150);
  box(2*d, 2*d, 2*d);
 
  pushMatrix();
  translate(location.x, location.y, location.z);
  if (location.x<-d+sz || location.x>d-sz) velocity.x *= -1;
  if (location.y<-d+sz || location.y>d-sz) velocity.y *= -1;
  if (location.z<-d+sz || location.z>d-sz) velocity.z *= -1;
  noStroke();
  fill(255);
  lights();
  sphere(sz);
  popMatrix();
 
  r += 0.005;
  //saveFrame("image-###.tif");
}
