Balle balle = new Balle();
Raq r1 = new Raq();
Raq r2 = new Raq();
int vD = 4;

void setup()
{
  size(600,600);
  background(0);
  balle.setVal(width/2,height/2,20);
  r1.setVal(width/2,10);
  r2.setVal(width/2,height-30);
  balle.setRaqH(r1);
  balle.setRaqB(r2);
  delay(200);
}

void draw()
{
    background(0);
    balle.draw();
    r1.draw();
    r2.draw();
    frameRate(100);
}

void keyPressed()
{
 int k = keyCode;
 if(k == LEFT)
 {
  r2.setDepG(-vD);
 }
 else if(k == RIGHT)
 {
   r2.setDepD(vD);
 }
 
 char c = key;
 if(c == 'a' || c == 'A')
 {
   r1.setDepG(-vD);
 }
 else if(c == 'd' || c == 'D')
 {
   r1.setDepD(vD);
 }
 
}


void keyReleased()
{
 int k = keyCode;
 if(k == LEFT || k == RIGHT)
 {
  r2.keyClear(); 
 }
 
 if(key == 'a' || key == 'A' || key == 'd' || key == 'D')
 {
  r1.keyClear(); 
 }
}
