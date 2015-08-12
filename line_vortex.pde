void setup() {	
	size(1000,800);	
	background(random(250),random(250),random(250));
	stroke(177,239,255);
}
		  
void draw() {
	line(mouseX,mouseY,0,0);
	line(mouseX,mouseY,600,400);
	line(mouseX,mouseY,600,0);
	line(mouseX,mouseY,0,400);
	line(mouseX,mouseY,300,0);
	line(mouseX,mouseY,300,400);
	line(mouseX,mouseY,0,200);
	line(mouseX,mouseY,400,200);
}
 
void mousePressed() {
	background(random(250), random(250), random(250));
}