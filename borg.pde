class Borg {
    float x, y, vx, vy;

    public Borg() {
    }
    public Borg(float x, float y) {
        this.x = x;
        this.y = y;
        this.vx = random(-1, 1);
        this.vy = random(-1, 1);
    }    
    void update() {
        this.vx += random(-0.01, 0.01);
        this.vy += random(-0.01, 0.01);

        this.x += this.vx;
        this.y += this.vy;
        this.x = (this.x + width ) % width;
        this.y = (this.y + height ) % height;

    }
    void draw() {
        fill(255);
        // ellipse(x, y, 10, 10);
    }
}