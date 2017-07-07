class Perceptron{
  
  float[] weights;
  float lr;
  
  Perceptron(int n, float l){
    weights = new float[n];
    for(int i = 0; i < n; i++){
      weights[i] = random(-1, 1);
    }
    lr = l;
  }
  
  void train(float[] inputs, int answer){
    int guess = predict(inputs);
    int error = answer - guess;
    for(int i = 0; i < weights.length; i++){
      weights[i] += lr * error * inputs[i];
    }
  }
  
  int predict(float[] inputs){
    float sum = 0;
    for(int i = 0; i < weights.length; i++){
      sum += weights[i]*inputs[i];
    }
    return activation(sum);
  }
  
  int activation(float sum){
    if(sum > 0)
    {
      return 1;
    }
    return -1;
  }
  
  float[] getWeights(){
    return weights;
  }
}