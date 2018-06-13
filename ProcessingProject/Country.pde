public class Country{
   
  //public PFont font = createFont("TypefaceMac.ttf", 32);
  private Dictator dic;
  
  public Country(Dictator d){
    this.dic=d;
  }
  
  public void draw(){
    
  }
  
  public Dictator getDictator(){
    return dic;
  }
  
}