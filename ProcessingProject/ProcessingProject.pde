
//https://portal.lkdsb.net/class/7i61k1d/Pages/default.aspx

public static PImage buttonClickedTexture;
public static PImage buttonTexture;
public static PImage armyHat;
public static PImage topHat;
public static PImage mask;
public static PImage head;
public static ArrayList<Button> buttons = new ArrayList<Button>();
public static ArrayList<Button> armyButtons = new ArrayList<Button>();
public static ArrayList<Button> richButtons = new ArrayList<Button>();
public static ArrayList<Button> peopleButtons = new ArrayList<Button>();
public static ArrayList<Button> oppositionbuttons = new ArrayList<Button>();

Country country;
private Dictator dictator;

/*
  This is where we load all the images and different classes
  The images take multiple seconds to load due to processing's inefficent 
  loader. 
*/
void setup(){
  size(500, 500);
  buttonClickedTexture = loadImage("buttonClicked.jpg");
  buttonTexture = loadImage("button.jpg");
  armyHat = loadImage("armyhat.png");
  topHat = loadImage("tophat.png");
  mask = loadImage("mask.png");
  head = loadImage("head.png");
  dictator = new Dictator();
  country = new Country(dictator);
  addButton( new Button(buttonTexture, new EndTurnButton(), new TextData("End Turn", color(0,0,0), 16),(width/2) - 40, height - 50, 80, 40));
}

public static void addButton(Button b){
  buttons.add(b);
}

public static void removeButton(Button b){
  buttons.remove(b);
}

void draw(){
    //clear();
   country.draw();
}

void mousePressed(){
  // basicly we check what window is showing and then update the button's click function.
  if(currentWindow == 0){
   for(int i = 0; i < buttons.size(); i++)
     if(buttons.get(i) != null){buttons.get(i).mouseEvent(mouseButton,mouseX, mouseY);}
  } else if(currentWindow == 1){
   for(int i = 0; i < armyButtons.size(); i++)
     if(armyButtons.get(i) != null){armyButtons.get(i).mouseEvent(mouseButton,mouseX, mouseY);}
  } else if (currentWindow == 3){ 
   for(int i = 0; i < richButtons.size(); i++)
     if(richButtons.get(i) != null){richButtons.get(i).mouseEvent(mouseButton,mouseX, mouseY);}
  } else if (currentWindow == 2){
   for(int i = 0; i < peopleButtons.size(); i++)
     if(peopleButtons.get(i) != null){peopleButtons.get(i).mouseEvent(mouseButton,mouseX, mouseY);}
  } else if(currentWindow == 4){
   for(int i = 0; i < oppositionbuttons.size(); i++)
     if(oppositionbuttons.get(i) != null){oppositionbuttons.get(i).mouseEvent(mouseButton,mouseX, mouseY);}
  }
}

void keyPressed(){
  
}

void keyReleased(){
  
}