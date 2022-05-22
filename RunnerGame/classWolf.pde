class Wolf { //start of wolf class

  //members
  float x=1800;
  float y=1800;
  //realated to movement of the wolf
  float width;
  float height;
  float vx;
  float vy;
  //load images - these images were not draw by me
  PImage img1 = loadImage("wolf1.png"); 
  PImage img2 = loadImage("wolf2.png");
  PImage img3 = loadImage("wolf3.png");
  PImage img4 = loadImage("wolf4.png");
  PImage img5 = loadImage("wolf5.png");
  int CounterForImage = 0; //image counter

  //constructor
  Wolf(float x, float y) {
    x = random(x-200) + 100;
    y = random(y-200) + 100;
    //realated on the movement of the wolf
    width = 32;
    height = 32;
    vx = 0;
    vy = 0;
    //resize the image to 100 pixels to 200 pixels
    img1.resize(200, 200);
    img2.resize(200, 200);
    img3.resize(200, 200);
    img4.resize(200, 200);
    img5.resize(200, 200);
  }//enf of constructor

  void update() {
    render(); //draws the wolf
    x += vx; //x is equal to volicity x
    y += vy; //y is equal to volicity y
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
    } else if (CounterForImage>=40 && CounterForImage<50) {
      image(img5, this.x, this.y);
    } else {
      image(img5, this.x, this.y);
      CounterForImage=0;
    }
    CounterForImage++;

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

  //wolf(enemy) chasing runner(player)
  void chase(float larax, float laray) {
    if (abs(x - larax) < abs(y - laray)) {
      //verticle seperation is bigger
      if (y < laray) {
        vy = 6;
        vx = 4;
      } else {
        vy = -6;
        vx = 4;
      } //end y moves
    } else {
      //horizontal seperation is bigger 
      if (x < larax) {
        vx = 6;
      } else {
        vx = -6;
      }//end x moves
    }//end chase
  }//end of chase class
} //end of wolf class
