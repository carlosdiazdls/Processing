int posxpelota=250;
int posypelota=250;
int velxpelota=5;
int velypelota=8;
int posxpaleta=mouseX;
int posypaleta=450;
int velxpaleta=10;
float difposx;
void setup() {

  size(500, 500);
}

void draw() {

  background(255, 0, 0); 
  posxpaleta=mouseX-45;
  difposx=posxpelota-posxpaleta-45;
  posxpelota=posxpelota+velxpelota;
  posypelota=posypelota+velypelota;

  ellipse(posxpelota, posypelota, 30, 30);
  rect(posxpaleta, posypaleta, 90, 30);
  //Rebote X paredes
  if (posxpelota>width-15 || posxpelota<0+15) {
    velxpelota=velxpelota*(-1);
  }
  //Rebote Y paredes
  if (posypelota<0+15) {
    velypelota=velypelota*(-1);
  }
  //Rebote Paleta
  if (difposx<=45 && difposx>=(-45) && posypelota>=450) {
    velypelota=velypelota*(-1);
  }
if (posypelota>=height){
exit();
}
