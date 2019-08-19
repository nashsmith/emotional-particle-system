/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

class Joy extends Emotion {
 
  /*Constructor*/
  public Joy(float x, float y, color c, int size, int ringRadius){
    super(x, y, c, size, ringRadius);
    //used for text in top left
    _emotion = "Joy";
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
        //set its colour to the emotions colour
        p.setColor(_colour);
        //increment point in orbit by 3 degrees
        p._theta += radians(3);
        
        //move point along elliptical orbit
        p._position.x = _position.x + cos(p._theta)*(_position.dist(p._position));
        p._position.y = _position.y + sin(p._theta)*(_position.dist(p._position));

      //if not in emotions orbit, set colour to original colour
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
