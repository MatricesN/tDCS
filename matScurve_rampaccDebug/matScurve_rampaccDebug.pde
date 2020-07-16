int t = 0;

float currentPos,lastSetPos,setPos,lastsetPos = 0;
float currentVelo,nextVelo,targetVelo;
float acc;

float dPos, dVelo,dAcc;

float veloRatio, accRatio;

void setup()
{
  size(1000,600);
  background(100,100,100);
  frameRate(100);
  
  //y=0 line
  stroke (255);
  line (0,300,1000,300);
  
  veloRatio = 0.05;                               //velocity ratio
  accRatio  = 0.05;                                 //acceleration ratio 
}

void draw()
{
  if (t==100)  setPos=70;
  if (t==200)  setPos=0;
  if (t==300)  setPos=-100;
  if (t==400)  setPos=200;
  if (t==600)  setPos=0;
  if (t==700)  setPos=150;
  if (t==800)  setPos=90;
  if (t==900)  setPos=200;
  
  updateVal(); 
  plotVal();  
  
  t++;
  if (t==1000) noLoop();
  //t=(t<=1000)?t+1:0;
}

void updateVal()
{
  dPos        =    setPos-currentPos;            //distance from target
  targetVelo  =    (dPos*veloRatio);             //ideal instantaneous velocity
  
  dVelo       =    targetVelo-currentVelo;       //difference between ideal and actual velocity
  acc         =    (dVelo*accRatio);             //acceleration calculated based on difference in velocities
  
  nextVelo    =    currentVelo+acc;              //trim velocity for next point
  currentPos  +=   nextVelo;                     //add trimmed velocity to change position
}

void plotVal()
{
  //set position
  stroke (255,0,0);
  line (t,300-lastSetPos,t,300-setPos);
  
  //actual position
  stroke (255,255,0);
  point (t,300-currentPos);
  
  //actual velocity
  stroke (0,255,0);
  line (t,300-(currentVelo*20),t,300-(nextVelo*20));
  
  //actual acceleration
  stroke (0,0,255);
  point (t,300-(acc*100));
  
  lastSetPos=setPos;
  currentVelo=nextVelo;
  println(acc);
} //<>//
