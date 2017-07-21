int
  n = 1000,
  w = 80,
  h = 40,
  w2 = w/2,
  h2 = h/2;
float
  k1 = 500,
  k2 = 0.1,
  ks = 25,
  a, b, d, r, f, diam, dx, dy;
float[][]
  initial_pos,
  pos;
 
void setup()
{
    size(1600,800);
    background(-1);
    cursor(CROSS);
    stroke(#DF52FF,50);
    fill(#FFFFFF, 50);
    a = b = r = f = diam = 0;
    initial_pos = new float[n][2];
    pos = new float[n][2];
    for(int i = 0; i < n; i++)
    {
        initial_pos[i][0] = pos[i][0] = random(width);
        initial_pos[i][1] = pos[i][1] = random(height);
     } 
}
 
void draw()
{      
    update();  
    //copy(g, 0, 0, w, h, (w2-mouseX)>>6, (h2-mouseY)>>6, w, h);
    
}
 
void update()
{
    for (int i = 0; i < n; i++)
    {
        a = mouseX - pos[i][0];
        b = mouseY - pos[i][1];
        d = a*a + b*b;
        r = k1 / d;
        dx = initial_pos[i][0] - pos[i][0];
        dy = initial_pos[i][1] - pos[i][1];
        pos[i][0] += dx*k2 - a*r;
        pos[i][1] += dy*k2 - b*r;
        f = atan2(b, a);
        diam = ks * f;
        
        pushMatrix();
          translate(pos[i][0], pos[i][1]);
          rotate(f*8);
           ellipse((diam/w)+(w/2), -diam/2, (diam/h)+(w/2), (-diam/4) - mouseX / 180);
        popMatrix();
    }
}


