public static class Maths{
  
  // I DONT USE THIS CLASS!!!!! Ignore it please!
  
  // this is bi-linear interpolation(smooths it out); i don't think this does much but its cool.
  public static float blerp(float point1, float point2, float alpha)
  {
    return point1 + alpha * (point2 - point1);
  }
  // This "smooths" it out even more.
  public static float cubic_scurve3(float alpha)
  {
    return alpha*alpha*( 3.0f - 2.0f*alpha );
  } 
  
}
