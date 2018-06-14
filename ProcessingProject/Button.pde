public class Button {
  
  private PImage texture;
  private float x,y, width, height;
  private ButtonResult result;
  private TextData text = new TextData("", color(0,0,0), 20);
  
  public Button(PImage texture, ButtonResult result, float x, float y, float width, float height){
    this.texture = texture;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.result = result;
  }
  
  public Button(PImage texture, ButtonResult result, String text, float x, float y, float width, float height) {
    this.texture = texture;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.result = result;
    this.text.text = text;
  }
  
  public Button(PImage texture, ButtonResult result, TextData text, float x, float y, float width, float height) {
    this.texture = texture;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.result = result;
    this.text = text;
  }
  
  // draw the image.
  public void update(){
      image(texture, x, y, width, height);
      textSize(text.size);
      fill(text.c);
      text(text.text, x + (width/2) - textWidth(text.text)/2, y + (height/2) + ((text.size/2)-2));
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