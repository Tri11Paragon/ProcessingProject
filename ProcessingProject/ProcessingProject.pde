
public static PImage buttonClickedTexture;
public static PImage buttonTexture;
public static PImage armyHat;
public static PImage topHat;
public static PImage mask;
public static PImage head;
public static ArrayList<Button> buttons = new ArrayList<Button>();

Country country;
private Dictator dictator;

void setup(){
  size(500, 500);
  buttonClickedTexture = loadImage("buttonClicked.jpg");
  buttonTexture = loadImage("button.jpg");
  armyHat = loadImage("armyhat.jpg");
  topHat = loadImage("tophat.jpg");
  mask = loadImage("mask.jpg");
  head = loadImage("head.jpg");
  dictator = new Dictator();
  country = new Country(dictator);
  addButton( new Button(buttonTexture, null, new TextData("End Turn", color(0,0,0), 16),(width/2) - 40, height - 50, 80, 40));
}

public static void addButton(Button b){
  buttons.add(b);
}

public static void removeButton(Button b){
  buttons.remove(b);
}

void draw(){
    //clear();
   background(0);
   country.draw();
   // thread friendly array updater   
   
   for(int i = 0; i < buttons.size(); i++){
     buttons.get(i).update();
   }
}

void mousePressed(){
   for(int i = 0; i < buttons.size(); i++)
     if(buttons.get(i) != null){buttons.get(i).mouseEvent(mouseButton,mouseX, mouseY);}
}

void keyPressed(){
  
}

void keyReleased(){
  
}