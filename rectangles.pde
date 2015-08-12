size(1000,800);

void setup() {
    background(random(255), random(255), random(255));
    fill(random(255), random(255), random(255));
}

void draw() {
    int diameter = random(50);
    rect(mouseX, mouseY, diameter, diameter);
}