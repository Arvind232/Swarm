// Particles - Move around
// When meeting other particles
// Reproduce or Fight

ArrayList <Borg> borgs;

void setup() {
    size(600, 600);
    borgs = new ArrayList();
    for (int i=0; i<200; i++) {
        borgs.add(new Borg(random(width), random(height)));
    }
}

void checkCollisions() {
    ArrayList <Borg> toDie = new ArrayList();
    ArrayList <Borg> toCreate = new ArrayList();
    for (int a=0; a<borgs.size(); a++) {
        Borg p = borgs.get(a);
        for (int b=a+1; b<borgs.size(); b++) {
            Borg q = borgs.get(b);
            PVector pq = new PVector(q.x - p.x, q.y - p.y);
            if (pq.mag() < 50) {
                line(p.x, p.y, q.x, q.y);

                float sim = p.vx * q.vx + p.vy * q.vy;
                
                if (sim > 1) {
                    toCreate.add(new Borg((p.x+q.y) / 2.0, (p.y+q.x) / 2.0));
                }
                if (sim < -0.5) {
                    toDie.add(p);
                }
            }
        }
    }
    borgs.removeAll(toDie);
    borgs.addAll(toCreate);
}


void draw() {
    fill(borgs.size(), 200, 200, 1);
    rect(0, 0, width, height);

    for (Borg b: borgs) {
        b.update();
    }
    checkCollisions();
    for (Borg b: borgs) {
        b.draw();
    }
    println(borgs.size());
}
 