Bloque[] miBloque = new Bloque[5]; 
float posxpelota=100;
float posypelota=100;

float velxpelota=5;
float velypelota=2;

int posxpaleta=mouseX;
int posypaleta=450;

int velxpaleta=10;
float difposx;

int pantalla=0;
int vida=2;
int puntos=0;
void setup() {
  size(500, 500);
  for (int i=0; i< 5; i++) {
    miBloque[i]= new Bloque((width/miBloque.length*i)+width/10, height/5);
  }
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
  background(255);  
  textAlign(RIGHT);
  text("vida: " + vida, width-width/20, height/20);
  textAlign(LEFT);
  text("PUNTOS: " + puntos, width/20, height/20);
}
void paleta() { //movimiento y dibujo de la paleta
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
    puntos=puntos +1;
  }
}
void Perdervida() {
  if (posypelota>=height) {
    vida=vida-1;
    posxpelota=250;
    posypelota=250;
    velypelota=velypelota*(-1);
  }
  if (vida==0) {
    pantalla=2;
    puntos=0;
  }
}
void pantallainicial() {
  background(0);
  fill(0, 200, 100);
  textSize(15);
  text("PLAY (espacio)", width/2, height/2);
}
void pantallajuego() {
  basejuego(); 
  pelota();
  paleta();
  rebote();
  Perdervida();
  iniciarBloques();
}
void pantallafinal() {
  background(0);
  fill(0, 200, 100);
  textSize(25);
  text("e para empezar de nuevo y s para salir", 0, height/2);
}

void iniciarBloques() {
  for (int i=0; i< 5; i++) {
    miBloque[i].display();
  }
}

class Bloque {
  // DATOS 
  float bloquePosX;  // posicion x del bloque
  float bloquePosY;  // posicion y del bloque
  float anchoBloque; // ancho del bloque
  float altoBloque; // alto del bloque
  float r;
  float g;
  float b;

  // CONSTRUCTOR
  Bloque(float xPosTemp, float yPosTemp) {
    bloquePosX=xPosTemp;
    bloquePosY=yPosTemp;
    anchoBloque=15;
    altoBloque=30;
  }
  void display(){
   fill(r-50 ,g-50 ,b-50);
    stroke(0, 255, 0 );
    strokeWeight(2);
     rect(bloquePosX, bloquePosY, altoBloque, anchoBloque);
  }
}
void keyPressed () {
  if (key=='e') {
    pantalla=0;
    vida=2;
  }
  if (key=='s') {
    exit();
  }
  if (key==' ') {
    pantalla= pantalla+1;
  }
}
