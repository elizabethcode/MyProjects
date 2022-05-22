class Snake { //start of snake class

  //members
  float x;
  float y;
  //movement of the snake
  float vx;
  float vy;
  float width;
  float height;
  //loading snake images 
  PImage img1 = loadImage("snake1.png");
  PImage img2 = loadImage("snake2.png");
  PImage img3 = loadImage("snake3.png");
  int counterForImage = 0; //image counter

  //constructor
  Snake(float x, float y) {
    x = random(x-200) + 100;
    y = random(y-200) + 100;
    //movement o the snake
    width = 32;
    height = 32;
    vx = 0;
    vy = 0;
    //resizing images
    img1.resize(150, 150);
    img2.resize(150, 150);
    img3.resize(150, 150);
  }//end of snake constructor

  void update() { 
    render(); //drawing the images
    x += vx; //x is equal to volicity x
    y += vy; //y is equal to volicity y
  }//end of update

  void render() {//draw it
    // displays next image that changes every 10th call
    if (counterForImage > 0 && counterForImage < 10) {
      image(img1, this.x, this.y);
    } else if (counterForImage >= 10 && counterForImage < 20) {
      image(img2, this.x, this.y);
    } else if (counterForImage >= 20 && counterForImage < 30) {
      image(img3, this.x, this.y);
    } else {
      image(img3, this.x, this.y);
      counterForImage = 0;
    }
    counterForImage++; 

    //barrier for the canvas
    if (x < 0) {//off left of window
      x = x + 10;
    } //end of left of window

    if (x > 1650) {//off right of window
      x = x - 10;
    } //end of right window

    if (y < 120) {//off top of window
      y = y + 10;
    }//end of top window

    if (y > 1650) {//off bottom of window
      y = y - 10;
    }//end bottom window
  }//end of render

  //snake(enemy2) chasing runner2(player2)
  void chase(float lara2x, float lara2y) {
    if (abs(x - lara2x) < abs(y - lara2y)) {
      //verticle seperation is bigger
      if (y < lara2y) {
        vy = 6;
        vx = 4;
      } else {
        vy = -6;
        vx = 4;
      } //end y moves
    } else {
      //horizontal seperation is bigger 
      if (x < lara2x) {
        vx = 6;
      } else {
        vx = -6;
      }//end x moves
    }//end chase
  }//end of chase class
}//end of snake class
