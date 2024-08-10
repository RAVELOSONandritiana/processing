void setup(){
 background(10);
 size(600,600);
 fill(0,0,255);
 rect(200,300,100,40);
 fill(0,0,255);
 ellipse(400,300,80,80);
}

void draw(){
  if(rectHover(200,300,100,40) == 1)
  {
    println("Vous etes dans la figure rectangle");
  }
  else{
    int x = mouseX;
    int y = mouseY;
    float d = sqrt(x*x+y*y)-sqrt(400*400+300*300);
    if(d >= 0){
      println("vous etes dans oval");
    }
  }
}

int rectHover(int x1,int y1,int w,int h){
  if(mouseX >= x1 && mouseX <= x1+w && mouseY >= y1 && mouseY <= y1+width)
  {
    if(mousePressed)
    {
      println("appuye");
      fill(0,255,0);
      rect(x1,y1,w,h);
      delay(2000);
    }
    fill(0,0,255);
    rect(x1,y1,w,h);
    return 1;  
  }
  return 0;
}
