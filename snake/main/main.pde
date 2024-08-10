int index[][] = {
  {90,190},
  {110,190},
  {130,190},
  {150,190}
};
int dep = 20;
int g = 0;
int radius = 10;
String direction = "right";//direction pris par le Snake , droite au debut
int deplacementX = dep;
int deplacementY = 0;
int taille = 4;//taille de depart du Snake , change a chaque fruit obtenu
int coords_fruit[][] = {{0,0}};
int frame = 10;
Boolean status_game = true;
Boolean collisionCoprps = true;
void setup()
{
  size(400,400);
  background(255);
  for(int tab[] : index)
  {
    int x = tab[0];
    int y = tab[1];
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(x,y,20,20);
  }
  fruit();
  delay(2000);
}

void draw()
{
  if(status_game == true)
  {
    background(255);
    fill(0);
    textSize(10);
    text("Score : "+(taille-4),10,10);
    fill(0,0,255);
    ellipse(coords_fruit[0][0],coords_fruit[0][1],20-g,20-g);
    g++;
    if(g == 10){
     g = 0; 
    }
    int newIndex[][] = new int[taille][2];
    int dernier[][] = {{0,0}};
    for(int i = 0;i < 1;i++)
    {
      fill(0);
      int partie = 0;//designe la partie du corps a prendre
      for(int tab[] : index){
        if(partie == 0)
        {
          int x = tab[0];
          int y = tab[1];
          rectMode(CENTER);
          if(direction == "right")
            rect(x+deplacementX,y+deplacementY,20,20,1,radius,radius,1);
          if(direction == "left")
            rect(x+deplacementX,y+deplacementY,20,20,radius,1,1,radius);
          if(direction == "up")
            rect(x+deplacementX,y+deplacementY,20,20,radius,radius,1,1);
          if(direction == "down")
            rect(x+deplacementX,y+deplacementY,20,20,1,1,radius,radius);
          newIndex[0][0] = x+deplacementX;
          newIndex[0][1] = y+deplacementY;
        }
        else
        {
          int x = index[partie-1][0];
          int y = index[partie-1][1];
          dernier[0][0] = index[partie][0]%400;
          dernier[0][1] = index[partie][1]%400;
          rectMode(CENTER);
          rect(x,y,20,20);
          newIndex[partie][0] = x;
          newIndex[partie][1] = y;
        }
        partie++;
      }
    }
    if(collision(coords_fruit,index,0) == 1)
    {
      fruit();
      fill(0);
      rect(dernier[0][0],dernier[0][1],20,20);
      int newCorpsSnake[][] = new int[++taille][2];
      for(int i = 0;i < taille-1;i++)
      {
        newCorpsSnake[i][0] = newIndex[i][0];
        newCorpsSnake[i][1] = newIndex[i][1];
      }
      newCorpsSnake[taille-1][0] = dernier[0][0];
      newCorpsSnake[taille-1][1] = dernier[0][1];
      index = new int[taille][2];
      index = newCorpsSnake;
    }
    else{
      index = newIndex;
    }
    frameRate(frame);
    echec(index);    
  }
}

void keyPressed()
{
  int keyIndex = keyCode;
  if(keyIndex == 32){
    status_game = status_game == true ? false : true;
  }
  if(status_game == true && (keyIndex == UP || keyIndex == DOWN || keyIndex == LEFT || keyIndex == RIGHT))
  {
     if(keyIndex == UP && direction != "down")
     {
       direction = "up";
       deplacementX = 0;
       deplacementY= -dep;
     }
     else if(keyIndex == DOWN  && direction != "up")
     {
       direction = "down"; 
       deplacementX = 0;
       deplacementY = dep;  
     }
     else if(keyIndex == RIGHT  && direction != "left")
     {
       direction= "right";
       deplacementX = dep;
       deplacementY= 0;
     }
     else if(keyIndex == LEFT  && direction != "right")
     {
       direction = "left"; 
       deplacementX = -dep;
       deplacementY= 0;
     }
  }
}

void echec(int index[][])
{
  for(int element[]:index)
  {
    int x = element[0];
    int y = element[1];
    if(x > 400 || x < 0 || y < 0 || y > 400)
    {
      fill(255,0,0);
    textSize(30);
    text("Game Over : "+(taille-4),100,200);
      noLoop();
    }
  }
  if(collision(index,index,2) == 1 && collisionCoprps == true)
  {
    fill(255,0,0);
    textSize(30);
    text("Game Over : "+(taille-4),100,200); 
    noLoop(); 
  }
}


void fruit(){
  int x = int(random(0,20))*20+10;
  int y = int(random(0,20))*20+10;
  while(contains(index,x,0)){
    x = int(random(0,20))*20+10;
  }
  while(contains(index,y,1)){
    y = int(random(0,20))*20+10;
  }
  fill(0,0,255);
  ellipse(x,y,20,20);
  coords_fruit[0][0] = x;
  coords_fruit[0][1] = y;
}

Boolean contains(int index[][],int x,int i)
{
  for(int tab[]:index)
  {
    int a = tab[i];
    if(a == x)
    {
      return true;
    }
  }
  return false;
}

int collision(int [][]coords_fruit,int [][]index,int diff)
{
 int x_fruit = coords_fruit[0][0];
 int y_fruit = coords_fruit[0][1];
 int partie = 0;
 for(int corps[]:index)
 {
      if(partie > diff)
   {
     int x_snake = corps[0];
     int y_snake = corps[1];
     float distance = sqrt( (x_fruit-x_snake)*(x_fruit-x_snake) + (y_fruit-y_snake)*(y_fruit-y_snake));
     if(distance-20 < 0)
     {
       return 1; 
     } 
   }
   partie++;
 }
 return 0;
}
