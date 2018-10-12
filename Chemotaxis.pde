Bacteria ecoli[];
Bacteria salmonella[];
Cell bob = new Cell(250, 100);

void setup() {
  size(500, 500);
  ecoli = new Bacteria[25];
  for(int i = 0; i < ecoli.length; i++) {
    ecoli[i]= new Bacteria(212, 138, 252);
  }
  
  salmonella = new Bacteria[25];
  for(int i = 0; i < salmonella.length; i++) {
    salmonella[i]= new Bacteria(124, 255, 175);
  }
  
  frameRate(10);
}

void draw() {
  background(250, 154, 162);
  for(int j = 0; j < 25; j++) {
    if(dist(bob.myX, bob.myY, ecoli[j].myX, ecoli[j].myY) < 25 || dist(bob.myX, bob.myY, salmonella[j].myX, salmonella[j].myY) < 30) {
      noLoop();
      fill(255);
      textSize(20); 
      textAlign(CENTER);
      text("Game Over", 250, 250);
    }
     ecoli[j].move();
     ecoli[j].show();
     
     salmonella[j].move();
     salmonella[j].show();
  }

  bob.move();
  bob.show();
  
  macrophage(mouseX, mouseY);     

}

void macrophage(int x, int y) {
  translate(x, y);
  for(float i = 0; i < Math.PI * 1.9; i = i + (float)(Math.PI * 2 / 12)) {
    rotate(i);
    stroke(255, 255, 255, 170);
    strokeWeight(15);
    line(0, 29, 0, 31);
    rotate(-i);
  }
  translate(-x, - y);
  noStroke();
  fill(255, 255, 255, 170);
  ellipse(x, y, 50, 50);
  fill(252, 191, 255, 200);
  ellipse(x, y, 50, 50);
  fill(0);
  ellipse(x - 8, y - 3, 5, 5);
  ellipse(x + 8, y - 3, 5, 5);
  fill(245, 104, 116);
  ellipse(x, y + 8, 7, 7);
}

class Cell {
  int myX, myY;
  
  Cell(int x, int y) {
    myX = x;
    myY = y;
  }
  
  void move() {
    myX = myX + (int)(Math.random() * 4) - 2;
  }
  
  void show() {
    noStroke();
    fill(212, 156, 237);
    ellipse(myX, myY, 20, 20);
    fill(173, 249, 255);
    ellipse(myX + 15, myY, 7, 7);
    ellipse(myX + 5, myY + 15, 7, 7);
    fill(255, 218, 173);
    ellipse(myX - 15, myY, 5, 8);
    ellipse(myX, myY - 15, 5, 8);
    fill(250, 202, 250);
    ellipse(myX - 10, myY - 10, 5, 5);
    fill(255, 255, 255, 100);
    ellipse(myX, myY, 50, 50);
  }
}
  
  
class Bacteria {
  int myX, myY, myColor;
  boolean alive;

  Bacteria(int r, int g, int b) {
    myX = (int)(Math.random() * 500);
    myY = (int)(Math.random() * 250) + 250;
    myColor = color(r, g, b);
    alive = true;
  }
  
  void move() {
    myX = myX + (int)(Math.random() * 11) - 5;
    myY = myY + (int)(Math.random() * 11) - 11;
    if(dist(myX, myY, mouseX, mouseY) < 30) {
      alive = false;
    }
  }

  void show() {
    if(alive == true) {
       noStroke();
       fill(myColor);
       ellipse(myX, myY, 20, 20);
       fill(255, 255, 255, 150);
       translate(myX, myY);
       ellipse(0, 0, 30, 30);
       for(float i = 0; i < Math.PI * 1.9; i = i + (float)(Math.PI * 2 / 6)) {
         rotate(i);
         stroke(255, 255, 255, 170);
         strokeWeight(5);
         line(0, 17, 0, 20);
         rotate(-i);
       }
       translate(-myX, -myY);
    }

  }
}