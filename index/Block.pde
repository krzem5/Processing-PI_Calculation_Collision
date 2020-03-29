class Block {
  double pos, vel;
  double mass;
  int w;
  int mx;
  Block(double pos, double vel, double mass, int w, int mx) {
    this.pos=pos;
    this.vel=vel;
    this.mass=mass;
    this.w=w;
    this.mx=mx;
  }
  void update() {
    this.pos+=this.vel;
  }
  boolean hitWall() {
    return (this.pos<=0);
  }
  double bounce(Block b) {
    return (this.mass-b.mass)/(this.mass+b.mass)*this.vel+(2*b.mass/(this.mass+b.mass))*b.vel;
  }
  boolean collide(Block b) {
    return !(this.pos+this.w<b.pos||this.pos>b.pos+b.w);
  }
  void draw() {
    rect(constrain((float)this.pos, this.mx, width), height/2-this.w, this.w, this.w);
  }
}
String df(String d) {
  while (d.length()<18) {
    d+="0";
  }
  return d;
}
