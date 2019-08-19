/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

class Particle {
  
  protected PVector _position;
  protected int _size;
  protected color _colour;
  protected PVector _velocity; //particles speed and direction
  protected PVector _acceleration;
  protected boolean _collided; //decides if particle can collide with other particles
  protected boolean _shake; //decides if particle moves normally or not
  protected float _theta; //used for elliptical orbits
  protected PVector _orbitPoint; //used for Love
  protected color _tempColour; 
  protected int _tempSize;
  protected boolean _falling; //used for Sadness
  protected boolean _surprise; //used for Surprise
  
  /*Constructor*/
  public Particle(float x, float y, color colour, int size){
    //assign variable values
    _velocity = new PVector(random(-3, 3), random(-3, 3));
    _acceleration = new PVector(random(-1, 1), random(-1, 1));
    _position = new PVector(x, y);
    _colour = colour;
    _tempColour = colour;
    _tempSize = size;
    _size = size;
    _collided = false;
    _shake = false;
    _falling = false;
    _theta = radians(random(0, 360));
  }
  
  /*Draws particle to the screen*/
  public void drawParticle(){
    //set the brush colour
    fill(_colour);
    stroke(_colour);
    //coordinates will be center of ellipse
    ellipseMode(CENTER);
    //draw the ellipse
    ellipse(_position.x, _position.y, _size, _size);
  }
  
  /*Some setter methods*/
    public void setShake(Boolean b){
     _shake = b;
   }
   
   public void setTheta(float t){
     _theta = t;
   }
   
   public void setColor(color c){
     _colour = c;
   }
   
   public void setCollided(Boolean b){
   _collided = b;
 }
 /**/
  
  /*Checks if the particle collided with the wall*/
   protected void checkCollision(){
   
   //LEFT WALL
   if(_position.x < 0){
     //invert x velocity
     _velocity = new PVector(-_velocity.x, _velocity.y);
     //_acceleration = new PVector(-_acceleration.x, _acceleration.y);
     _position.x = 5;
   //RIGHT WALL
   }else if(_position.x > width){
     //invert x velocity
     _velocity = new PVector(-_velocity.x, _velocity.y);
    // _acceleration = new PVector(-_acceleration.x, _acceleration.y);
     _position.x = width - 5;
   }
   
   //TOP WALL
   if(_position.y < 0){
     //invert y velocity
     _velocity = new PVector(_velocity.x, -_velocity.y);
     //_acceleration = new PVector(_acceleration.x, -_acceleration.y);
     _position.y = 5;
   //BOTTOM WALL
   }else if(_position.y > height){
     //invert y velocity
     _velocity = new PVector(_velocity.x, -_velocity.y);
    //_acceleration = new PVector(_acceleration.x, -_acceleration.y);
     _position.y = height - 5;
     //particle is no longer falling from sadness
     _falling = false;
     //particle is no longer blue from sadness
     _colour = _tempColour;
   }
 }
 
   /*Moves particle along its path... or not*/
   protected void move(){
     //if the particle is falling, move it down by 5 pixels
     if(_falling){
       _position.add(new PVector(0, 5));
     //if the particle can not move, set it to move next time (will change back from other methods). then exit move method
     }else if(_shake){
       _shake = false;
       return;
     //otherwise move normally by velocity amount
     }else{
     _position.add(_velocity);
     }
     //_velocity.add(_acceleration);
   }
   
   /*Run sequence*/
   public void run(ArrayList<Particle> l){
        //move the particle
        move();
        //see if it collided with the walls
        checkCollision();
        //draw the particle
        drawParticle();
        //set it able to collide into things again
        _collided = false;
   }
  
}
