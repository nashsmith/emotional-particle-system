/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

class Anger extends Emotion {
 
  /*Constructor*/
  public Anger(float x, float y, color c, int size, int ringRadius){
    super(x, y, c, size, ringRadius);
    //used for text in top left
    _emotion = "Anger";
  }
  
  /*Alters the course of the particles in the emotions orbit*/
  public void affectParticles(ArrayList<Particle> l){
    
    //for each particle
    for(Particle p: l){
      
      //if the particle is inside the emotions orbit
      if(Math.sqrt(Math.pow((_position.dist(p._position)), 2)) < _ringRadius/2){
        
        //make it so the particle cannot collide with another
        p.setCollided(true);
        //make the particle stop moving
        p.setShake(true);
        //set the colour of the particle to the emotions colour
        p.setColor(_colour);
        
        
        /*Particles are biased, they will try to stay close to the emotion rather than move out of the orbit*/
        //X Bias
        if(p._position.x < _position.x - _size/2){
          p._position.add(random(-2, 3), p._velocity.y);
        }else if(p._position.x > _position.x + _size/2){
          p._position.add(random(-3, 2), p._velocity.y);
        }else{
          p._position.add(random(-3, 3), p._velocity.y);
        }
        //Y Bias
        if(p._position.y < _position.y - _size/2){
          p._position.add(p._velocity.x, random(-2, 3));
        }else if(p._position.y < _position.y + _size/2){
          p._position.add(p._velocity.x, random(-3, 2));
        }else{
           p._position.add(p._velocity.x, random(-3, 3));
        }
        
      //if not in the orbit, set the colour back to the particles original colour
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
    //then run the parents run method
    super.run(l);
  }
  
}
