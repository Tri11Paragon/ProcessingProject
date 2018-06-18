public static String[] armyOptions = {"Force army recruitement on the people?:army:people", "Use Farmer fields as military test grounds?:army:people,opposition",
"Use goverment funds to buy the generals new computer?:army:people,rich,opposition", "Inject LSD into troops:army:opposition"};
public class ArmyWindow {
  
  public void draw(){
    background(25, 150, 0);
    fill(255);
    textSize(25);
    text("Audience: Army", width/2 - textWidth("Audience: Army")/2, 25);
    int oneToUse = (int)random(0, armyOptions.length);
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