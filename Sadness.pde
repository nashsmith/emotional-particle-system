/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

class Sadness extends Emotion {
  
   /*Constructor*/
   public Sadness(float x, float y, color c, int size, int ringRadius){
    super(x, y, c, size, ringRadius);
    //used in top left of screen
    _emotion = "Sadness";
   }
  
  /*Makes particles fall to bottom of screen, represents tears*/
  public void affectParticles(ArrayList<Particle> l){
    
    //for each particle
    for(Particle p: l){
      //if the particle is in the emotions orbit
      if(Math.sqrt(Math.pow((_position.dist(p._position)), 2)) < _ringRadius/2){
        
        //set it unable to move normally
        p.setShake(true);
        //set it unable to collide with anything
        p.setCollided(true);
        //change its colour to the emotions colour
        p.setColor(_colour);
        //set its state to falling (handled in the move method)
        p._falling = true;
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
