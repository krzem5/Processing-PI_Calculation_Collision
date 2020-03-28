Block b1, b2;
int digits=9;
float timeSteps=pow(10, digits-1);
int count=0;
int target=314159265;
void setup() {
  size(800, 600, P2D);
  b1=new Block(1, 0, 1, 1, 0);
  b2=new Block(2, (float)-1/timeSteps, pow(100, digits-1), 1, 1);
}
void draw() {
  background(0);
  for (int i=0; i<timeSteps; i++) {
    if (b1.collide(b2)) {
      double v1=b1.bounce(b2);
      double v2=b2.bounce(b1);
      b1.vel=v1;
      b2.vel=v2;
      count++;
    }
    if (b1.hitWall()) {
      b1.vel*=-1;
      count++;
    }
    b1.update();
    b2.update();
  }
  b1.draw();
  b2.draw();
  textAlign(RIGHT, BOTTOM);
  textFont(createFont("consolas", 20));
  text(count, width, height-20);
  text(target, width, height);
  if (abs((float)b1.vel)<abs((float)b2.vel)&&b2.vel>0){noLoop();print("END!");}
}
