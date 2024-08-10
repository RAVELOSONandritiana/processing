class Balle{
 private int x;
 private int y;
 private int h;
 private int a = 255;
 private int b = 0;
 private int c = 0;
 private int depX = 3;
 private int depY = 1;
 private String place1;
 private String place2;
 private Raq r1;
 private Raq r2;
 Balle(){}
   
 public void setX(int x)
 {
   this.x = x;
 }
 
 public void setY(int y)
 {
  this.y = y; 
 }
 
 public void setH(int h)
 {
  this.h = h; 
 }
 
 public void setVal(int x,int y,int h)
 {
   this.setX(x);
   this.setY(y);
   this.setH(h);
 }
 
 public void setColor(int a,int b,int c)
 {
  this.a = a;
  this.b = b;
  this.c = c;
 }
 
 public void setRaqH(Raq r1)
 {
   this.r1 = r1;
   this.place1 = "haut";
 }
 
 public void setRaqB(Raq r2)
 {
   this.r2 = r2;
   this.place2 = "bas";
 }
 
 public void draw()
 { 
   fill(this.a,this.b,this.c);
   ellipse(this.x,this.y,this.h,this.h);
   this.setX(this.x+this.depX);
   this.setY(this.y+this.depY);
   if(this.x <= this.h/2 || this.x >= width-this.h/2)
   {
     this.depX = this.x <= this.h/2 ? (int)random(3,5) : -(int)random(3,5);
   }
   if(this.y <= this.h/2 || this.y >= height-this.h/2)
   {
     this.depY = this.y <= this.h/2 ? (int)random(3,5) : -(int)random(3,5);
   }
   
   if(this.collisionB() == true)
   {
     int dg = this.r2.depG;
     this.depX = dg == 0 ? (int)random(5,8) : -(int)random(5,8);
     this.depY = -(int)random(3,5);
   }
   else if(this.collisionH() == true)
   {
     int dg = this.r1.depG;
     this.depX = dg == 0 ? (int)random(5,8) : -(int)random(5,8);
     this.depY = (int)random(3,5);
   }
 }
 
 public boolean collisionH()
 {
   if(this.place1.equals("haut"))
   { 
     int rx = this.r1.getCoords('x');
     int ry = this.r1.getCoords('y');
     int rl = this.r1.getCoords('l');
     if(this.y-this.h/2 <= ry+20 && this.x+this.h/2 >= rx-rl/2 && this.x-this.h/2 <= rx+rl/2)
     {
        //noLoop();
        return true;
     }
   }
  return false;
 }
 
 public boolean collisionB()
 {
   if(this.place2.equals("bas"))
   {
     int rx = this.r2.getCoords('x');
     int ry = this.r2.getCoords('y');
     int rl = this.r2.getCoords('l');
     if(this.y+this.h/2 >= ry && this.x+this.h/2 >= rx-rl/2 && this.x-this.h/2 <= rx+rl/2)
     {
        return true;
     }
   }
  return false;
 }
}
   
