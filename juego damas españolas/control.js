var tab= new Array(8);
var cx=0,cy=0,estado=0,conta1=2,conta2=2;
var nrojos=12,nazules=12;
var turno=0;
function checa(x,y){

  if(nrojos==0||nazules==0){
    juego();
    nrojos=12;
    nazules=12;
  }
  else{

  }
    if(tab[cx][cy]==-1)
      estado=0;
    if(tab[cx][cy]==1){
      if(conta1%2==0)
        estado=1;
      else
        estado=0;
      conta1++;
    }
    if(tab[cx][cy]==3){
      if(conta1%2==0)
        estado=3;
      else
        estado=0;
      conta1++;
    }
    if(tab[cx][cy]==2){
        if(conta2%2==0)
          estado=2;
        else
          estado=0;
        conta2++;
      }
      if(tab[cx][cy]==4){
          if(conta2%2==0)
            estado=4;
          else
            estado=0;
          conta2++;
        }
    if(tab[x][y]!=-1){/*condicion inicial--------------*/
/*-----------corona de rojos---------------------------------------*/
      if(estado==3&&turno==0){
        if(cx+1==x && y+1==cy)
          if(tab[x][y]==0){
              marcar(cx,cy,"black");
              ingresa(cx,cy,0);
              ingresa(x,y,3);
              marcar(x,y,"darkred");
              turno=1;
          }
        if(cx+1==x && y-1==cy)
          if(tab[x][y]==0){
            marcar(cx,cy,"black");
            ingresa(cx,cy,0);
            ingresa(x,y,3);
            marcar(x,y,"darkred");
            turno=1;
        }
        /*------come azules------*/

        if(cx-1==x && y+1==cy){
          if(tab[x][y]==0){
            marcar(cx,cy,"black");
            ingresa(cx,cy,0);
            ingresa(x,y,3);
            marcar(x,y,"darkred");
            turno=1;
          }
        }
        if(cx-1==x && y-1==cy){
          if(tab[x][y]==0){
            marcar(cx,cy,"black");
            ingresa(cx,cy,0);
            ingresa(x,y,3);
            marcar(x,y,"darkred");
            turno=1;
            }
        }
        /*comer azulesssssss*/
        if(cx-2==x && cy+2==y){
          if(tab[x][y]==0)
            if((tab[x+1][cy+1]==2)||(tab[x+1][cy+1]==4)){
              marcar(cx,cy,"black");
              ingresa(cx,cy,0);
              marcar(cx-1,cy+1,"black");
              ingresa(cx-1,cy+1,0);
              ingresa(x,y,3);
              marcar(x,y,"darkred");
              turno=1;
              nazules--;
              }
        }
        if(cx-2==x && cy-2==y){
          if(tab[x][y]==0)
            if((tab[cx-1][cy-1]==2)||(tab[cx-1][cy-1]==4)){
              marcar(cx,cy,"black");
              ingresa(cx,cy,0);
              marcar(cx-1,cy-1,"black");
              ingresa(cx-1,cy-1,0);
              ingresa(x,y,3);
              marcar(x,y,"darkred");
              turno=1;
              nazules--;
            }
        }
        if(cx+2==x && cy-2==y){
          if(tab[x][y]==0)
            if((tab[cx+1][cy-1]==2)||(tab[cx+1][cy-1]==4)){
              marcar(cx,cy,"black");
              ingresa(cx,cy,0);
              marcar(cx+1,cy-1,"black");
              ingresa(cx+1,cy-1,0);
              ingresa(x,y,3);
              marcar(x,y,"darkred");
              turno=1;
              nazules--;
              }
        }
        if(cx+2==x && cy+2==y){
          if(tab[x][y]==0)
            if((tab[cx+1][cy+1]==2)||(tab[cx+1][cy+1]==4)){
              marcar(cx,cy,"black");
              ingresa(cx,cy,0);
              marcar(cx+1,cy+1,"black");
              ingresa(cx+1,cy+1,0);
              ingresa(x,y,3);
              marcar(x,y,"darkred");
              turno=1;
             nazules--;
              }
        }
        estado=0;
      }


/*-----------corona de azules---------------------------------------*/

if(estado==4&&turno==1){
  if(cx+1==x && y+1==cy)
    if(tab[x][y]==0){
        marcar(cx,cy,"black");
        ingresa(cx,cy,0);
        ingresa(x,y,4);
        marcar(x,y,"darkblue");
        turno=0;
    }

  if(cx+1==x && y-1==cy)
    if(tab[x][y]==0){
      marcar(cx,cy,"black");
      ingresa(cx,cy,0);
      ingresa(x,y,4);
      marcar(x,y,"darkblue");
      turno=0;
  }

  if(cx-1==x && y+1==cy){
    if(tab[x][y]==0){
      marcar(cx,cy,"black");
      ingresa(cx,cy,0);
      ingresa(x,y,4);
      marcar(x,y,"darkblue");
      turno=0;
      nrojos--;
    }
  }
  if(cx-1==x && y-1==cy){
    if(tab[x][y]==0){
      marcar(cx,cy,"black");
      ingresa(cx,cy,0);
      ingresa(x,y,4);
      marcar(x,y,"darkblue");
      turno=0;
      nrojos--;
      }
  }
  /*comer azulesssssss*/
  if(cx-2==x && cy+2==y){
    if(tab[x][y]==0)
      if(tab[x+1][cy+1]==1||tab[x+1][cy+1]==3){
        marcar(cx,cy,"black");
        ingresa(cx,cy,0);
        marcar(cx-1,cy+1,"black");
        ingresa(cx-1,cy+1,0);
        ingresa(x,y,4);
        marcar(x,y,"darkblue");
        turno=0;
        nrojos--;
        }
  }
  if(cx-2==x && cy-2==y){
    if(tab[x][y]==0)
      if(tab[cx-1][cy-1]==1||tab[cx-1][cy-1]==3){
        marcar(cx,cy,"black");
        ingresa(cx,cy,0);
        marcar(cx-1,cy-1,"black");
        ingresa(cx-1,cy-1,0);
        ingresa(x,y,4);
        marcar(x,y,"darkblue");
        turno=0;
        nrojos--;
      }
  }
  if(cx+2==x && cy-2==y){
    if(tab[x][y]==0)
      if(tab[cx+1][cy-1]==1||tab[cx+1][cy-1]==3){
        marcar(cx,cy,"black");
        ingresa(cx,cy,0);
        marcar(cx+1,cy-1,"black");
        ingresa(cx+1,cy-1,0);
        ingresa(x,y,4);
        marcar(x,y,"darkblue");
        turno=0;
        nrojos--;
        }
  }
  if(cx+2==x && cy+2==y){
    if(tab[x][y]==0)
      if(tab[cx+1][cy+1]==1||tab[x+1][cy+1]==3){
        marcar(cx,cy,"black");
        ingresa(cx,cy,0);
        marcar(cx+1,cy+1,"black");
        ingresa(cx+1,cy+1,0);
        ingresa(x,y,4);
        marcar(x,y,"darkblue");
        turno=0;
        nrojos--;
        }
  }
  estado=0;
}

/*--------------fichas rojas------------------------------------*/
      if(estado==1&&turno==0){
        if(cx+1==x && y+1==cy){
          if(tab[x][y]==0){
              marcar(cx,cy,"black");
              ingresa(cx,cy,0);
              if(x==7){
                ingresa(x,y,3);
                marcar(x,y,"darkred");
              }
              else{
                ingresa(x,y,1);
                marcar(x,y,"red");
              }
              turno=1;
          }

        }
        if(cx+1==x && y-1==cy){
          if(tab[x][y]==0){
              marcar(cx,cy,"black");
              ingresa(cx,cy,0);
              if(x==7){
                ingresa(x,y,3);
                marcar(x,y,"darkred");
              }
              else{
                ingresa(x,y,1);
                marcar(x,y,"red");
              }
              turno=1;
            }
        }
        /*------come azules------*/
        if(cx+2==x && cy-2==y){
          if(tab[x][y]==0)
            if(tab[x-1][y+1]==2||tab[x-1][y+1]==4){
                marcar(cx,cy,"black");
                ingresa(cx,cy,0);
                marcar(x-1,y+1,"black");
                ingresa(x-1,y+1,0);
                if(x==7){
                  ingresa(x,y,3);
                  marcar(x,y,"darkred");
                }
                else{
                  ingresa(x,y,1);
                  marcar(x,y,"red");
                }
                nazules--;
                turno=1;
              }
        }
        if(cx+2==x && cy+2==y){
          if(tab[x][y]==0)
            if(tab[x-1][y-1]==2||tab[x-1][y-1]==4){
                marcar(cx,cy,"black");
                ingresa(cx,cy,0);
                marcar(x-1,y-1,"black");
                ingresa(x-1,y-1,0);
                if(x==7){
                  ingresa(x,y,3);
                  marcar(x,y,"darkred");

                }
                else{
                  ingresa(x,y,1);
                  marcar(x,y,"red");
                }
                nazules--;
                turno=1;
              }
        }
        estado=0;
      }/*termina condicion para mover rojos*/
      /*come rojos--------------*/
        if(estado==2 && turno==1){
          if(cx-1==x && y-1==cy){
            if(tab[x][y]==0){
                marcar(cx,cy,"black");
                ingresa(cx,cy,0);
                if(x==0){
                  ingresa(x,y,4);
                  marcar(x,y,"darkblue");
                }
                else{
                  ingresa(x,y,2);
                  marcar(x,y,"blue");
                }
                turno=0;
            }
          }
          if(cx-1==x && y+1==cy){
            if(tab[x][y]==0){
                marcar(cx,cy,"black");
                ingresa(cx,cy,0);
                if(x==0){
                  ingresa(x,y,4);
                  marcar(x,y,"darkblue");
                }
                else{
                  ingresa(x,y,2);
                  marcar(x,y,"blue");
                }
                turno=0;
            }
          }
          /*------come rojos------*/
          if(cx-2==x && cy+2==y){
            if(tab[x][y]==0)
              if(tab[cx-1][cy+1]==1||tab[cx-1][cy+1]==3){
                  marcar(cx,cy,"black");
                  ingresa(cx,cy,0);
                  marcar(cx-1,cy+1,"black");
                  ingresa(cx-1,cy+1,0);
                  if(x==0){
                    ingresa(x,y,4);
                    marcar(x,y,"darkblue");
                  }
                  else{
                    ingresa(x,y,2);
                    marcar(x,y,"blue");
                  }
                  nrojos--;
                  turno=0;
                }
          }
          if(cx-2==x && cy-2==y){
            if(tab[x][y]==0)
              if(tab[cx-1][cy-1]==1||tab[cx-1][cy-1]==3){
                  marcar(cx,cy,"black");
                  ingresa(cx,cy,0);
                  marcar(cx-1,cy-1,"black");
                  ingresa(cx-1,cy-1,0);
                  if(x==0){
                    ingresa(x,y,4);
                    marcar(x,y,"darkblue");
                  }
                  else{
                    ingresa(x,y,2);
                    marcar(x,y,"blue");
                  }
                  nrojos--;
                  turno=0;
                }
          }
          estado=0;
        }/*termina condicion para mover azules*/
    }/*termina condicion inicial*/
/*come rojos--------------*/
    console.log(cx,cy,x,y+" estado "+estado);
    cx=x;
    cy=y;

}/*termina funcion checa*/
function juego(){
  for(var i=0;i<8;i++)
    tab[i]=new Array(8);
    clearTab();
}
juego();
