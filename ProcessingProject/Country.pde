public int currentWindow = -1;
public class Country{

  // declare the useless stuff we need
  public ArmyWindow army;
  public RichWindow rich;
  public PeopleWindow people;
  public OppositionWindow  opposition;
  private float w = 128, h = 128, gap = 10, heightGap = 20;
  private float x = ((width/2) - w) - gap,y = ((height/2) - h) - gap;
  //public PFont font = createFont("TypefaceMac.ttf", 32);
  private Dictator dic;
  // buttons
  private Button armyButton;
  private Button richButton;
  private Button peopleButton;
  private Button oppositionButton;
  // reps
  public int armyRep = 10;
  public int peopleRep = 10;
  public int richRep = 10;
  public int oppositionRep = 10;
  // country :: >> contrustor
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
  // draw alll the differnt windows and stuff
  public void draw(){
    // check reps
    if(armyRep <= 0 || richRep <= 0 ||peopleRep <= 0 || oppositionRep <= 0){
       currentWindow = -2;
    }
    // draw the start window
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
      // army window
    } else if(currentWindow == 1){
      army.draw();
      for(int i = 0; i < armyButtons.size(); i++){
         armyButtons.get(i).update();
      }
       // people window
    } else if(currentWindow == 2){
      people.draw();
      for(int i = 0; i < peopleButtons.size(); i++){
         peopleButtons.get(i).update();
      }
      // rich people draw
    } else if (currentWindow == 3){
      rich.draw();
      for(int i = 0; i < richButtons.size(); i++){
         richButtons.get(i).update();
      }
      // opposition window
    } else if(currentWindow == 4){
      opposition.draw();
      for(int i = 0; i <oppositionbuttons.size(); i++){
         oppositionbuttons.get(i).update();
      }
      // draw the info window.
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
      // game over window draw
    } else if(currentWindow == -2){
      background(0);
      textSize(35);
      text("GAME OVER", width/2 - textWidth("GAME OVER")/2, height/2);
      textSize(20);
      text("REPS: ", width/2 - textWidth("REPS: ")/2, height/2+35);
      text("Army: " + armyRep, width/2 - textWidth("Army: " + armyRep)/2, height/2+50);
      text("People: " + peopleRep, width/2 - textWidth("People: " + peopleRep)/2, height/2+70);
      text("Oligarchs: " +richRep, width/2-textWidth("Oligarchs: " + richRep)/2, height/2+90);
      text("Opposition: " + oppositionRep, width/2-textWidth("Opposition: " + oppositionRep)/2, height/2+ 110);
  }
  }
  // reseults from the buttons
  public void armyButton(){
    army = new ArmyWindow(this);
    currentWindow = 1;
  }
  // results from the people button
  public void peopleButton(){
    people = new PeopleWindow(this);
    currentWindow = 2;
  }
  // result from the rich buttons
  public void richButton(){
    rich = new RichWindow(this);
     currentWindow = 3;
  }
  // result from the opposition button
  public void oppositionButton(){
    opposition = new OppositionWindow(this);
    currentWindow = 4;
  }
  // useless functions
  public Dictator getDictator(){
    return dic;
  }  
}
