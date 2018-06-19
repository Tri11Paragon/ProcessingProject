public static String[] armyOptions = {"Force army recruitement on the people?:army:people", "Use Farmer fields as military test grounds?:army:people,opposition",
"Use goverment funds to buy the generals new computers?:army:people,rich,opposition", "Inject LSD into the troops?:army:opposition"};

/** 
  "If you don't know the difference between passing by reference and passing by value, you shouldn't be working in 3D graphics" 
*/
// If it was hard to write it should be hard to read. Hello future me! Hello github.
// make a function to make sure the text is on the window for the user.
public int checkSize(String text, int min, int max){
  // we need to go though all the possible combinitions to check if they fit on screen.(I know thast is speel worng) (I also know about that)
  for (int i = max; i > min; i--){
    textSize(i);
    if(((textWidth(text))) < width){
      return i;
    }
  }
  return min;
}
public void doPositiveEffects(Country c, String[] p){
  // make sure that there are no duplicates with these booleans
  boolean army = false;
  boolean people = false;
  boolean rich = false;
  boolean opposition = false;
  // check who is positive then add their ratings.;
  for(int i = 0; i < p.length; i++){
      if(p[i].equals("army") && !army){
        c.armyRep++;
        army = true;
      }
      if(p[i].equals("rich") && !rich){
        c.richRep++;
        rich = true;
      }
      if(p[i].equals("opposition") && !opposition){
        c.oppositionRep++;
        opposition = true;
      }
      if(p[i].equals("people") && !people){
        c.peopleRep++;
        people = true;
      }
    }
}
public class ArmyWindow {
  
  // they explain themselfs.
  int oneToUse;
  String theText = "";
  String positiveEffect = "";
  String negativeEffect = "";
  private Country country;
  
  // hello
  public ArmyWindow(Country c){
    // constructor
    this.country = c;
    // select option to use
    oneToUse = (int)random(0, armyOptions.length);
    // split the styring into it's components.
    try{
      String[] split = split(armyOptions[oneToUse], ':');
      theText = split[0]; // this is the first section of text seperated by :
      positiveEffect = split[1]; // second section of text
      negativeEffect = split[2]; // last section of text
    } catch (Exception e){println("Somone messed up on the options! Error on line 19 of Windows class");}
    Button yes = new Button(buttonTexture, new ArmyYesButton(this), new TextData("Yes", color(200,0,0), 16),(width/2) - 80, height /2, 160, 60);
    armyButtons.add(yes);
  }
  // draw
  public void draw(){
    background(25, 150, 0);
    fill(255);
    textSize(25);
    text("Audience: Army", width/2 - textWidth("Audience: Army")/2, 25);
    textSize(checkSize(theText, 12, 25));
    text(theText, width/2-textWidth(theText)/2, 100);
  }
  
  public void yesButton(){
    String[] positiveEffects = split(positiveEffect, ',');
    doPositiveEffects(country, positiveEffects);
    currentWindow = 0;
  }
  
  public void noButton(){
    
    currentWindow = 0;
  }
}

public class RichWindow{
  public void draw(){
    
  }
}

public class PeopleWindow{ 
  public void draw(){
    
  }
}

public class OppositionWindow{
 public void draw(){
   
 }
}