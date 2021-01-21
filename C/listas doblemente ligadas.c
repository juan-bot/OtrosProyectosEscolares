# include <stdlib.h>
# include <stdio.h>
typedef struct nodo{
	struct nodo *ant;
	int dato;
	struct nodo *sig;
}tiponodo;
typedef struct lista{
	tiponodo *ini;
	tiponodo *fin;	
}tipolista;

void insertar(tipolista *);
void menu();
int main(){
	tipolista lista={NULL};
	int opc;
	do{
		menu();
		scanf("%d",&opc);
		switch(opc){
			case 1: 
				system("cls");
				insertar(&lista);
				break;
			case 2:break;
			case 3:break;
		}
	}while(opc!=4);
}
void insertar(tipolista *listaT){
	tiponodo *nuevo,*aux,*ini;
	int dato;
	nuevo=(tiponodo *)malloc(sizeof(tiponodo));
	if(nuevo!=NULL){
		printf("Ingresa el elemento...");
		scanf("%d",&dato);
		nuevo->dato=dato;
		nuevo->ant=NULL;
		nuevo->sig=NULL;
		if(listaT->ini==NULL&&listaT->fin==NULL){
			listaT->ini=nuevo;
			listaT->fin=nuevo;		
		}
		else{
			if(listaT->ini->sig==NULL&&listaT->fin->sig==NULL){
				if(listaT->ini->dato<=dato&&listaT-fin->dato>dato){
					listaT->fin->ant=nuevo;
					listaT
				}
			}
			aux=listaT->ini;
			while(aux->sig!=NULL){
				if((aux->dato)<=dato&&aux->sig->dato>dato){
					aux->sig->ant=nuevo;
					nuevo->sig=aux->sig;
					aux->sig=nuevo;
					nuevo->ant=aux;
				}
				aux=aux->sig;
		printf("sdf\n");
			}
		}
	}
}
void menu(){
	printf("1: insertar\n");
	printf("2: eliminar\n");
	printf("3: mostrar\n");
	printf("4: salir\ningresa una opcion...");
}
