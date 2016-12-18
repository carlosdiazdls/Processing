float posxpelota=100;
float posypelota=100;

float velxpelota=5;
float velypelota=8;

int posxpaleta=mouseX;
int posypaleta=450;

int velxpaleta=10;
float difposx;

int pantalla=0;

void setup() {
  size(500, 500);
}

void draw() {
  switch (pantalla) {
  case 0:
    pantallainicial();
    break;
  case 1:
    pantallajuego();
    break;
  case 2:
    pantallafinal();
    break;
  }
}

void basejuego () { //creación de la pantalla
  background(255, 0, 0);  
}
void paleta(){ //movimiento y dibujo de la paleta
 rect(posxpaleta, posypaleta, 90, 30);
  posxpaleta=mouseX-45;
  difposx=posxpelota-posxpaleta-45;
}
 
 
void pelota () { //movimiento y dibujo de pelota
  ellipse(posxpelota, posypelota, 30, 30);
 posxpelota=posxpelota+velxpelota;
  posypelota=posypelota+velypelota;
}

void rebote () { // rebote de la pelota con las paredes y la paleta
  if (posxpelota>=width-15 || posxpelota<=0+15) {
    velxpelota=velxpelota*(-1);
  }
  //Rebote Y paredes
  if (posypelota<=0+15) {
    velypelota=velypelota*(-1);
  }
  //Rebote Paleta
  if (difposx<=45 && difposx>=(-45) && posypelota>=450-14) {
    velypelota=velypelota*(-1);
  }
}

void muerte() { //final del juego
  if (posypelota>=height) {
    pantalla =2;
    posxpelota=100;
    posypelota=100;
  }
}

void pantallainicial() {
  background(0);
  fill(0, 200, 100);
  textSize(15);
  text("PLAY (espacio)", 0, height/2);
}
void pantallajuego() {
  basejuego(); 
  pelota();
  paleta();
  rebote();
  muerte();
}
void pantallafinal() {
  background(0);
  fill(0, 200, 100);
  textSize(25);
  text("e para empezar de nuevo y s para salir", 0, height/2);
}

void keyPressed () {
  if (key=='e') {
    pantalla=0;
  }
  if (key=='s') {
    exit();
  }
  if (key==' ') {
    pantalla= pantalla+1;
  }
}
