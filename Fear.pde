/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

class Fear extends Emotion {
 
  /*Constructor*/
  public Fear(float x, float y, color c, int size, int ringRadius){
    super(x, y, c, size, ringRadius);
    //used for text in top left
    _emotion = "Fear";
  }
  
  /*Alters the course of the particles in the emotions orbit*/
  public void affectParticles(ArrayList<Particle> l){
    
    //for each particle
    for(Particle p: l){
      //if the particle is in the emotions orbit
      if(Math.sqrt(Math.pow((_position.dist(p._position)), 2)) < _ringRadius/2){
        //stop it from moving
        p.setShake(true);
        //stop it colliding with other particles
        p.setCollided(true);
        //change its colour to the emotions colour
        p.setColor(_colour);
        
      //if not in the emotions orbit, set the particles colour back to the original colour
      }else{
       p.setColor(p._tempColour); 
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
