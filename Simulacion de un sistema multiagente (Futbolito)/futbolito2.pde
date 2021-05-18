int rad = 17;        // Width of the shape
float xpos, ypos;    // Starting position of shape    
float xspeed = 10.0;  // 
float yspeed = 10.0;  // 
int xdirection = 1;  // Left or Right
int ydirection = 1;
int largo=1340,largocancha;
int ancho=750,anchocancha;
int dm=0,um=9,ds=5,us=0;
float x, y;
float dim = 80.0;
PImage balon,jugador1,jugador2, marcador,team1,team2;
PImage btn_play;
PImage btn_stop;
int lastSecond = 0;
int n=16, inicio=0, golesT1=0,golesT2=0;
int tiempoAnimacion=0,bandgol=0;

PFont myFont;
float xx = 240;
float yy = 200;
float vx = 100;
float vy = 0;
float dt = 1.0/30.0;
float gravity = 900;
float restitution = .9;


Jugador[] jugadores = new Jugador[n];

int rectX, rectY;      // Position of square button
int rectSize = 90;     // Diameter of rect
color rectColor, baseColor;
boolean playOver = false;
boolean pauseOver = false;
boolean stopOver = false;
int play=0,stop=0,pause=0;
int game=0;
void setup() {  
  background(59, 59, 59 );
  size(1340, 750);
  largocancha=largo-160;
  anchocancha= ancho-210;
  jugadores = new Jugador[n];
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  IniciaJugadores();
  balon = loadImage("balon.png");
  jugador1 = loadImage("jugador1.png");
  jugador2 = loadImage("jugador2.png");
  marcador=loadImage("marcador2.png");
  team1=loadImage("amarillo.png");
  team2=loadImage("azul.png");
  btn_play=loadImage("play.png");
  btn_stop=loadImage("stop.png");
  lastSecond=second();
}

