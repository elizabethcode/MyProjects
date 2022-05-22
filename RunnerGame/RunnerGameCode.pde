//Gathering Game Assessment - have to click on canvas for it to work

//global variables
int x;
int y;
PFont font1, font2;

//Declare instance variables - all of theses are related to each class named
Coin gold;
Tree woods; 
Runner lara;
Wolf enemy;
Snake enemy2; 
Runner2 lara2;
Coin2 silver;
Timer startTimer;
Timer restart;

//arrayList of images - loading all of the images from each class - these images are not drawn by me
ArrayList<Coin> coinList = new ArrayList();
ArrayList<Tree> treeList = new ArrayList();
ArrayList<Runner> runnerList = new ArrayList();
ArrayList<Wolf> wolfList = new ArrayList();
ArrayList<Snake> snakeList = new ArrayList();
ArrayList<Runner2> runner2List = new ArrayList();
ArrayList<Coin2> coin2List = new ArrayList();

String gameMode; //game mode
int level; //game level
int score = 0;// starting number of points 
boolean left, right, up, down; //movement of the arrow keys
String s; //string - relation to switch/arrow movement

void setup() {
  //fonts for the used in the game
  font1 = loadFont("Ethnocentric-48.vlw");
  font2 = loadFont("ArialRoundedMTBold-48.vlw");
  gameMode = "START"; //game state
  size(1800, 1800);//width, height
  startTimer = new Timer(0);//start timer is 0 - related to class
  score = 0;// starting score
  level = 1;//player is on 1st level of the game

  //drawing coins within (1700,1700) of the canvas - loop
  for (int i = 0; i < 20; i++) {
    coinList.add( new Coin ((int)random(0, 1600), (int) random(0, 1600) ) );
  }//end of rendering coins

  //drawing trees within (1700,1700) of the canvas - loop
  for (int i = 0; i < 1; i++) {
    treeList.add( new Tree((int)random(0, 1600), (int)random(0, 1600) ) );
  }//end of render tree

  //drawing coin2 within (1700,1700) of the canvas - loop
  for (int i = 0; i < 20; i++) {
    coin2List.add( new Coin2 ((int)random(0, 1600), (int) random(0, 1600) ) );
  } //end of render coin2

  //size of the images
  lara = new Runner(100, 100);
  enemy = new Wolf (100, 1000);
  gold = new Coin (200, 200);
  woods = new Tree (100, 200);
  lara2 = new Runner2(100, 100);
  enemy2 = new Snake(100, 100);
  silver = new Coin2 (200, 200); 

  //relation to arrow keyPressed/keyReleased
  s = ""; //switch
  left = false;
  right = false;
  up = false;
  down = false;
}//end of setup

void draw() {//runs 60 times a second
  background(0, 0, 400);//blue background
  //gameStates
  if (gameMode == "START") {
    startGame();
  } else if (gameMode == "PLAY") {
    playGame();
  } else if (gameMode == "WIN") {
    winGame();
  } else if (gameMode == "LOSE") {
    loseGame();
  } else if (gameMode == "NEXT LEVEL") {
    level2Game();
  } 

  //next level button - variables for the next level button
  float leftSideOfButton = 1800/2-180;
  float rightSideOfButton = 1800/2-180 + 360;
  float topSideOfButton = 1800/2+200;
  float bottomSideOfButton = 1800/2+200+100;
  //when mouse is within and pressed the perameters (rectangle) the game resets and goes to next level  
  if (mouseButton == LEFT &&  
    mouseX > leftSideOfButton && mouseX < rightSideOfButton &&
    mouseY > topSideOfButton && mouseY < bottomSideOfButton) {  
    gameMode = "NEXT LEVEL"; 
    loop();
  }//end of mouse button 'if statement'

  //if the score reaches 20 goes to win state
  if (score >= 20) {
    gameMode = "WIN";
    loop();
  } //end of score 'if statement'

  //if timer reaches to 60 it will go to lose game state
  if (((int)startTimer.getTime()==60)) {
    gameMode ="LOSE";
    loop();
  }//end of timer 'if statement'

  // if the wolf catches the runner goes to the lose game state
  if (wolfCollidesWithRunner(lara, enemy)==true) {
    gameMode = "LOSE";
    loop();
  } //end of wolf collision 'if statement'

  // if snake catches the runner2 goes to the lose game state
  if (snakeCollidesWithRunner2(lara2, enemy2)==true) {
    gameMode = "LOSE";
    loop();
  } //end of wolf collision 'if statement'
}//end of draw

void startGame() {
  textAlign(CENTER); //align the start menue text to
  textFont(font1, 70); //font and size of text
  fill(225, 0, 0); //the colour "Press Spacebar to Begin!" is 
  text("Click on the Screen.\nPress Spacebar to Begin!", 1800/2, 780); //the text that will show up on start menue
  textFont(font1, 60); //font and size of text
  text("Use Arrow Keys to Move", 1800/2, 1800/2 + 10); //subtext
  //allow the game to begin when a key is pressed
  if (keyPressed == true) {
    gameMode = "PLAY";
  }//end of keyPressed 'if statement'
}//end of start game

