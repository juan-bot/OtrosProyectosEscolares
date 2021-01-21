# include <stdio.h>
# include <stdlib.h>
# include <time.h>
void giro_izquierda();
void giro_derecha();
void dibujar(int **,int *,int,int,int);
void menu();
void lee_datos();
void imprime(int **);
int main(){
	srand(time(NULL));
	int **tab;
	int pluma=0;
	int direccion=0,i,j;
	int pos[2]={0,0};
	int cmd[1000];
	tab=(int **)malloc(sizeof(int *)*50);
	if(tab==NULL){
	   printf("Error en la ejecucion\n");
	   system("pause");
	   exit(1);
	}
	for(i=0;i<50;i++){
		tab[i]=(int *)malloc(sizeof(int)*50);
		if(tab==NULL){
		printf("Error en la ejecucion\n");
		system("pause");
		exit(1);
	    }
	    for(j=0;j<50;j++)
	      tab[i][j]=0;
		
	}
	lee_datos(cmd);//leemos las instrucciones
	  
	i=0;
	while(cmd[i]!=9){
		
		switch(cmd[i]){
			case 1: pluma =0;i++;;
			        direccion =rand()%4;
			        pos[0]=rand()%49;
		        	pos[1]=rand()%49;tab[pos[0]][pos[1]]=2; break;
			case 2: pluma=1;i++;break;
			case 3: giro_derecha(&direccion);i++;break;
			case 4: giro_izquierda(&direccion);i++;break;
			case 5: dibujar(tab,pos,cmd[i+1],direccion,pluma);i++;break;
			case 6: imprime(tab);i++;break;
		}
		
		
	}

}
void dibujar(int **tor,int *pos,int n,int sen,int pincel){
	int i;
	int j;
	int x;
	int y;
	x=pos[0];
	y=pos[1];
	switch(sen){
		case 0:for(i=0;i<n;i++,x++){
		        if(x>49)
		           x=0;
		         if (pincel==1)
				    tor[y][x]=1;
				 else 
				    tor[y][x]=2;
				 pos[0]=x;pos[1]=y;}
				 break;
	   case 1:
			for(i=0;i<n;i++,y++){
			   if(y>49)
		         y=0;
		         if (pincel==1)
				    tor[y][x]=1;
				 else 
				    tor[y][x]=2;
				 pos[1]=y;
				}
				 break;
		case 2:
			for(i=0;i<n;i++,x--){
			     if(x<0)
		          x=49;
		         if (pincel==1)
				    tor[y][x]=1;
				 else 
				    tor[y][x]=2;
				 pos[0]=x;}
				 break;
		case 3:
			for(i=0;i<n;i++,y--){
		       	 if(y<0)
		           y=49;
		         if (pincel==1)
				    tor[y][x]=1;
				 else 
				    tor[y][x]=2;
				 pos[1]=y;}
				 break;
		
	}	
}
void imprime(int ** ventana){
	int i;
	int j;
	for(i=1;i<50;i++)
	   printf("_");
	   printf("\n");
	for(i=0;i<50;i++){
		
	   for(j=0;j<50;j++){
		if(ventana[i][j]==1)
		  printf("*");
		else
		if(ventana[i][j]==2)
		   printf("b");
		else 
		  printf(" ");	
	   }
	   printf("|\n");
	}
	for(i=1;i<50;i++)
	   printf("_");
	   printf("\n");
}
void giro_derecha(int *dir){
		if(*dir==3)
	       *dir=0;
	    else   
	        *dir++;
	
}
void giro_izquierda(int *dir){
   if(*dir==0)
	   *dir=3;
	else 
	   *dir--;
	
}

void lee_datos(int *cmdo){
	int i=0;
	do{
		system("cls");
		menu();
		printf("\tIngrese el comando \n");
		scanf("%d",&cmdo[i]);
		if(cmdo[i]==5){
			i++;
			printf("\t Ingrese el numero de pasos\n");
			scanf("%d",&cmdo[i]);
		}
		i++;
	}while(cmdo[i-1]!=9);
	
}

void menu(){
	printf("\t****************************\n");
	printf("\t* 1.-%-22s*\n","Pluma arriba");
	printf("\t* 2.-%-22s*\n","Pluma abajo");
	printf("\t* 3.-%-22s*\n","Giro derecha");
	printf("\t* 4.-%-22s*\n","Giro izquierda");
	printf("\t* 5.-%-22s*\n","Avanzar  n posiciones");
	printf("\t* 6.-%-22s*\n","Imprimir");
	printf("\t* 9.-%-22s*\n","fin de datos");
	printf("\t****************************\n");
}