void draw() { 
  int s=second();
  updateMouse();
  cancha();
  if(bandgol==0){
    drawJugador();
    if(play==1)
      balon();
    else
       image(balon, xpos-16, ypos-40, rad*2, rad*2);//actualiza la posision del balon
  }
  else
    Animacion("GOOOOOOOOOL");
  if(stop==1)
    Animacion("STOOOOP!");
  if(game==1)
    Animacion("GAME OVER!!");
  image(marcador,473, 630, 390, 120);
  textSize(40);
  fill(255);
  text(golesT1, 545, 684); 
  textSize(40);
  fill(255);
  text(golesT2, 755, 684); 
  textSize(30);
  fill(0);
  text(dm+""+um+":"+ds+""+us, 633, 665);
  if(play==1)
    cronometro(s);
  if(tiempoAnimacion==6){
    bandgol=0;
    tiempoAnimacion=0;
    xx = 260;
    yy = 200;
    vx = 100;
  }
  image(btn_play,150, 8, 60, 60);
  image(btn_stop,300, 8, 60, 60);
}
void cronometro(int s){
  if(s!=lastSecond){
    if(bandgol==1)
       tiempoAnimacion++;
    lastSecond = s;
    if(us<9)
      us++;
     else{
       us=0;
       if(ds<5)
         ds++;
        else{
          ds=0;
          us=0;
          if(um<9)
            um++;
           else{
             um=0;
             dm++;
           }
        }
     }
  }
  if(dm==1){
    play=0;
    dm=um=ds=us=0;
    
    IniciaJugadores();
    game=1;
    tiempoAnimacion=bandgol=0;
  }
  
}
void updateMouse() {
  if ( overMouse(150, 8, 60, 60) ) {
    playOver = true;
  } else {
    playOver = false;
  }
  if ( overMouse(300, 8, 60, 60) ) {
    stopOver = true;
  } else {
    stopOver = false;
  }
}
void mousePressed() {
  if (playOver) {
    if(play==0){
      IniciaJugadores();
      golesT1=golesT2=0;
    }
    play=1;
    stop=0;
    game=0;
    
  }
  if (stopOver) {
    xx = 240;
    yy = 200;
    vx = 100;
    vy = 0;
    stop=1;
    play=0;
    dm=um=ds=us=0;
    golesT1=golesT2=0;
    IniciaJugadores();
  }
}
boolean overMouse(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
void drawJugador(){
  for (int i=0;i<n;i++) {
    jugadores[i].display();
    if(play==1){
      if(i==0|| i==8)
        jugadores[i].move(random(-4, 4),random(-5, 5));
      if(i==1|| i==2 || i==3|| i==9 || i==10|| i==11)
        jugadores[i].move(random(-4, 4),random(-15, 15));
      if(i==4|| i==5 || i==6|| i==7)
        jugadores[i].move(random(-11.5, 12),random(-8, 8));
       if(i==12|| i==13 || i==14|| i==15)
        jugadores[i].move(random(-12, 11.5),random(-8, 8));
    }
    
  }
}
void balon(){
// actualiza la posicion del balon
  xpos = xpos + ( xdirection*xspeed);
  ypos = ypos + ( ydirection*yspeed);
  //rebota con el contorno del tablero
  if (xpos > 1234-rad ) {//rebota con el lado c 
    if((ypos>=(anchocancha/2)+20) && (ypos<=(anchocancha/2)+140)){//si toco la porteria es gool
      golesT1++;
      bandgol=1;
      IniciaJugadores();
    }
     xdirection *= -1;
  }
  
  if ( xpos <= rad+75) {//rebota con el lado a
    if((ypos>=(anchocancha/2)+20) && (ypos<=(anchocancha/2)+140)){//si toco la porteria es gool
      golesT2++;
      bandgol=1;
      IniciaJugadores();
    }
     xdirection *= -1;
  }
    
  if (ypos > 592-rad || ypos < rad+72) {// lado d y b
    ydirection *= -1;
  }
  stroke(0); 
  fill(225);
  image(balon, xpos, ypos, rad*2, rad*2);//actualiza la posision del balon
  //print(xpos+"  "+ypos+"\n");
}

public class Jugador{
  private float y;
  private float x;
  private float size=50;
  private int team;// equipo 1; equipo 2
  private int tipoJugador;// 2 delantero; 2 defensa; 1 portero
  Jugador(float x1, float y1, int tipo,int equipo){
    x=x1;
    y=y1;
    tipoJugador=tipo;
    team=equipo;
  }
  public void move(float x1,float y1){
    if(tipoJugador==1){
      if((y+y1>=230) && (y+y1 <=400)){
        if(team==1 && (x+x1>=80) && (x+x1<=170)){
          x+=x1;
          y+=y1;
        }
        if(team==2 && (x+x1>=largocancha-60) && (x+25+x1 <=largocancha+60)){
          x+=x1;
          y+=y1;
        }
      }
     }else {
       if (y+y1 >= 82 && y+y1 <= 570 ) {// lado b y darriba y abajo
          y+=y1;
        }
       if(team==1)
         if (tipoJugador==2 && x+x1 >= 83 && x+x1 <= (largocancha/2)+70) { //lado a y c izquierdo y derecho
           x+=x1;
         }
       if(team==2)
         if (tipoJugador==2 && x+x1 >= (largocancha/2)+90 && x+x1 <= 1200) { //lado a y c izquierdo y derecho
           x+=x1;
         }
       if (tipoJugador==3 && x+x1 >= 83 && x+x1 <= 1200) { //lado a y c izquierdo y derecho
         x+=x1;
       }
      }
  }
  
  public void display(){
    if(((x+52 == xpos) ||(x == xpos+rad))&& (ypos >= y && ypos<= y+25)){
       ydirection *= -1;
       xdirection *= -1;
       xspeed=random(9, 11);
       yspeed=random(1, 9);
    }
    if((xpos <=x && xpos<=x)&&(ypos == y+25)){//toque con los pies
       xdirection *= -1;
       ydirection *= -1;
       xspeed=random(9, 11);
       yspeed=random(1, 9);
    }
    if(((ypos+17 >= y) && (ypos-17<=y+25)) && ((xpos+17>=x)&&(xpos-17 <=x+25))){
       xdirection *= -1;
       ydirection *= -1;
       xspeed=random(9, 11);
       yspeed=random(1, 9);
    }
    if(team==1)
      image(jugador1,x,y,size,size);
    
    if(team==2)
      image(jugador2,x,y,size,size);
 
  }
}
void cancha(){
  background(59, 59, 59 );
  fill(#22B310);//fondo verde
  stroke(255);//contorno color blanco
  rect(80, 80, largocancha,anchocancha); //CANCHA
  
  stroke(255); 
  ellipse((largocancha/2)+80, (anchocancha/2)+80, 40, 40); //circulo medio de la cancha
  
  stroke(255);
  strokeWeight(5);  // grosor de la linea
  line((largocancha/2)+80, 81, (largocancha/2)+80, anchocancha+80);//linea de media cancha (x1, y1, x2, y2)   870, 81, 870, 909
  
  stroke(255);//contorno color blanco
  rect(80, (anchocancha/2)+20, -20,120); //porteria 1
  
  stroke(255);//contorno color blanco
  ellipse(210, (anchocancha/2)+80, 50, 60); //semicirculo area3 porteria 1
  
  stroke(255);//contorno color blanco
  rect(80, (anchocancha/2)-40, 140,240); //area2 porteria 1, la mas grande
  
  stroke(255);//contorno color blanco
  rect(80, (anchocancha/2), 30,160); //area1 porteria 1

  stroke(255); 
  rect(largocancha+80, (anchocancha/2)+20, 20,120); //porteria2
  
  stroke(255);//contorno color blanco
  ellipse(largocancha-50, (anchocancha/2)+80, 50, 60); //semicirculo area3 porteria 2
  
  stroke(255);//contorno color blanco
  rect(largocancha+80, (anchocancha/2)-40, -140,240); //area2 porteria 2, la mas grande
  
  stroke(255);//contorno color blanco
  rect(largocancha+80, (anchocancha/2), -30,160); //area1 porteria 2
  
  image(team1, 260, 630, 100, 100);
  image(team2, 1000, 630, 100, 100);
}
void IniciaJugadores(){
  xpos = width/2;// Set the starting position of the shape
  ypos = height/2;
  jugadores[0] = new Jugador(120, (anchocancha/2)+40,1,1);//portero equipo 1
  //defensas equipo 1
  jugadores[1] = new Jugador(300, (anchocancha/2)-80,2,1);
  jugadores[2] = new Jugador(300, (anchocancha/2)+40,2,1);
  jugadores[3] = new Jugador(300, (anchocancha/2)+160,2,1);
  //delanteros equipo 1
  jugadores[4] = new Jugador(500, (anchocancha/2)-80,3,1);
  jugadores[5] = new Jugador(500, (anchocancha/2),3,1);
  jugadores[6] = new Jugador(500, (anchocancha/2)+80,3,1);
  jugadores[7] = new Jugador(500, (anchocancha/2)+160,3,1);
  
  jugadores[8] = new Jugador(largocancha-20, (anchocancha/2)+40,1,2);//portero equipo 2
  //defensas equipo 2
  jugadores[9] = new Jugador(largocancha-200, (anchocancha/2)-80,2,2);
  jugadores[10] = new Jugador(largocancha-200, (anchocancha/2)+40,2,2);
  jugadores[11] = new Jugador(largocancha-200, (anchocancha/2)+160,2,2);
  //delanteros equipo 2
  jugadores[12] = new Jugador(largocancha-400, (anchocancha/2)-80,3,2);
  jugadores[13] = new Jugador(largocancha-400, (anchocancha/2),3,2);
  jugadores[14] = new Jugador(largocancha-400, (anchocancha/2)+80,3,2);
  jugadores[15] = new Jugador(largocancha-400, (anchocancha/2)+160,3,2);
}
void Animacion(String cad){
  frameRate(30);
  smooth();
  myFont = createFont("FFScala", 54);
  textFont(myFont);
  fill(0,0,0,60);
  rect(0,0,width,height);
  fill(255);
  text(cad, xx, yy);
  vy += gravity*dt;
  xx += vx*dt;
  yy += vy*dt;
  if (xx < 100){
    xx = 100;
    vx *= -restitution;
  } else if (xx > width-400){
    //The 100 here is roughly the width
    //of the text
    xx = width-400;
    vx *= -restitution;
  }
  if (yy > 500){
    yy = 500;
    vy *= -restitution;
  }
}
