public interface ButtonResult{
  // this is used for dynamic buttons.
  void buttonClicked();
  
}
public class TextData{
 
  public String text;
  public color c;
  public float size;
  
  public TextData(String text, color c, float size){
    this.text = text;
    this.c = c;
    this.size = size;
  }
}

public class ArmyButton implements ButtonResult{
  
  private Country c;
  
  public ArmyButton(Country c){
    this.c = c;
  }
  
  public void buttonClicked(){
      c.armyButton();
  }
  
}

public class PeopleButton implements ButtonResult{
  
  private Country c;
  
  public PeopleButton(Country c){
    this.c = c;
  }
  
  public void buttonClicked(){
      c.peopleButton();
  }
  
}

public class RichButton implements ButtonResult{
  
  private Country c;
  
  public RichButton(Country c){
    this.c = c;
  }
  
  public void buttonClicked(){
      c.richButton();
  }
  
}

public class OppositionButton implements ButtonResult{
  
  private Country c;
  
  public OppositionButton(Country c){
    this.c = c;
  }
  
  public void buttonClicked(){
      c.oppositionButton();
  }
}

public class EndTurnButton implements ButtonResult{
    
  
    public EndTurnButton(){
      
    }
    
    public void buttonClicked(){
      println("End Turn");     
    }
}