void playGame() {//one of the playing state
  background(220);//clear background
  background(62, 191, 47); // background green
  fill(255, 0, 0); //text colour (red) for  the text "Timer"
  textFont(font2, 50); //font and size of text
  text("Timer: ", 100, 100); // "Timer" text
  startTimer.counter();//the count up timer
  text(int(startTimer.getTime()), 240, 100); // text and poistion of the count up time
  text("Score: " + score, 420, 100); //text for the "Score"
  text("Level:" + level, 700, 100); //text for the "level"

  //calls a method
  woods.render(); //draws trees
  gold.render(); //draws golden coin
  enemy.chase(lara.x, lara.y); //wolf chasing runner
  lara.render(); //draws the runner
  lara.update(); //update images on runner
  enemy.update(); //update on images
  enemy.render(); //draws the enemy

  //loop for getting each image coin
  for (int i = 0; i < coinList.size(); i++) {
    Coin currentCoin = coinList.get(i);   
    currentCoin.update();// method chaining - updating the images

    //check if the player collide into the coins
    if (lara. collide(currentCoin) || currentCoin.x < -100) {
      coinList.remove( i );
      score += 1; //increase score by one
    }//end of runner and coin collision
  }//end of coin list loop 

  for (int i = 0; i < treeList.size(); i++) {//loop for getting each image tree
    Tree currentTree = treeList.get(i);   
    currentTree.update();//updating the images
  }//end of tree list loop
}//end of play game

void winGame() {
  //what the win game menue will display
  background(62, 221, 22); //green background
  textAlign(CENTER); //align the start menue text to
  textFont(font1, 100); //font and size of text
  fill(225, 253, 253); //the colour "Press Spacebar to Begin!" is 
  text("CONGRATULATIONS!\nYOU WIN!", 1800/2, 600); //the text that will show up on start menue
  textSize(90); //text size for the "Score"
  text("YOUR SCORE: " + score, 1800/2, 1800/2); //text for the " YOUR SCORE"
  nextLevelButton();
}//end of win game

void loseGame() {
  //what the lose game menue will display
  background(0);//black background
  textAlign(CENTER); //centre all text 
  fill(255, 13, 13);//font colour
  textFont(font1, 180); //font and size of text
  text("GAME OVER\nYOU LOSE!", 1800/2, 400); //text will appear in lose game state
  textFont(font1, 100); //font and size of text
  text("YOUR SCORE: " + score, 1800/2, 840); //text for the "YOUR SCORE"
  playAgainButton();
}//end of lose game

void level2Game() {
  resetLevel2();
  background(227, 197, 45);//yellow background
  fill(255, 0, 0); //text colour (red) for  the text "Timer"
  textFont(font2, 50);//font and size of the count up timer
  text("Timer: ", 100, 100); // display "Timer" text
  startTimer.counter();//the count up timer
  text(int(startTimer.getTime()), 240, 100); // text and poistion of the count up time
  text("Score: " + score, 420, 100); //text for the "Score"
  //level 2 will apear and the position it will appear
  s="Level: 2";
  text(s, 700, 100);

  //call a method 
  lara2.render(); //draws the runner2
  lara2.update(); //update images on runner2
  enemy2.render(); //draws the snake
  enemy2.update(); //update images on snake
  enemy2.chase(lara2.x, lara2.y); //snake chasing runner2
  silver.render(); //draws the silver coin
  silver.update(); //updates the silver coin

  //loop for getting each image coin2
  for (int i = 0; i < coin2List.size(); i++) {
    Coin2 currentCoin2 = coin2List.get(i);   
    currentCoin2.update();// method chaining - updating the images

    //check if the player2 collide into the coin2
    if (lara2. collide2(currentCoin2) || currentCoin2.x < -100) {
      coin2List.remove( i );
      score=score+1;
    }//end of runner and coin collision
  }//end of coin list loop
}//end of level 2 game

void resetGame() {
  //when restart the game coins are removed from game and then restart the whole process again
  for (int i = 0; i < coinList.size(); i++) { //loop for getting each image coin
    Coin currentCoin = coinList.get(i);
    currentCoin.update();// method chaining - updating the images
    //removing arraylist
    if (currentCoin.eraseallCoins()) {
      coinList.remove(i);
      loop();
    }//end of erase all of coins once rest game
  }//end of coin list loop

  //when restart the game tree are removed from game and then restart the whole process again
  for (int i = 0; i < treeList.size(); i++) { //loop for getting each image tree
    Tree currentTree = treeList.get(i);   
    currentTree.update();
    //removing arrayList
    if (currentTree.vanish()) {
      treeList.remove(i);
      loop();
    }//end of tree list vanishing loop
  } //end of tree list

  //if timer reaches to 60 it will go to lose game state
  if (((int)startTimer.getTime()==60)) {
    gameMode ="LOSE";
    loop();
  }//end of timer 'if statement'
} //end of rest game 

