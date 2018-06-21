// these are all the options for all the different people. Add as you want/ FORMAT: Message:Positive:Negative 
public static String[] armyOptions = {
  "Force army recruitement on the people?:army:people", 
  "Use Farmer fields as military test grounds?:army:people,opposition",
  "Use goverment funds to buy the generals new computers?:army:people,rich,opposition", 
  "Inject LSD into the troops?:army:opposition", "Give all the privates speed?:army,people:opposition",
  "Sell old military equipment to the black market?:army:opposition,people"
};
public static String[] richOptions = {
  "Increase people taxes to 60%?:rich:people,opposition", 
  "Make farmer give rich people extra food?:rich:people", 
  "Force the army to protect our money?:rich:army,people",
  "Make extra money off of the people's suffering?:rich:people,army,opposition", 
  "Allow us to make LSD and sell it to the army?:rich,army:opposition"
};
public static String[] peopleOptions = {
  "Decriminalization of all drugs?:people:opposition", 
  "Lower taxes?:people:rich", 
  "Force the army to protect villages who don't have police?:people:army",
  "Make public transport free?:people:rich", 
  "Make education free?:people:rich", 
  "Make abortion legal?:people,army:rich,opposition"
};
public static String[] oppositionOptions ={
  "Make abortion illegal?:opposition,rich:people,army",
  "Make all drugs illegal?:opposition:people",
  "Make hacking legal?:opposition:people,army,rich",
  "Increase gas price?:opposition,rich:people,army",
};
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
public void doNegativeEffects(Country c, String[] p){
  // make sure that there are no duplicates with these booleans
  boolean army = false;
  boolean people = false;
  boolean rich = false;
  boolean opposition = false;
  // check who is negative then add their ratings.;
  for(int i = 0; i < p.length; i++){
      if(p[i].equals("army") && !army){
        c.armyRep--;
        army = true;
      }
      if(p[i].equals("rich") && !rich){
        c.richRep--;
        rich = true;
      }
      if(p[i].equals("opposition") && !opposition){
        c.oppositionRep--;
        opposition = true;
      }
      if(p[i].equals("people") && !people){
        c.peopleRep--;
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
    Button no = new Button(buttonTexture, new ArmyNoButton(this), new TextData("No", color(200,0,0), 16),(width/2) - 80, (height /2)+80, 160, 60);
    armyButtons.add(no);
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
  // do results form the yes button
  public void yesButton(){
    // they explain themselfs. Do the postive and negative effects
    String[] positiveEffects = split(positiveEffect, ',');                                                                                                
    doPositiveEffects(country, positiveEffects);
    String[] negativeEffects = split(negativeEffect, ',');
    doNegativeEffects(country, negativeEffects);
    currentWindow = 0;
  }
  // do results from the no button
  public void noButton(){
    // they explain themselfs. Do the postive and negative effects its jsut reversed
    String[] positiveEffects = split(negativeEffect, ',');                                                                                                
    doPositiveEffects(country, positiveEffects);
    doPositiveEffects(country, positiveEffects);
    String[] negativeEffects = split(positiveEffect, ',');
    doNegativeEffects(country, negativeEffects);
    doNegativeEffects(country, negativeEffects);
    currentWindow = 0;
  }
}
/*
  THIS IS JUST COPPIES FROM THE ABOVE CLASS.
*/
public class RichWindow{
  // they explain themselfs.
  int oneToUse;
  String theText = "";
  String positiveEffect = "";
  String negativeEffect = "";
  private Country country;
  
  // hello
  public RichWindow(Country c){
    // constructor
    this.country = c;
    // select option to use
    oneToUse = (int)random(0, richOptions.length);
    // split the styring into it's components.
    try{
      String[] split = split(richOptions[oneToUse], ':');
      theText = split[0]; // this is the first section of text seperated by :
      positiveEffect = split[1]; // second section of text
      negativeEffect = split[2]; // last section of text
    } catch (Exception e){println("Somone messed up on the options! Error on line 19 of Windows class");}
    Button yes = new Button(buttonTexture, new RichYesButton(this), new TextData("Yes", color(200,0,0), 16),(width/2) - 80, height /2, 160, 60);
    richButtons.add(yes);
    Button no = new Button(buttonTexture, new RichNoButton(this), new TextData("No", color(200,0,0), 16),(width/2) - 80, (height /2)+80, 160, 60);
    richButtons.add(no);
  }
  // draw
  public void draw(){
    background(#3893A2);
    fill(255);
    textSize(25);
    text("Audience: Rich", width/2 - textWidth("Audience: Rich")/2, 25);
    textSize(checkSize(theText, 12, 25));
    text(theText, width/2-textWidth(theText)/2, 100);
  }
  
  public void yesButton(){
    // they explain themselfs. Do the postive and negative effects
    String[] positiveEffects = split(positiveEffect, ',');                                                                                                
    doPositiveEffects(country, positiveEffects);
    String[] negativeEffects = split(negativeEffect, ',');
    doNegativeEffects(country, negativeEffects);
    currentWindow = 0;
  }
  
  public void noButton(){
    // they explain themselfs. Do the postive and negative effects its jsut reversed
    String[] positiveEffects = split(negativeEffect, ',');                                                                                                
    doPositiveEffects(country, positiveEffects);
    doPositiveEffects(country, positiveEffects);
    String[] negativeEffects = split(positiveEffect, ',');
    doNegativeEffects(country, negativeEffects);
    doNegativeEffects(country, negativeEffects);
    currentWindow = 0;
  }
}

public class PeopleWindow{ 
  // they explain themselfs.
  int oneToUse;
  String theText = "";
  String positiveEffect = "";
  String negativeEffect = "";
  private Country country;
  
  // hello
  public PeopleWindow(Country c){
    // constructor
    this.country = c;
    // select option to use
    oneToUse = (int)random(0, peopleOptions.length);
    // split the styring into it's components.
    try{
      String[] split = split(peopleOptions[oneToUse], ':');
      theText = split[0]; // this is the first section of text seperated by :
      positiveEffect = split[1]; // second section of text
      negativeEffect = split[2]; // last section of text
    } catch (Exception e){println("Somone messed up on the options! Error on line 19 of Windows class");}
    Button yes = new Button(buttonTexture, new PeopleYesButton(this), new TextData("Yes", color(200,0,0), 16),(width/2) - 80, height /2, 160, 60);
    peopleButtons.add(yes);
    Button no = new Button(buttonTexture, new PeopleNoButton(this), new TextData("No", color(200,0,0), 16),(width/2) - 80, (height /2)+80, 160, 60);
    peopleButtons.add(no);
  }
  // draw
  public void draw(){
    background(#FF9B74);
    fill(255);
    textSize(25);
    text("Audience: People", width/2 - textWidth("Audience: People")/2, 25);
    textSize(checkSize(theText, 12, 25));
    text(theText, width/2-textWidth(theText)/2, 100);
  }
  
  public void yesButton(){
    // they explain themselfs. Do the postive and negative effects
    String[] positiveEffects = split(positiveEffect, ',');                                                                                                
    doPositiveEffects(country, positiveEffects);
    String[] negativeEffects = split(negativeEffect, ',');
    doNegativeEffects(country, negativeEffects);
    currentWindow = 0;
  }
  
  public void noButton(){
    // they explain themselfs. Do the postive and negative effects its jsut reversed
    String[] positiveEffects = split(negativeEffect, ',');                                                                                                
    doPositiveEffects(country, positiveEffects);
    doPositiveEffects(country, positiveEffects);
    String[] negativeEffects = split(positiveEffect, ',');
    doNegativeEffects(country, negativeEffects);
    doNegativeEffects(country, negativeEffects);
    currentWindow = 0;
  }
}

public class OppositionWindow{
 // they explain themselfs.
  int oneToUse;
  String theText = "";
  String positiveEffect = "";
  String negativeEffect = "";
  private Country country;
  
  // hello
  public OppositionWindow(Country c){
    // constructor
    this.country = c;
    // select option to use
    oneToUse = (int)random(0, oppositionOptions.length);
    // split the styring into it's components.
    try{
      String[] split = split(oppositionOptions[oneToUse], ':');
      theText = split[0]; // this is the first section of text seperated by :
      positiveEffect = split[1]; // second section of text
      negativeEffect = split[2]; // last section of text
    } catch (Exception e){println("Somone messed up on the options! Error on line 19 of Windows class");}
    Button yes = new Button(buttonTexture, new OppositionYesButton(this), new TextData("Yes", color(200,0,0), 16),(width/2) - 80, height /2, 160, 60);
    oppositionbuttons.add(yes);
    Button no = new Button(buttonTexture, new OppositionNoButton(this), new TextData("No", color(200,0,0), 16),(width/2) - 80, (height /2)+80, 160, 60);
    oppositionbuttons.add(no);
  }
  // draw
  public void draw(){
    background(#EE74FF);
    fill(255);
    textSize(25);
    text("Audience: Opposition", width/2 - textWidth("Audience: Opposition")/2, 25);
    textSize(checkSize(theText, 12, 25));
    text(theText, width/2-textWidth(theText)/2, 100);
  }
  
  public void yesButton(){
    // they explain themselfs. Do the postive and negative effects
    String[] positiveEffects = split(positiveEffect, ',');                                                                                                
    doPositiveEffects(country, positiveEffects);
    String[] negativeEffects = split(negativeEffect, ',');
    doNegativeEffects(country, negativeEffects);
    currentWindow = 0;
  }
  
  public void noButton(){
    // they explain themselfs. Do the postive and negative effects its jsut reversed
    String[] positiveEffects = split(negativeEffect, ',');                                                                                                
    doPositiveEffects(country, positiveEffects);
    doPositiveEffects(country, positiveEffects);
    String[] negativeEffects = split(positiveEffect, ',');
    doNegativeEffects(country, negativeEffects);
    doNegativeEffects(country, negativeEffects);
    currentWindow = 0;
  }
}
