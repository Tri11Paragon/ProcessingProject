public interface ButtonResult{
  // this is used for dynamic buttons.
  void buttonClicked();
  
}
// text data for buttons
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

// these explain themselfs. They are  just the result for button's

public class ArmyButton implements ButtonResult{
  
  private Country c;
  
  public ArmyButton(Country c){
    this.c = c;
  }
  
  public void buttonClicked(){
      c.armyButton();
  }
  
}
// these explain themselfs. They are  just the result for button's
public class PeopleButton implements ButtonResult{
  
  private Country c;
  
  public PeopleButton(Country c){
    this.c = c;
  }
  
  public void buttonClicked(){
      c.peopleButton();
  }
  
}
// these explain themselfs. They are  just the result for button's
public class RichButton implements ButtonResult{
  
  private Country c;
  
  public RichButton(Country c){
    this.c = c;
  }
  
  public void buttonClicked(){
      c.richButton();
  }
  
}
// these explain themselfs. They are  just the result for button's
public class OppositionButton implements ButtonResult{
  
  private Country c;
  
  public OppositionButton(Country c){
    this.c = c;
  }
  
  public void buttonClicked(){
      c.oppositionButton();
  }
}
// these explain themselfs. They are  just the result for button's
public class EndTurnButton implements ButtonResult{
    
  
    public EndTurnButton(){
      
    }
    
    public void buttonClicked(){
      println("End Turn");     
    }
}
// these explain themselfs. They are  just the result for button's
public class ArmyYesButton implements ButtonResult{
    
    ArmyWindow w;
  
    public ArmyYesButton(ArmyWindow w){
      this.w = w;
    }
    
    public void buttonClicked(){
        w.yesButton();     
    }
}
// very inefficent way of doing this. this is a grade 10 project, so im not worried about this.
public class ArmyNoButton implements ButtonResult{
    
    ArmyWindow w;
  
    public ArmyNoButton(ArmyWindow w){
      this.w = w;
    }
    
    public void buttonClicked(){
        w.noButton();     
    }
}
// these explain themselfs. They are  just the result for button's
public class RichYesButton implements ButtonResult{
    
    RichWindow w;
  
    public RichYesButton(RichWindow w){
      this.w = w;
    }
    
    public void buttonClicked(){
        w.yesButton();     
    }
}
// very inefficent way of doing this. this is a grade 10 project, so im not worried about this.
public class RichNoButton implements ButtonResult{
    
    RichWindow w;
  
    public RichNoButton(RichWindow w){
      this.w = w;
    }
    
    public void buttonClicked(){
        w.noButton();     
    }
}
// these explain themselfs. They are  just the result for button's
public class PeopleYesButton implements ButtonResult{
    
    PeopleWindow w;
  
    public PeopleYesButton(PeopleWindow w){
      this.w = w;
    }
    
    public void buttonClicked(){
        w.yesButton();     
    }
}
// very inefficent way of doing this. this is a grade 10 project, so im not worried about this.
public class PeopleNoButton implements ButtonResult{
    
    PeopleWindow w;
  
    public PeopleNoButton(PeopleWindow w){
      this.w = w;
    }
    
    public void buttonClicked(){
        w.noButton();     
    }
}
// these explain themselfs. They are  just the result for button's
public class OppositionYesButton implements ButtonResult{
    
    OppositionWindow w;
  
    public OppositionYesButton(OppositionWindow w){
      this.w = w;
    }
    
    public void buttonClicked(){
        w.yesButton();     
    }
}
// very inefficent way of doing this. this is a grade 10 project, so im not worried about this.
public class OppositionNoButton implements ButtonResult{
    
    OppositionWindow w;
  
    public OppositionNoButton(OppositionWindow w){
      this.w = w;
    }
    
    public void buttonClicked(){
        w.noButton();     
    }
}
// these explain themselfs. They are  just the result for button's
public class StartGameButton implements ButtonResult{
  
    public StartGameButton(){
    }
    
    public void buttonClicked(){
        currentWindow = 0;
    }
}
