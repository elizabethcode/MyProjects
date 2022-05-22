class Tree { //start of tree class

  //members
  int x;
  int y;
  //loading images - these images were not draw by me
  PImage img1 = loadImage("tree1.png"); 
  PImage img2 = loadImage("tree2.png");
  int CounterForImage = 0; //image counter
  int lifespan; //related to tree erasing all of the trees once restart game

  //constructor
  Tree(int x, int y ) {
    this.x = x + 4;
    this.y = y + 4;
    img1.resize(210, 280);
    img2.resize(210, 280);
  }//end of constructor

  void update() {
    render();//draw out images of the coins
  }//end of update

  void render() {//draw it - choose next image to display
    if (CounterForImage > 0 && CounterForImage < 10) {
      image(img1, this.x + 4, this.y + 4);
    } else if (CounterForImage >= 10 && CounterForImage < 20) {
      image(img2, this.x + 4, this.y + 4);
    } else {
      image(img2, this.x + 4, this.y + 4);
      CounterForImage = 0;
    }
    CounterForImage++;

    //barrier for the canvas
    if ( x < 0 ) {//off left of window
      x = x + 10;
    }
    if ( x > 1700 ) {//off right of window
      x = x - 10;
    }
    if ( y < 120 ) {//off top of window
      y = y + 10;
    }
    if ( y > 1700 ) {//off bottom of window
      y = y - 10;
    }
  } //end of render class

  //remove all fo the trees when game is reset
  boolean vanish() {
    if (lifespan <=1) {
      return true;
    } else {
      return false;
    }
  }//end of vanish boolean
}//end of tree class
