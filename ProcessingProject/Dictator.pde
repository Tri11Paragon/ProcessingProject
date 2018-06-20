public class Dictator{
 
  // IGNORE THIS. Not using this code yet.
  
  private final float maxAge = random(79, 100);
  private String name = "";
  private String birthDate = "";
  // we need double persision for this number. No more rounding errors.
  private double netWorth = 0;
  private float rating = 0;
  private XML namesXML;
  private XML[] namesChildren;
  private String[] names;
  
  /*
    This entire class is more of an object or 'placeholder' then an actual class. 
  */
  
  public Dictator(String name, String birthDate, double netWorth, float startingRating){
     this.name = name;
     this.birthDate = birthDate;
     this.netWorth = netWorth;
     this.rating = startingRating;
     namesXML = loadXML("names.xml"); 
     namesChildren = namesXML.getChildren("record");
     names = new String[namesChildren.length];
     for (int i = 0; i < namesChildren.length; i++){
         XML first_nameElement = namesChildren[i].getChild("first_name");
         XML last_nameElement = namesChildren[i].getChild("last_name");
         String first_name = first_nameElement.getContent();
         String last_name = last_nameElement.getContent();
         names[i] = first_name + " " + last_name;
     }
  }
  
  // randommizes everything.
  public Dictator(){
     namesXML = loadXML("names.xml"); 
     namesChildren = namesXML.getChildren("record");
     names = new String[namesChildren.length];
     for (int i = 0; i < namesChildren.length; i++){
         XML first_nameElement = namesChildren[i].getChild("first_name");
         XML last_nameElement = namesChildren[i].getChild("last_name");
         String first_name = first_nameElement.getContent();
         String last_name = last_nameElement.getContent();
         names[i] = first_name + " " + last_name;
     }
     randomize();
  }
  
  // set everything to random
  public void randomize(){
    this.name = names[(int)random(0, names.length)];
    this.birthDate = random(1, 27) + "/" + random(1,12) + "/" + (year() - 40);
    this.netWorth = random(50000, 250000);
    this.rating = 10;
  }
  
  // getters and setters start here..
  
  public String getName(){
    return this.name;
  }
  
  public String getBirthDate(){
    return birthDate;
  }
  
  public float maxAge(){
    return maxAge;
  }
  
  public double getMoney(){
    return netWorth;
  }
  
  public float getRating(){
    return rating;
  }
  
  public void setMoney(double money){
     this.netWorth = money;
  }
  
  public void addMoney(double money){
    this.netWorth += money;
  }
  
  public void removeMoney(double money){
    this.netWorth -= money;
  }
  
  public void setRating(float rating){
    this.rating = rating;
  }
  
}