void resetLevel2() {
  //loop for getting each image coin2
  for (int i = 0; i < coin2List.size(); i++) {
    Coin2 currentCoin2 = coin2List.get(i);   
    currentCoin2.update();// method chaining - updating the images

    //check if the player collide into the coin2
    if (lara2. collide2(currentCoin2) || currentCoin2.x < -100) {
      coin2List.remove( i );
      score++;
    }//end of runner and coin collision
  }//end of coin list loop
}//end of rest level 2

void playAgainButton() {  
  //reset buttton
  fill(255, 0, 0);//red rectangle 
  rect(width/2-180, height/2+70, 360, 100); //rectangel 360(width) x 100(height)
  textSize(60); //size of subtext
  fill(225, 255, 255); //font colour(white) for subtext
  text("HOME", 1800/2, 1040); //text on the button

  //variables for the play again button
  float leftSideOfButton = 1800/2-180;
  float rightSideOfButton = 1800/2-180 + 360;
  float topSideOfButton = 1800/2+70;
  float bottomSideOfButton = 1800/2+70+100;

  //when mouse is within and pressed the perameters (rectangle) the game resets
  if (mouseButton == LEFT &&  
    mouseX > leftSideOfButton && mouseX < rightSideOfButton &&
    mouseY > topSideOfButton && mouseY < bottomSideOfButton) {
    gameMode = "START";
    resetGame();
    setup();
    loop();
  }//end of mouse button 'if statement'
}//end of play again button 

void nextLevelButton() {
  //next level button structure
  fill(255, 0, 0);//red rectangle 
  rect(width/2-280, height/2+200, 550, 100); //rectangle 550(width) x 100(height)
  textSize(60); //size of subtext
  fill(225, 255, 255); //font colour(white) for subtext
  text("Next Level", 1800/2, 1170); //subtext

  //variables for the next level button
  float leftSideOfButton = 1800/2-280;
  float rightSideOfButton = 1800/2-280 + 550;
  float topSideOfButton = 1800/2+200;
  float bottomSideOfButton = 1800/2+200+100;

  //when mouse is within and pressed the perameters (rectangle) the game resets and goes to next level
  if (mouseButton == LEFT &&  
    mouseX > leftSideOfButton && mouseX < rightSideOfButton &&
    mouseY > topSideOfButton && mouseY < bottomSideOfButton) {  
    gameMode = "NEXT LEVEL"; //game state
    setup();
    loop();
  }//end of mouse button 'if statement'
}//end of next level button 

//snake collides with runner2 then game ends
boolean snakeCollidesWithRunner2(Runner2 lara2, Snake enemy2) {
  //distance on the x-axis
  float distanceX = abs((lara2.x+lara2.width/2)-(enemy2.x+enemy2.width/2));
  //distance on the y-axis
  float distanceY = abs((lara2.y+lara2.height/2)-(enemy2.y+enemy2.height/2));
  //combination of half widths
  float bothHalfWidths = lara2.width/2+enemy2.width/2;
  //combination of half heights
  float bothHalfHeights = lara2.height/2+enemy2.height/2;

  //test for x-axix collision
  if (distanceX < bothHalfWidths) {
    //test for y-axis collision
    if (distanceY < bothHalfHeights) {
      //collision has happened
      return true;
    }//end of distance y 'if statement'
  }//end of distance x 'if statement'
  return false;
} //end of boolean snake Collides With Runner2


//wolf collides with runner then game ends
boolean wolfCollidesWithRunner(Runner lara, Wolf enemy) {
  //distance on the x-axis
  float distanceX = abs((lara.x+lara.width/2)-(enemy.x+enemy.width/2));
  //distance on the y-axis
  float distanceY = abs((lara.y+lara.height/2)-(enemy.y+enemy.height/2));
  //combination of half widths
  float bothHalfWidths = lara.width/2+enemy.width/2;
  //combination of half heights
  float bothHalfHeights = lara.height/2+enemy.height/2;

  //test for x-axix collision
  if (distanceX < bothHalfWidths) {
    //test for y-axis collision
    if (distanceY < bothHalfHeights) {
      //collision has happened
      return true;
    }//end of distance y 'if statement'
  }//end of distance x 'if statement'
  return false;
}//end of boolean wolf Collides With Runner

// when pressing key it will move in that direction
void keyPressed() {//start of keyPressed
  s = "key: " + keyCode;
  switch(keyCode) {//start of switch
  case 37: //left
    left = true;
    break;
  case 38: //up
    up = true;
    break;
  case 39: //right
    right = true;
    break;
  case 40: //down
    down = true;
    break;
  }//end of switch
}//end of keyPressed

//when not pressing key it will not move - stay in that position
void keyReleased() { //start of keyReleased
  switch(keyCode) {//start of switch
  case 37: //left
    left = false;
    break;
  case 38: //up
    up = false;
    break;
  case 39: //right
    right = false;
    break;
  case 40: //down
    down = false;
    break;
  }//end of switch
}//end of keyReleased
