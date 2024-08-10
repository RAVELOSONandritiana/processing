int w_brique = 40;
int h_brique = 20;
void setup(){
  size(600,600);
  int nb_depart = 600/w_brique;
  background(20);
  for(int i = 0;i<600;i+=w_brique)
  {
    int n = 0;
      for(int j = 600-h_brique;j > 0;j-=h_brique)
      {
        int x1 = i;
        int y1 = j;
        stroke(3);
        strokeWeight(3);
        fill(random(255),random(255),random(255));
        rect(x1+(n*w_brique/2),y1,w_brique,h_brique);
        n++;
        if(n == nb_depart)
        {
          break;
        }
    }
      nb_depart--;
  }
}

void draw(){
  
}
