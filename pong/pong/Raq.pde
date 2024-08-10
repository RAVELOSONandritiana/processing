class Raq{
 private int x,y,a,b = 255,c,l=100; 
 private int depG = 0;
 private int depD = 0;
 Raq(){}
  
 public void setVal(int x,int y)
 {
   this.x = x;
   this.y = y;
 }
 
 public int getCoords(char c)
 {
   return c == 'x'?this.x:c == 'y'?this.y:this.l;
 }
 
 public void setDepD(int x)
 {
   if(this.x+this.l/2+x < width-2)
   {
     this.depD = x;
     this.depG = 0;
   }
   else{
    this.keyClear(); 
   }
 }
 
 public void setDepG(int x)
 {
   if(this.x+x-this.l/2 > 0)
   {
     this.depG = x;
     this.depD = 0;
   }
   else{
    this.keyClear(); 
   }
 }
 
 public void setColor(int a,int b,int c)
 {
   this.a = a;
   this.b = b;
   this.c = c;
 }
 
 public void keyClear()
 {
  this.depG = 0;
  this.depD = 0;
 }

  public void draw()
  {
   fill(this.a,this.b,this.c);
   this.x += this.depG+this.depD;
   rect(this.x-this.l/2,this.y,this.l,20);
  }
}
