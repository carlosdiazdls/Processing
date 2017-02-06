//Carlos Diaz de los Santos
// Trabajo de Pong con Processing
// Modelo 1.0 a 2/06/2017
//Programacion y Computacion

Bloque[] miBloque = new Bloque[5]; 
Bloque[] mi2Bloque =new Bloque [5];

//variable pelota y paleta
float posxpelota=200;
float posypelota=200;
float velxpelota=5;
float velypelota=2;
float velXmax=5;
float velYmax=5;
float velYmin=2;
float aumentoVelocidad=0.2;
int posxpaleta=mouseX;
int posypaleta=450;
int radio=15;
int velxpaleta=10;
float difposx;

//variables juego
int pantalla=0;
int vida=2;
int puntos=0;

void setup() {
  size(500, 500);
  dibujarBloque();
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
  case 3:
    win();
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
  ellipse(posxpelota, posypelota, radio*2, radio*2);
  posxpelota=posxpelota+velxpelota;
  posypelota=posypelota+velypelota;
}

void rebote () { // rebote de la pelota con las paredes y la paleta
  if ( difposx<=90/2+radio && difposx>=-(90/2+radio) && posypelota>=height*9/10-radio && posypelota<=height*9/10+radio) { 
    rebotepaleta();
  }
  if (posxpelota>=width-radio || posxpelota<=0+radio) {
    velxpelota=velxpelota*(-1);
  }
  //Rebote Y paredes
  if (posypelota<=0+radio) {
    velypelota=velypelota*(-1);
  }
}
void rebotepaleta() {
  //Rebote Paleta

  velXmax=velXmax+aumentoVelocidad;
  velYmin=velYmin+aumentoVelocidad;
  velYmax=sqrt(sq(velXmax)+sq(velYmin));

  velxpelota= difposx*velXmax/(90/2+radio);
  if (difposx <0) {
    velypelota= -(-difposx*(velYmin-velYmax)/(90/2+radio)+velYmax);
  } else {
    velypelota= -(difposx*(velYmin-velYmax)/(90/2+radio)+velYmax);
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
  puntuacion();
}

void pantallafinal() {
  background(0);
  fill(0, 200, 100);
  textSize(25);
  text("e para empezar de nuevo y s para salir", 0, height/2);
}

void iniciarBloques() {
  for (int i=0; i< 5; i++) {


    miBloque[i].dibujar();
    miBloque[i].desaparecer();
  }

  for (int h=0; h< 5; h++) {

    mi2Bloque[h].dibujar();
    mi2Bloque[h].desaparecer();
  }
}
void dibujarBloque() {
  for (int i=0; i< 5; i++) {
    miBloque[i]= new Bloque(((width/miBloque.length*i)+25), height/5, 1);
  }
  for (int h=0; h< 5; h++) {

    mi2Bloque[h]= new Bloque(((width/mi2Bloque.length*h)+25), height/10, 1);
  }
}
class Bloque {

  int x, y, z, anchura, altura;

  Bloque (int posX, int posY, int estado) {  //constructor
    x=posX;
    y=posY;
    z=estado;
    anchura=50;
    altura=10;
  }
  void dibujar() {
    if (z==1) {
      rect(x, y, anchura, altura);
    }
  }
  void desaparecer() {
    if (posxpelota>x-anchura/2-15 && posxpelota<x+anchura/2+15 && posypelota>y-altura/2-15 && posypelota<y+altura/2+15 && z==1) {
      z=0;
      velypelota= velypelota*(-1);
      puntos++;
    }
  }
}
void puntuacion() {
  if (puntos==2)
    pantalla=3;
}

void keyPressed () {
  if (key=='e') {
    pantalla=0;
    vida=2;
    puntos=0;
    dibujarBloque();
  }
  if (key=='s') {
    exit();
  }
  if (key==' ') {
    pantalla= pantalla+1;
  }
}
void win() {
    textSize(25);
  fill(0,200,100);
  text("e para empezar de nuevo y s para salir", 10, height/2);
  float R, G, B;
  background(0);
   R=random (0, 255);
  G=random(0, 255);
  B=random (0, 255);
    fill(R, G, B);
  textSize(25);
text(" HAS GANADO. ¡FELICIDADES!", 60, height/4);
}
