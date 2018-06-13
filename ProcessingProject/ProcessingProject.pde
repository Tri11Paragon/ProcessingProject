
public static PImage buttonClickedTexture;
public static PImage buttonTexture;
public static Button[] buttons = new Button[Short.MAX_VALUE];

Country country;
private Dictator dictator;

void setup(){
  size(500, 500);
  buttonClickedTexture = loadImage("buttonClicked.jpg");
  buttonTexture = loadImage("button.jpg");
  dictator = new Dictator();
  country = new Country(dictator);
  addButton( new Button(buttonTexture, null, 50, 50, 128, 128));
}

public static void addButton(Button b){
  for (int i = 0; i < buttons.length; i++)
    if(buttons[i] == null){buttons[i] = b; break;} else {continue;}
  return;
}

void draw(){
    //clear();
   background(255);
   country.draw();
   buttons[0].update();
}

void mousePressed(){
   for(int i = 0; i < buttons.length; i++)
     if(buttons[i] != null){buttons[i].mouseEvent(mouseButton,mouseX, mouseY);}
}

void keyPressed(){
  
}

void keyReleased(){
  
}