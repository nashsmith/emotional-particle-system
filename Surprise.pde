/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

class Surprise extends Emotion {
 
  /*Constructor*/
  public Surprise(float x, float y, color c, int size, int ringRadius){
    super(x, y, c, size, ringRadius);
    //used in top left of screen
    _emotion = "Surprise";
   }
   
   /*Makes the particles in the emotions orbit grow and shrink like they got surprised*/
   public void affectParticles(ArrayList<Particle> l){
    
     //for each particle
    for(Particle p: l){
     //if the particle is in the emotions orbit
      if(Math.sqrt(Math.pow((_position.dist(p._position)), 2)) < _ringRadius/2){
        //set it unable to collide with things (it can still move normally through the orbit
        p.setCollided(true);
        //change its colour to that of the emotion
        p.setColor(_colour);
        //if the particle has reached its max size
        if(p._size > p._tempSize + 10){
          //set it back to its normal size
          p._size = p._tempSize;
        }else{
          //otherwise grow by 2 pixels
          p._size += 2;
        }
      //if not in the emotions orbit
      }else{
       //set the particle back to original appearance. The particles already looped through will be reset in the main program draw method
       p.setColor(p._tempColour);
       p._size = p._tempSize;
      }
    }
  }
  
  /*Run sequence*/
  public void run(ArrayList<Particle> l){
    //if the emotion is being dragged
    if(_dragging){
       //alter the particles in its orbit
       affectParticles(l);
    }
    super.run(l);
  }
}
