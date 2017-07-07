//a class that defines a perceptron
class Perceptron{
  
  float[] weights; //array of weights for input
  float lr; //learning rate that is used to adjust weights
  
  //constructor function that creates perceptron with n weights and and a learning rate of l
  Perceptron(int n, float l){
    weights = new float[n];
    for(int i = 0; i < n; i++){
      weights[i] = random(-1, 1); //random weights to start
    }
    lr = l;
  }
  
  //function that trains perceptron
  //weights are adjusted based on known answer
  void train(float[] inputs, int answer){
    int guess = predict(inputs);
    int error = answer - guess;
    //adjust weights based on error and learning rate
    for(int i = 0; i < weights.length; i++){
      weights[i] += lr * error * inputs[i];
    }
  }
  
  //guess -1 or 1 based on inputs
  int predict(float[] inputs){
    float sum = 0;
    for(int i = 0; i < weights.length; i++){
      sum += weights[i]*inputs[i];
    }
    //result is sign of sum
    return activation(sum);
  }
  
  int activation(float sum){
    if(sum > 0)
    {
      return 1;
    }
    return -1;
  }
  
  //returns perceptron's weights
  float[] getWeights(){
    return weights;
  }
}