/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

class Love extends Emotion {
  
  /*Constructor*/
  public Love(float x, float y, color c, int size, int ringRadius){
    super(x, y, c, size, ringRadius);
    //the point the particle will orbit around when in emotions orbit
    _orbitPoint = new PVector(x, y);
    //used in top left of screen
    _emotion = "Love";
  }
  
  /*Makes the particles in orbit orbit in a tiny circle*/
  public void affectParticles(ArrayList<Particle> l){
    
    //for each particle
    for(Particle p: l){
     
     
      
      //if the particle is in the emotions orbit
      if(Math.sqrt(Math.pow((_position.dist(p._position)), 2)) < _ringRadius/2){
        
        //sets the orbit point to the particles position
        _orbitPoint = p._position; 
        //stop it moving
        p.setShake(true);
        //stop it colliding with other particles
        p.setCollided(true);
        //set its colour to the emotions colour
        p.setColor(_colour);
        //move the particle along an elliptical orbit
        p._position.x = _orbitPoint.x + cos(p._theta)*1.5;
        p._position.y = _orbitPoint.y + sin(p._theta)*1.5;
        //increment the particles point in the orbit
        p._theta += radians(10);
        
      //if not in the emotions orbit, set colour back to original colour
      }else {
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
