class Coin { //start of coin class

  //members
  float x = 20;
  float y = 20;
  //float r = 50;
  //loading images - these images were not draw by me
  PImage img1 = loadImage("coin1.png"); 
  PImage img2 = loadImage("coin2.png");
  PImage img3 = loadImage("coin3.png");
  PImage img4 = loadImage("coin4.png");
  PImage img5 = loadImage("coin5.png");
  PImage img6 = loadImage("coin6.png");
  PImage img7 = loadImage("coin7.png");
  PImage img8 = loadImage("coin8.png");
  int CounterForImage = 0; //image counter
  int lifespan; //how long it will last related to erasing all coins once game ends

  //constructor
  Coin(float x, float y) {
    this.x = x +random(-4, 20);
    this.y = y +random(-4, 20);
    //resizing images
    img1.resize(100, 100);
    img2.resize(100, 100);
    img3.resize(100, 100);
    img4.resize(100, 100);
    img5.resize(100, 100);
    img6.resize(100, 100);
    img7.resize(100, 100);
    img8.resize(100, 100);
  }//end of constructor

  void update() {
    render();//draw out images of the coins
  }//end of update

  void render() {//draw it
    // displays next image that changes every 10th call
    if (CounterForImage > 0 && CounterForImage < 10) {
      image(img1, this.x, this.y);
    } else if (CounterForImage >= 10 && CounterForImage < 20) {
      image(img2, this.x, this.y);
    } else if (CounterForImage >= 20 && CounterForImage < 30) {
      image(img3, this.x, this.y);
    } else if (CounterForImage >= 30 && CounterForImage < 40) {
      image(img4, this.x, this.y);
    } else if (CounterForImage >= 40 && CounterForImage < 50) {
      image(img5, this.x, this.y);
    } else if (CounterForImage >= 50 && CounterForImage < 60) {
      image(img6, this.x, this.y);
    } else if (CounterForImage >= 60 && CounterForImage < 70) {
      image(img7, this.x, this.y);
    } else if (CounterForImage >= 70 && CounterForImage < 80) {
      image(img8, this.x, this.y);
    } else {
      image(img8, this.x, this.y);
      CounterForImage = 0;
    }
    CounterForImage++; 

    //barrier for the canvas - coins dont draw off screen
    if (x < 0) {//off left of window
      x = x + 10;
    }
    if (x > 1700) {//off right of window
      x = x - 10;
    }
    if (y < 120) {//off top of window
      y = y + 10;
    }
    if (y > 1700) {//off bottom of window
      y = y - 10;
    }//end of barrier for the canvas
  }//end of render

  //remove all fo the coins when game is reset
  boolean eraseallCoins() {
    if (lifespan <=0) {
      return true;
    } //end of return true statement
    else {
      return false;
    }//end of else statement
  }//end of eraseall
}//end of coin class
