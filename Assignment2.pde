/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

//amount of small particles
final int AMOUNT_OF_PARTICLES = 600;
//Emotions and particles lists
ArrayList<Emotion> emotions = new ArrayList<Emotion>();
ArrayList<Particle> particles = new ArrayList<Particle>();
//state variable, true if dragging an emotion
boolean dragging = false;
//temp emotion variable
Emotion em;

/*Main Method*/
void setup(){
  //Screen Size
  size(1920, 1080);
  //Variables
  int count = 0;
  color ranC;
  
    /*Adding emotions to the emotions list*/
    emotions.add(new Anger(random(0, width), random(0, height), #FF0000, 30, 200));    //Anger
    emotions.add(new Joy(random(0, width), random(0, height), #FFFF00, 30, 200));      //Joy
    emotions.add(new Love(random(0, width), random(0, height), #FF69B4, 30, 200));     //Love
    emotions.add(new Sadness(random(0, width), random(0, height), #0000FF, 30, 200));  //Sadness
    emotions.add(new Fear(random(0, width), random(0, height), #FFFFFF, 30, 200));     //Fear
    emotions.add(new Surprise(random(0, width), random(0, height), #228B22, 30, 200)); //Surprise
    /**/
  
  /*Adding particles to the particles list*/
  while(count < AMOUNT_OF_PARTICLES){
    //choose a random colour
    ranC = color(random(255), random(255), random(255));
    //add a particle to the list with that colour
    particles.add(new Particle(random(0, width), random(0, height), ranC, 5));
    //increment the counter
    count++;
  }
  
}

/*Draw Method*/
void draw(){
  //set the background to black
  background(0);
  //for each particle in the list
  for(Particle p: particles){
    //run the particle and pass it the list
    p.run(particles);
  }
  
  //for each emotion in the list
  for(Emotion e: emotions){
    
    //if nothings already being dragging and an emotion is clicked
    if(e.isClicked() && dragging == false){
      //set dragging to true
      dragging = true;
      e.setDragging(true);
      //save a reference to the emotion clicked on so we can set its dragging to off later
      em = e;
    }
    
    //if the mouse is released and dragging is still set to true
    if(!mousePressed && dragging == true){
      //set dragging to false
      dragging = false;
      em.setDragging(false);
    }
    //if not dragging
    if(!dragging){
      //set the particles to their default appearance
      for(Particle p: particles){
        p._colour = p._tempColour;
        p._size = p._tempSize;
      }
      //set the cursor to default pointer
      cursor(ARROW);
    }else{
     //if dragging set cursor to the hand
     cursor(HAND); 
    }
    //run each emotion particle
    e.run(particles);
  }
}
