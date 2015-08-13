void setup () {
  background(random(250), random(250), random(250));
  size (1200, 1200);
  smooth();
}
 
void draw () {

  stroke(#57385c, 60);

  float angle = map(mouseX, 0, width, 0, PI/4);
 
  translate(width/2, height/2);
  Rect(400, angle);
}
 
void Rect(float rectSize, float angle) {
  
  if (rectSize > 15) {
    rotate(angle);
    rect(-rectSize/2, -rectSize/2, rectSize, rectSize);
     
    Rect(rectSize - 5, angle);
  }
}
