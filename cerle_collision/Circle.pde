class Circle
{
  private int x;
  private int y;
  private int rayon;
  private int depX;
  private int depY;
  private int id;
  private int color1,color2,color3;
  private ArrayList<Circle> indexCircle;
  
  public Circle(ArrayList<Circle> index)
  {
    this.x = mouseX;
    this.y = mouseY;
    this.depX = (int)random(1,3);
    this.depY = (int)random(1,3);
    int dirX = (int)random(0,100);
    int dirY = (int)random(0,100);
    this.depX = dirX%2==0 ? -this.depX:this.depX;
    this.depY = dirY%2==0 ? -this.depY:this.depY;
    this.rayon = (int)random(10,30);
    this.indexCircle = index;
    this.color1 = (int)random(0,255);
    this.color2 = (int)random(0,255);
    this.color3 = (int)random(0,255);
  }
  
  public void show()
  {
    fill(this.color1,this.color2,this.color3);
    ellipse(this.x,this.y,this.rayon,this.rayon);
    this.x += this.depX;
    this.y += this.depY;
    if(this.x <= this.rayon/2 || this.x >= width-this.rayon/2)
    {
      this.depX = this.x <= this.rayon/2 ? (int)random(1,5) : -(int)random(1,5);
    }
    if(this.y <= this.rayon/2 || this.y >= height-this.rayon/2)
    {
      this.depY = this.y <= this.rayon/2 ? abs(this.depY) : -abs(this.depY);
    }
    this.collision();
  }
  
  public void printElement()
  {
    for(Circle element : indexCircle)
    {
     println(element); 
    }
  }
  
  public void collision()
  {
    int partie = 0;
    for(Circle ball : indexCircle)
    {
      if(partie != this.id)
      {
         float distance = sqrt( pow(this.x-ball.x,2) + pow(this.y-ball.y,2) ) - (this.rayon / 2 + ball.rayon / 2);
         if(distance < 0)
         {
            if(this.x <= ball.x)
            {
              this.depX = -abs(this.depX);
              ball.depX = abs(ball.depX);
            }
            if(this.y <= ball.y)
            {
              this.depY = -abs(this.depY);
              ball.depY = abs(ball.depY);
            }
         } 
      }
       partie++;
    }
  }
  
  public void setId(int indexCreation)
  {
    this.id  = indexCreation;
  }
  
}
