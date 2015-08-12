void setup() {
  size(1200,800);
  background(random(250),random(250),random(250));

}

void draw() {

    // background(random(250), random(250), random(250)); = blinking background
    // background(200, 200, 200) = fixed background refreshes every instant 
    translate(mouseX, mouseY); 
    
    pushMatrix();

    rotate(map (millis(), 0, 3000, 0, TWO_PI));
    
    fill(123,72,114);
    rect(-105, -105, 100, 100);
    
    fill(236,213,101);
    rect(+5, + 5, 100, 100); 
 
    popMatrix();
    
    pushMatrix();
    rotate(map (millis(), 0, 3000, 0, -TWO_PI));

    fill(54,131,182);
    rect(-105, + 5, 100, 100);
    
    fill(232,166,103);
    rect(5, -105, 100, 100);    
    
    popMatrix();    
    
    fill(78,195,124);
    ellipse(0, 0, 100, 100);    

}