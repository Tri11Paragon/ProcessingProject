public class Country{
  
  private float x = 0,y = 0;
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
  
  public Country(Dictator d){
    this.dic=d;
    armyButton = new Button(armyHat, new ArmyButton(this), x,y, 64, 64);
    peopleButton = new Button(head, new PeopleButton(this), x+64,y, 64, 64);
    richButton = new Button(topHat, new RichButton(this), x+64,y+64, 64, 64);
    oppositionButton = new Button(mask, new OppositionButton(this), x,y+64, 64, 64);
    addButton(armyButton);
    addButton(richButton);
    addButton(peopleButton);
    addButton(oppositionButton);
  }
  
  public void draw(){
    
  }
  
  public void armyButton(){
    
  }
  
  public void peopleButton(){
    
  }
  
  public void richButton(){
     
  }
  
  public void oppositionButton(){
    
  }
  
  public Dictator getDictator(){
    return dic;
  }
  
}