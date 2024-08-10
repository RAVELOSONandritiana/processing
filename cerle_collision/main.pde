ArrayList<Circle> containerCircle = new ArrayList<>();
void setup()
{
  size(400,400);
  background(0);
}

void draw()
{
  background(0);
  for(Circle c:containerCircle)
  {
    c.show();
  }
}

void mouseClicked()
{
 Circle c = new Circle(containerCircle);
 containerCircle.add(c);
 c.setId(containerCircle.size()-1);
}
