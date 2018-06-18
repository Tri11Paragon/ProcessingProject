public class Country{

  public ArmyWindow army;
  public RichWindow rich;
  public PeopleWindow people;
  public OppositionWindow  opposition;
  private float x = ((width/2) - 64) - 10,y = 0, gap = 10;
  //public PFont font = createFont("TypefaceMac.ttf", 32);
  private Dictator dic;
  
  private Button armyButton;
  private Button richButton;
  private Button peopleButton;
  private Button oppositionButton;
  
  private int armyRep = 10;
  private int peopleRep = 10;
  private int richRep = 10;
  private int oppositionRep = 10;
  
  private int currentWindow = 0;
  
  public Country(Dictator d){
    this.dic=d;
    opposition = new OppositionWindow();
    rich = new RichWindow();
    people = new PeopleWindow();
    army = new ArmyWindow();
    armyButton = new Button(armyHat, new ArmyButton(this), x,y, 64, 64);
    peopleButton = new Button(head, new PeopleButton(this), x+64 + gap,y, 64, 64);
    richButton = new Button(topHat, new RichButton(this), x+64 + gap,y+64 + gap, 64, 64);
    oppositionButton = new Button(mask, new OppositionButton(this), x,y+64 + gap, 64, 64);
    addButton(armyButton);
    addButton(richButton);
    addButton(peopleButton);
    addButton(oppositionButton);
  }
  
  public void draw(){
    if(currentWindow == 0){
      background(#0066ff);
      fill(color(255, 0, 0 ));
      rect(75, 0, 10, height);
      rect(width-75, 0, 10, height);
      // thread friendly array updater   
      for(int i = 0; i < buttons.size(); i++){
         buttons.get(i).update();
      }
    } else if(currentWindow == 1){
      army.draw();
    } else if(currentWindow == 2){
      people.draw();
    } else if (currentWindow == 3){
      rich.draw();     
    } else if(currentWindow == 4){
      opposition.draw();
    }
  }
  
  public void armyButton(){
    currentWindow = 1;
  }
  
  public void peopleButton(){
    currentWindow = 2;
  }
  
  public void richButton(){
     currentWindow = 3;
  }
  
  public void oppositionButton(){
    currentWindow = 4;
  }
  
  public Dictator getDictator(){
    return dic;
  }
  
}