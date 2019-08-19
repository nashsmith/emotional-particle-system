/*
  Author: Nash Smith
  ID Number: 1277758
  Paper Code: COMPX221
*/

class Emotion extends Particle {
  
  private final int _opacity = 25; //opacity of the colour in the ring
  protected int _ringRadius; //radius of emotions influence
  protected boolean _dragging;
  protected String _emotion;
  
  public Emotion(float x, float y, color c, int size, int ringRadius){
    super(x, y, c, size);
    _ringRadius = ringRadius;
    _dragging = false;
    _emotion = "";
  }
  
  /*Returns true if mouse is held down on emotion*/
  public boolean isClicked(){
    /*
     if(mousePressed){
      //if Emotion is clicked anywhere in its area
      if((mouseX > (_position.x - _size*1.5) && mouseX < (_position.x + _size*1.5))){
        _dragging = true;
      }
      
     }else{
      _dragging = false;
     }*/
    
    
    
    //if mouse is clicked
    if(mousePressed){
      //if Emotion is clicked anywhere in its area
      if((mouseX > (_position.x - _size*1.5) && mouseX < (_position.x + _size*1.5))
          && (mouseY > (_position.y - _size*1.5) && mouseY < (_position.y + _size*1.5))){
        return true;
      }
    }
    //if the mouse wasnt clicked or nothing was clicked on, then return false
    return false;
  }
  
  /*set the position of the emotion to the position of the mouse*/
  public void followMouse(){
   
    _position.x = mouseX;
    _position.y = mouseY;
    
  }
  
  public void setDragging(boolean b){
    _dragging = b;
  }
  
  public void drawEmotion(){
    fill(_colour, 25);
    stroke(_colour);
    ellipseMode(CENTER);
    ellipse(_position.x, _position.y, _ringRadius, _ringRadius);
    super.drawParticle();
  }
  
  public void run(ArrayList<Particle> l){
     if(_dragging){
       followMouse();
       drawEmotion();
       fill(_colour);
       textFont(createFont("Arial", 72));
       textAlign(LEFT, TOP);
       text(_emotion,0, 0);
     }else{
        move();
        checkCollision();
        drawEmotion();
        _collided = false;
     }
   }
  
}
