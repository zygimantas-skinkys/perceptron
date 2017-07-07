// class that describes points object
//it has x and y as coordinates
//third input is 'bias'(it's equal to 1)
//answer is the output that we expect from perceptron
class Point{
  float[] inputs;
  int answer;
  
  Point(float x, float y, int a){
    inputs = new float[3];
    inputs[0] = x;
    inputs[1] = y;
    inputs[2] = 1;
    
    answer = a;
  }
}