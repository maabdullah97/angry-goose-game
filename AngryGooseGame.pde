Goose goose;
Target target;

void setup() {
  size(800, 400);
  goose = new Goose(100, height/2);
  target = new Target(600, 200);
}

void draw() {
  background(135, 206, 235); // light blue background

  goose.update();
  goose.display();

  target.display();

  if (goose.hits(target)) {
    target.reset();
  }

  fill(0);
  textSize(24);
  text("ANGRY GOOSE – Hit the target!", 20, 30);
}

void keyPressed() {
  goose.handleKey(keyCode);
}

// Goose class
class Goose {
  float x, y;
  float speed = 5;
  color gooseColor = color(255, 255, 0);  // YELLOW goose

  Goose(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void update() {
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  void display() {
    fill(gooseColor);
    noStroke();
    ellipse(x, y, 40, 30); // body
    triangle(x+20, y, x+30, y-5, x+30, y+5); // beak
    fill(0);
    ellipse(x+10, y-5, 5, 5); // eye
  }

  void handleKey(int k) {
    if (k == UP) y -= speed;
    if (k == DOWN) y += speed;
    if (k == LEFT) x -= speed;
    if (k == RIGHT) x += speed;
  }

  boolean hits(Target t) {
    float d = dist(x, y, t.x, t.y);
    return d < 40;
  }
}

// Target class
class Target {
  float x, y;
  color c = color(255, 100, 100);

  Target(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void display() {
    fill(c);
    noStroke();
    rect(x-15, y-15, 30, 30); // red box target
  }

  void reset() {
    x = random(200, width - 50);
    y = random(50, height - 50);
  }
}
