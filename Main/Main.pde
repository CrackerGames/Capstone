private boolean startScreen = true;

private PImage background;

public SaveAndLoad saveAndLoadData;
private Game game;
private StartMenu startMenu;


//Is run once when the program is launched.
void setup() {
  
  size(900, 800); //Sets the window size.
  frameRate(60); //Sets the framerate.
  
  textAlign(CENTER);
  background = loadImage("Images/Marble Background.png"); //Loads in the image for the background.
  
  saveAndLoadData = new SaveAndLoad();
  game = new Game(saveAndLoadData);
  startMenu = new StartMenu(game, saveAndLoadData);
  
  game.gameSetup();
  startMenu.startMenuSetup();
}


/**Runs each frame.
*  Runs primarily all the visual code.
*/
void draw(){
  
  image(background, 0, 0, width, height);
  
  if(startScreen){
    startMenu.startMenuDraw();
  } else {
    game.drawGame();
  }
  
}


void mousePressed(){
  
  if(startScreen){
    startMenu.startMenuMousePressed();
  } else {
    game.gameMousePressed();
  }
  
}


void keyPressed() {
  
  if(!startScreen){
    game.gameKeyPressed();
    
    //Back to main menu.
    if(keyCode == BACKSPACE){
      startScreen = true;
      game.board = null;
      game.setTurn(0);
      game.score.resetScoreboard();
    }
  }
  
  
}

void keyReleased(){
  keyCode = 0;
}
