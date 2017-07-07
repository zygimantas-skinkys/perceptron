//perceptron object
Perceptron perc;

//to know which point to train with
int current = 0;

//array of points
Point[] train = new Point[100000];

//coordinate space
float xmin = -1000;
float ymin = -600;
float xmax = 1000;
float ymax = 600;

//function that describes a line
float decrb_line(float x){
  return 0.7*x+2;
}

void setup(){
  size(1280, 720);
  frameRate(60);
  perc = new Perceptron(3, 0.0001);
  
  //create random points
  for(int i = 0; i < train.length; i++){
    //random coordinates
    float x = random(xmin, xmax);
    float y = random(ymin, ymax);
    //calc answer
    int answer = 1;
    if(y < decrb_line(x)){
      answer = -1;
    }
    train[i] = new Point(x, y, answer);
  }
  smooth();
}

void draw(){
  background(255);
  translate(width/2,height/2);
  
  //draw the line that is the goal of perceptron
  strokeWeight(4);
  stroke(127);
  float x1 = xmin;
  float x2 = xmax;
  float y1 = decrb_line(x1);
  float y2 = decrb_line(x2);
  line(x1, y1, x2, y2);
  
  //draw the line based on current perceptron's weights
  //formula is weights[0]*x + weights[1]*y + weights[2] = 0
  stroke(0);
  strokeWeight(1);
  float[] weights = perc.getWeights();
  x1 = xmin;
  x2 = xmax;
  y1 = (-weights[0]*x1 - weights[2]) / weights[1];
  y2 = (-weights[0]*x2 - weights[2]) / weights[1];
  line(x1, y1, x2, y2);
  
  //train perceptron with one point at the time
  perc.train(train[current].inputs, train[current].answer);
  current = (current + 1) % train.length;
  
  //draw points based on perceptron guess
  for(int i = 0; i < current; i++){
    //draw points
    stroke(0);
    strokeWeight(1);
    fill(0);
    int answer = train[i].answer;
    if(answer > 0) noFill();
    ellipse(train[i].inputs[0], train[i].inputs[1], 20, 20);
    
    //mark points based on perceptron guess
    //green is correctly indentified
    //red means perceptron made a mistake
    fill(255, 0, 0); //color red
    int guess = perc.predict(train[i].inputs);
    if(guess == answer){
      fill(0, 255, 0); //color green
    }
    ellipse(train[i].inputs[0], train[i].inputs[1], 10, 10);
    
  }
}