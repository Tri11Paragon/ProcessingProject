public int currentWindow = -1;
public class Country{

  public ArmyWindow army;
  public RichWindow rich;
  public PeopleWindow people;
  public OppositionWindow  opposition;
  private float w = 128, h = 128, gap = 10, heightGap = 20;
  private float x = ((width/2) - w) - gap,y = ((height/2) - h) - gap;
  //public PFont font = createFont("TypefaceMac.ttf", 32);
  private Dictator dic;
  
  private Button armyButton;
  private Button richButton;
  private Button peopleButton;
  private Button oppositionButton;
  
  public int armyRep = 10;
  public int peopleRep = 10;
  public int richRep = 10;
  public int oppositionRep = 10;
  
  public Country(Dictator d){
    this.dic=d;
    opposition = new OppositionWindow(this);
    rich = new RichWindow(this);
    people = new PeopleWindow(this);
    army = new ArmyWindow(this);
    armyButton = new Button(armyHat, new ArmyButton(this), x,y, w, h);
    peopleButton = new Button(head, new PeopleButton(this), x+w + gap,y, w, h);
    richButton = new Button(topHat, new RichButton(this), x+w + gap,y+h + gap + heightGap, w, h);
    oppositionButton = new Button(mask, new OppositionButton(this), x,y+w + gap + heightGap, w, h);
    addButton(armyButton);
    addButton(richButton);
    addButton(peopleButton);
    addButton(oppositionButton);
    Button b = new Button(buttonTexture, new StartGameButton(), new TextData("Start Game!", color(200,0,0), 16),(width/2) - 80, height - 100, 160, 60);
    beginbuttons.add(b);
  }
  
  public void draw(){
    if(currentWindow == 0){
      background(#0066ff);
      fill(0);
      textSize(25);
      text("Select an audiance: ", (width/2) - textWidth("Select an audiance: ")/2, 30);
      fill(color(255, 0, 0 ));
      rect(75, 0, 10, height);
      rect(width-75, 0, 10, height);
      fill(0);
      text("Army: " + armyRep, x, y);
      text("People: " + peopleRep, x + w, y-3);
      textSize(18);
      text("Opposition: " + oppositionRep + "|", x, y + h+heightGap);
      text("Oligarchs: " + richRep, x + w + 10, y + h + heightGap);
      textSize(25);
      // thread friendly array updater   
      for(int i = 0; i < buttons.size(); i++){
         buttons.get(i).update();
      }
    } else if(currentWindow == 1){
      army.draw();
      for(int i = 0; i < armyButtons.size(); i++){
         armyButtons.get(i).update();
      }
    } else if(currentWindow == 2){
      people.draw();
      for(int i = 0; i < peopleButtons.size(); i++){
         peopleButtons.get(i).update();
      }
    } else if (currentWindow == 3){
      rich.draw();
      for(int i = 0; i < richButtons.size(); i++){
         richButtons.get(i).update();
      }
    } else if(currentWindow == 4){
      opposition.draw();
      for(int i = 0; i <oppositionbuttons.size(); i++){
         oppositionbuttons.get(i).update();
      }
    } else if(currentWindow == -1){
      background(0,0,0);
      fill(255);
      textSize(12);
      text("to play this 'game' you must select a figure and answer their question.", 0,20);
      text("if any party's reputation gets to 0 then the game is over", 0, 40);
      text("images are terrible because im not a graphic designer and I don't have my paint.net", 0, 60);
      text("The game code uses advanced classes and other things we have not covered",0,80);
      text("It even loads names from a xml file.(not used)", 0,100);
      text("with more time and a better programing language I could have made this a bit better", 0, 120);
      text("The code is not optimized to the best of my abilites", 0, 140);
      text("Sorry for this small text", 0, 160);
      for(int i = 0; i <beginbuttons.size(); i++){
         beginbuttons.get(i).update();
      }
    }
  }
  
  public void armyButton(){
    army = new ArmyWindow(this);
    currentWindow = 1;
  }
  
  public void peopleButton(){
    people = new PeopleWindow(this);
    currentWindow = 2;
  }
  
  public void richButton(){
    rich = new RichWindow(this);
     currentWindow = 3;
  }
  
  public void oppositionButton(){
    opposition = new OppositionWindow(this);
    currentWindow = 4;
  }
  
  public Dictator getDictator(){
    return dic;
  }
  
}
