
/*  the character represents how i will react to the stress of the upcoming exam.
    the red number in the background represents the date that the character is in .
    the date in the circle means the exam date.
    if the user click on the top left cornor, the girl will look at that direction , she will look at different direction if the user click on the top right cornor and the bottom of the windo.
    if the user click on her face , she will look suprise at the first time , and her face will turn red and she will jump up at the second time.
    if the user click on her left leg, she will run to the left side, and turn back to original place if she reaches the edge of the window.
    if the user click on her right leg, she will run to the right side, and turn back to original place if she reaches the edge of the window.
    if the user click on the date that cicled by the crayon , the date on the background will change, it means the day to the exam is nearer and nearer, the character will fell panic with the date changing .
 She will look a little scared when the user click on the date which is marked at the first time, then she will look very stressed and scared when the user clicks the same place at the second time.
 And when the user clicks at the date at the third time , the date will come back to the first date(which is 3rd November) ,and the character will return to normal again.
    All images are created by myself,therefore there is no citation for the images.
*/


PImage imgStefonStand,backgroundImage;
int imgX,imgY;
int move;
int timeTouchTheEdge;
int speedX,speedY;
int face,jump;
boolean turnRed;
int day;

void setup()
{ 
  //create the initial image for the character and the background
  imgStefonStand=loadImage("stefonleft.png");
  backgroundImage=loadImage("background.jpg");
  //set the window's size as the same as the background image
  size(backgroundImage.width,backgroundImage.height);
  imgX=width/2;
  imgY=height/2;
  move=0;
  turnRed=true;
  speedX=-1;
}
void draw()
{ 
  background(backgroundImage); 
  speedY=-1;
  imageMode(CENTER);
  //if variable move equals to 1, the character should move to left side, and turn to the opposite side after reaching the edge of the window
  if(move==1)
  { 
    imgX+=speedX;
    if(imgX-imgStefonStand.width/2<=0)
    { 
      imgStefonStand=loadImage("walkright.png");
      imgX=imgX+10;
      speedX*=-1;
    }
    //return to the initial position
    if(imgX==width/2)
    {
      speedX=0;
      imgStefonStand=loadImage("stefonleft.png");
      timeTouchTheEdge=0;
      setup();
    }
  }
   //if variable move equals to 2, the character should move to right side, and turn to the opposite side after reaching the edge of the window
    if(move==2)
   { 
    imgX-=speedX;
    if(imgX+imgStefonStand.width/2>=width)
     {
      imgStefonStand=loadImage("walkleft.png");
      speedX*=-1;
      }
       //return to the initial position
      if(imgX==width/2)
     {
      speedX=0;
      imgStefonStand=loadImage("stefonleft.png");
      timeTouchTheEdge=0;
      setup();
      }
    }
    //if the boolean variable is false,the character will jump up
  if(turnRed==false)
  {
    imgY+=speedY;
    
    if((imgY<=height/2-10)||(imgY>=height/2))
    {
      speedY*=-1;
      jump++;   
    }
    //the character return to the initial position 
    if(jump>=8)
    {
      speedY=0;
     imgStefonStand=loadImage("stefonleft.png");
      jump=0;
      setup();
    }
    
  }
  //draw the charater's image
  image(imgStefonStand,imgX,imgY);
 
 
}
void mouseClicked()
{ 
  if(mouseY<=imgY)
  {//if the user click on the character's face,her face will react different
  if(mouseY>imgY-130&&mouseY<=imgY-30&&mouseX>=imgX-50&&mouseX<=imgX+50)
  {
    face++;
    //if the user click on the character's face the first time, she will look suprise
  if(face%2!=0)
   {
     imgStefonStand=loadImage("suprise1.png");
   }
   //if the user click on the character's face the second time, her face will turn red and she will jump up
   if(face%2==0)
   {
     imgStefonStand=loadImage("suprise2.png");
     turnRed=false;
   }
  }
  //if the user click on the top right cornor, she will look at the same direction
  else if(mouseX>=imgX)
  {
    imgStefonStand=loadImage("stefonright.png");
  }
  //if the user click on the top left cornor, she will look at the same direction
 else 
  {
     imgStefonStand=loadImage("stefonleft.png");
  }
 }
  else 
  {
    if(mouseY>imgY+40&&mouseY<=imgY+140)
  {//the reaction that the user clicks on the character's left leg
    if(mouseX>=imgX-60&&mouseX<=imgX)
    {
      move=1;
    imgStefonStand=loadImage("walkleft.png");
    }
   //the reaction that the user clicks on the character's right leg
    if(mouseX>=imgX+17&&mouseX<=imgX+40)
    {
      move=2; 
     imgStefonStand=loadImage("walkright.png");
    }
  }
  //write the reaction that if the user click in the area near the exam date(24th November)
    else if(mouseX>=imgX+100&mouseX<=imgX+200&&mouseY>=imgY+100&&mouseY<=imgY+190)
  {
   day++;
   //if the date become 13th November,the character will look a little scared 
   if(day==1)
   {
     backgroundImage=loadImage("background2.jpg");
     imgStefonStand=loadImage("exam1.png");
   }
    //if the date become 23th November,the character will react stressed and nervous
   if(day==2)
   {
     backgroundImage=loadImage("background3.jpg");
     imgStefonStand=loadImage("exam2.png");
     
   }
   //if the user click the third time on the exam date, the date will go back to 3rd November, the charcter will become normal again
   if(day==3)
    {
     setup();
     day=0;
    }
   }
   //if the user click at the bottom area of the window except for the exam date, the character will look down
   else 
   {
    imgStefonStand=loadImage("stefondown.png");}
   }
}