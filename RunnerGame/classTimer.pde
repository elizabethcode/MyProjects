class Timer { //start of timer class
  
  //members
  float Time;
  int set = 60 ;
  int interval;

  //constructor
  Timer( int set ) {
    this.interval = set;
  }//end of constructor

  //return the curent time
  public float getTime() {
    return(Time);
  }//end of get time

  //set the timer to 60 seconds
  public void setTime(int set) {
    Time = set;
  }//end of setTime

  //update timer by counting down. This needs to be called within void draw() to work. 
  public void counter() {
    Time += 1/frameRate;
  }//end of counter

  public void restart() {
    Time = set;
  }//end of restart
} //end of timer class
