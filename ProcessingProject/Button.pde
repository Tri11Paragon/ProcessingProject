public class Button {
  
  private PImage texture;
  private float x,y, width, height;
  private ButtonResult result;
  
  public Button(PImage texture, ButtonResult result, float x, float y, float width, float height){
    this.texture = texture;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.result = result;
  }
  
  // draw the image.
  public void update(){
      image(texture, x, y, width, height);
  }
  
  // this is my solution to the problem of mouse interfacing with classes.
  // to make a button you need to add the button to the master button list for this function to work.
  // basicly we check to see if the mouse is within the button's area.
  public void mouseEvent(int type, float mouseX, float mouseY){
    if(type == 37){
       if(mouseX >= x && mouseX <= (x+width)){
          if(mouseY >= y && mouseY <= (y+width)){
            buttonPressed();
          }
       }
    }
  }
  
  // useless function 
  public void buttonPressed(){
      if (result == null) return;
      result.buttonClicked();
  }
  
}