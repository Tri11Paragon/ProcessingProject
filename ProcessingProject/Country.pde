public int currentWindow = 0;
public class Country{

  public ArmyWindow army;
  public RichWindow rich;
  public PeopleWindow people;
  public OppositionWindow  opposition;
  private float w = 128, h = 128, gap = 10;
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
    opposition = new OppositionWindow();
    rich = new RichWindow();
    people = new PeopleWindow();
    army = new ArmyWindow(this);
    armyButton = new Button(armyHat, new ArmyButton(this), x,y, w, h);
    peopleButton = new Button(head, new PeopleButton(this), x+w + gap,y, w, h);
    richButton = new Button(topHat, new RichButton(this), x+w + gap,y+h + gap, w, h);
    oppositionButton = new Button(mask, new OppositionButton(this), x,y+w + gap, w, h);
    addButton(armyButton);
    addButton(richButton);
    addButton(peopleButton);
    addButton(oppositionButton);
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
    }
  }
  
  public void armyButton(){
    army = new ArmyWindow(this);
    currentWindow = 1;
  }
  
  public void peopleButton(){
    people = new PeopleWindow();
    currentWindow = 2;
  }
  
  public void richButton(){
    rich = new RichWindow();
     currentWindow = 3;
  }
  
  public void oppositionButton(){
    opposition = new OppositionWindow();
    currentWindow = 4;
  }
  
  public Dictator getDictator(){
    return dic;
  }
  
}