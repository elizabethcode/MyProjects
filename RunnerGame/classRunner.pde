class Runner { //start of runner class

  //members
  int x =900;
  int y =900;
  float width;
  float height;
  float speedX;
  float speedY;
  float maximumSpeed;
  //loading images - these images were not draw by me
  PImage img1 = loadImage("runner1.png"); 
  PImage img2 = loadImage("runner2.png");
  PImage img3 = loadImage("runner3.png");
  PImage img4 = loadImage("runner4.png");
  int CounterForImage = 0; //image counter

  //constructor
  Runner( int x, int y ) {
    this.x = x + 800;
    this.y = y + 800;
    //resizing images
    img1.resize(100, 200);
    img2.resize(100, 200);
    img3.resize(100, 200);
    img4.resize(100, 200);
    //speed of the runner moving 
    maximumSpeed = 10;
    speedX = 0;
    speedY = 0;
  }//end of runner constructor

  void update() {
    //horizonal movement - x axis
    if (left) {//makes runner go left when left key pressed
      speedY = 0;
      speedX = -maximumSpeed;
    }//end runner goes left
    if (right) {//makes runner goes right when right key pressed
      speedY = 0;
      speedX = maximumSpeed;
    }//end of runner goes right

    /*everytime key left/right is key pressed and relseased,
     it will stop in that postion */
    if ((!left && !right) || (left && right)) {
      speedX = 0;
    }

    //vertical movement - y axis
    if (up) {
      speedX = 0;
      speedY = -maximumSpeed;
    }
    if (down) {
      speedX = 0;
      speedY = maximumSpeed;
    }
    if ((!up &&!down) || (up && down)) {
      speedY = 0;
    }

    // update position
    x += speedX;
    y += speedY;
  }//end of update


  void render() {//draw it - choose next image to display
    if (CounterForImage>0 && CounterForImage<10) {
      image(img1, this.x, this.y);
    } else if (CounterForImage>=10 && CounterForImage<20) {
      image(img2, this.x, this.y);
    } else if (CounterForImage>=20 && CounterForImage<30) {
      image(img3, this.x, this.y);
    } else if (CounterForImage>=30 && CounterForImage<40) {
      image(img4, this.x, this.y);
    } else {
      image(img4, this.x, this.y);
      CounterForImage=0;
    }
    CounterForImage++;

    //barrier for the canvas - player does not go off screen
    if ( x < 0 ) {//off left of window
      x = x + 10;
    }
    if ( x > 1700 ) {//off right of window
      x = x - 10;
    }
    if (y < 120) {//off top of window
      y = y + 10;
    }
    if (y > 1600) {//off bottom of window
      y = y - 10;
    }
  }//end of render

  //runner collide into coin
  boolean collide(Coin coin) {
    return abs(this.x- coin.x) < 91 && abs(this.y - coin.y) < 44;
  }//end of coin collide boolean
}//end of runner class
