SnowFlake[] snow;

int numsnow = 300;

void setup()
{
  snow = new SnowFlake[numsnow];
  for(int i = 0; i < snow.length; i++)
  {
    snow[i] = new SnowFlake();
  }
  size(300,300);
  background(0);
  noStroke();
}
void draw()
{
  for(int i = 0; i < snow.length; i++)
  {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}
void mouseDragged()
{
  strokeWeight(10);
  if(mouseButton==RIGHT)
  {
    stroke(0);
  }
  else
  {
    stroke(255,0,0);
  }
  line(mouseX,mouseY,pmouseX,pmouseY);
  noStroke();
}

class SnowFlake
{
  int size = 7;
  int x,y;
  boolean isMoving;
  SnowFlake(){
    x = (int)(Math.random()*300);
    y = (int)(Math.random()*300);
    isMoving = true;
  }
  void show()
  {

    fill(255,255,255);
    ellipse(x,y,size,size);
  }
  void lookDown()
  {
    if(x>= 2 && x< 298 && y >= 0 && y < 290 && (get(x-2,y+5)!=color(0,0,0) || get(x+2,y+5)!=color(0,0,0)))
    {
      isMoving = false;
    }
    else
    {
      isMoving = true;
    }
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,size+2,size+2);
  }
  void move()
  {
    if(isMoving)
    {
      y++;
    }
  }
  void wrap()
  {
    if(y > 300)
    {
      y = 0;
      x = (int)(Math.random()*300);
    }
  }
}


