void setup() {
	size(1200,800);
	background(random(250), random(250), random(250)); 
	noStroke(); 
} 

void draw() {
	float r= random(255);
	float g= random(255);
	float b= random(255);
	stroke(r,g,b,175);
	fill(r,g,b,175);
	float x = random(width);
	float y = random(height);
	ellipseMode(CENTER);
	ellipse(x,y,random(10),random(10));
}