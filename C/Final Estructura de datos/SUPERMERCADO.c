#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <time.h>
#include <conio.h>
struct producto{
	int id;
	char nombre[20];
	int nProd;
	float precioC;
	float precioV;
	struct producto *next;
};

typedef struct cliente{
	float efectivo;
	float pagar;
	float total;
	int id;
	struct cliente *sig;
	struct producto *ini;
	struct producto *fin;
}tipoCliente;
typedef struct Cola{
	tipoCliente *ini;
	tipoCliente *fin;
}tipoColaPtr;
struct ganancias{
	int id;
	int dia;
	int mes;
	int year;
	float ganancia;
};
void insertarProducto(FILE *);
void ModificarProducto(FILE *);
void eliminarProducto(FILE *);
void quitarCarrito(tipoCliente *,FILE *);
float ingresaCarrito(tipoCliente *,FILE *);
float insertar(tipoColaPtr *,FILE *,int);
struct producto* rellenaProducto(FILE *,tipoCliente *,float *);
tipoCliente* rellena(int);
void atenderCliente(tipoColaPtr *);
void consultarCliente(tipoColaPtr);
void visualizar(tipoColaPtr);
void facturaCliente(tipoCliente);
int menu(void);
int menu2();
void consultarCliente(tipoColaPtr);
void menuProd(FILE *);
void consultarGanancias(FILE *);
void agregarGanancia(FILE *,float);

int main(){
	struct producto productos={0,"",0,0.0,0.0,NULL};
	FILE *productPtr,*gananciaPtr;
	tipoColaPtr cola={NULL};
	int idGanancia=0;
	float ganancia=0.0;
	srand(time(NULL));
	if((productPtr=fopen("Registros de productos.txt","rb+"))!=NULL){
	int opc,id=0;
	system("color 0E");
	do{
		opc=menu();
		switch(opc){
			case 1: 
                system("cls");
				insertarProducto(productPtr);
				printf("\n\t\t\t");
				system("pause");
				break;
			case 2: 
                 system("cls");
				eliminarProducto(productPtr);
				printf("\n\t\t\t");
				system("pause");
				break;
			case 3: 
                 system("cls");
				ModificarProducto(productPtr);
				printf("\n\t\t\t");
				system("pause");
				break;
			case 4: 
				system("cls");
				menuProd(productPtr);
				printf("\n\t\t\t");
				system("pause");
				break;
			case 5: 
				system("cls");
				id+=1;
				ganancia+=insertar(&cola,productPtr,id);
				printf("\n\t\t\t");
				system("pause");
				break;
			case 6: 
                system("cls");
                consultarCliente(cola);
                printf("\n\t\t\t");
                system("pause");
				break;
			case 7: 
				system("cls");
				visualizar(cola);
				printf("\n\t\t\t");
				system("pause");
				break;
			case 8: 
				system("cls");
				atenderCliente(&cola);
				printf("\n\t\t\t");
				system("pause");
				break;
			case 9: 
				system("cls");
				consultarGanancias(gananciaPtr);
				printf("\n");
				system("pause");
				break;
		}
		system("cls");
		if(opc==10 && cola.ini!=NULL){
           	printf("\t\t\tHay clientes formados todavia\n\t\t\t");
               system("pause");       
       }       
	}while(opc!=10 || cola.ini!=NULL);
	printf("\t\t\tGracias por su preferencia vuelva pronto :)\n");
	fclose(productPtr);
	}
	else
		printf("error");
	if((gananciaPtr=fopen("Registros de ganancias.text","rb+"))!=NULL)
		agregarGanancia(gananciaPtr,ganancia);
	else
		printf("error");
	fclose(gananciaPtr);
	printf("\n\t\t\t");
	system("pause");
	return 0;	
}
void agregarGanancia(FILE *gananciaPtr,float ganancia){
	struct ganancias ganancias={0,0,0,0,0.0};
	int id;
	time_t t;
  	struct tm *tm;
	t=time(NULL);
	tm=localtime(&t);
	if(ganancia>0.0){
		printf("Ingresa el id del registro de ganancia de este ciclo\n");
		scanf("%d",&id);
		while(id<1){
			system("cls");
			printf("id no permitido\n");
			printf("Ingresa el id del registro de ganancia de este ciclo \n");
			scanf("%d",&id);
		}
		fseek(gananciaPtr,(id-1)*sizeof(struct ganancias),SEEK_SET);
		fread(&ganancias,sizeof(struct ganancias),1,gananciaPtr);
			if(ganancias.id==0){
				ganancias.dia=tm->tm_mday;
				ganancias.mes=tm->tm_mon;
				ganancias.year=1900+tm->tm_year;
				ganancias.ganancia=ganancia;
				fseek(gananciaPtr,(id-1)*sizeof(struct ganancias),SEEK_SET);
				fwrite(&ganancias,sizeof(struct ganancias),1,gananciaPtr);
			}
			else
				printf("error");	
	}
	printf("\t\t\tNo hubieron ganancias el dia de hoy");

}
float insertar(tipoColaPtr *cola,FILE * productPtr,int cont){
	tipoCliente *nuevo;
	int opc;
	float ganancia;
	nuevo=rellena(cont);
	if(nuevo!=NULL){
		if(cola->ini==NULL)
			cola->ini=nuevo;
		else
			cola->fin->sig=nuevo;
		cola->fin=nuevo;
		do{
			opc=menu2();
			switch(opc){
				case 1: 
					system("cls");
					ganancia=ingresaCarrito(&(*nuevo),productPtr);
					break;
				case 2: 
					system("cls");
					quitarCarrito(&(*nuevo),productPtr);
					break;
			}	
		}while(opc!=3);			
	}
	return ganancia;
}
float ingresaCarrito(tipoCliente *cola,FILE *productPtr){
	struct producto *nuevo;
	float ganancia=0.0;
	nuevo=rellenaProducto(productPtr,&(*cola),&ganancia);
	if(nuevo!=NULL){
		if(cola->ini==NULL)
			cola->ini=nuevo;
		else
			cola->fin->next=nuevo;
		cola->fin=nuevo;
	}
	return ganancia;
}
void quitarCarrito(tipoCliente *cliente,FILE *productPtr){
	struct producto *temp,aux,*aux2;
	int identificador;;
	if(cliente->ini==NULL)
		printf("\t\t\tNo hay productos agregados\n");
	else{
		printf("\t\t  Ingresa el id del producto que desea quitar\n\t\t\t");
		scanf("%d",&identificador);
		if(identificador>0){
					fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
		fread(&aux,sizeof(struct producto),1,productPtr);
		if(aux.id==0)	
			printf("\t\t\tProducto no existente");
		else{
			cliente->total-=aux.precioV;
			aux.nProd+=1;
			fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
			fwrite(&aux,sizeof(struct producto),1,productPtr);
			temp=cliente->ini;
			if(temp->id==identificador){
				cliente->ini=temp->next;
				free(temp);
			}
			else{
				aux2=temp;
				temp=temp->next;
				while(temp->next!=NULL){
					if(temp->id==identificador){
						aux2->next=temp->next;
						free(temp);
					}
					aux2=temp;
					temp=temp->next;
				}
				if(temp->id==identificador){
					cliente->fin=aux2;
					free(temp);
				}				
			}
		}	
		}
		else
		 printf("\t\t\tid invalido!\n");

	}
}
struct producto* rellenaProducto(FILE *productPtr,tipoCliente *cola,float *ganancia){
	struct producto *nuevo;
	int identificador,cant;
	nuevo=(struct producto *)malloc(sizeof(struct producto));
	if(nuevo!=NULL){
		menuProd(productPtr);
		printf("Ingresa el id del producto...");
		scanf("%d",&identificador);
		if(identificador>0){
		fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
		fread(&(*nuevo),sizeof(struct producto),1,productPtr);
		if(nuevo->id==0)	
			printf("\t\t\tProducto no existente\n");
		else{
			printf("Ingresa la cantidad de productos que deseas agregar...");
		    scanf("%d",&cant);
		    if(cant>nuevo->nProd)
		    	printf("No hay suficientes cantidades en el inventario\n");
		    else{
			    cola->efectivo-=nuevo->precioV;
				cola->total+=nuevo->precioV;
				nuevo->nProd-=cant;
				*ganancia=(nuevo->precioV-nuevo->precioC)*cant;
				fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
				fwrite(&(*nuevo),sizeof(struct producto),1,productPtr);		
			}			
			
		}
	}
	else
		printf("\t\t\tid invalido!\n");
	}
	return nuevo;
}
void atenderCliente(tipoColaPtr *cola){
	float ganancia=0.0;
	tipoCliente *temp;
	if(cola->ini!=NULL){
		temp=cola->ini;
		cola->ini=temp->sig;
		facturaCliente(*temp);
		free(temp);
	}
	else
		printf("\t\t\tNo hay clientes formados\n");

}

tipoCliente* rellena(int cont){
	tipoCliente *nuevo;
	nuevo=(tipoCliente *)malloc(sizeof(tipoCliente));
	int sum=0;
	sum=500+rand()%2000;
	if(nuevo!=NULL){
		nuevo->id=cont;
		nuevo->efectivo=sum;
		nuevo->pagar=nuevo->efectivo;
		nuevo->sig=NULL;
		nuevo->fin=NULL;
		nuevo->ini=NULL;
	}	
	return nuevo;
}
void visualizar(tipoColaPtr cola){
	tipoCliente cliente;
	if(cola.ini==NULL)
		printf("\t\t\tNo hay clientes formados\n");
	else{
		cliente=*cola.ini;
		printf("\n\t\t\tFILA DE CLIENTES\n\tid: ");
		while(cliente.sig!=NULL){
			printf("[ %d ]->",cliente.id);
			cliente=*cliente.sig;
		}
		printf("[ %d ]\n",cliente.id);	
	}
}
void insertarProducto(FILE *productPtr){
	struct producto nuevo;
	int identificador;
	printf("\t\t\tIngresa el id del producto \n\t\t\t");
	scanf("%d",&identificador);
	if(identificador>0 ){
		fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
		fread(&nuevo,sizeof(struct producto),1,productPtr);
		if(nuevo.id==0){
			printf("\t\t\tIngresa el nombre del producto\n\t\t\t");
			scanf("%s",nuevo.nombre);
			printf("\t\t\tIngresa el numero de elementos del producto\n\t\t\t");
			scanf("%d",&nuevo.nProd);
			printf("\t\t\tIngresa el precio de compra del producto\n\t\t\t");
			scanf("%f",&nuevo.precioC);
			printf("\t\t\tIngresa el precio de venta del producto\n\t\t\t");
			scanf("%f",&nuevo.precioV);
			nuevo.id=identificador;
			fseek(productPtr,(nuevo.id-1)*sizeof(struct producto),SEEK_SET);
			fwrite(&nuevo,sizeof(struct producto),1,productPtr);
		}
		else
			printf("\t\t\tId ya ocupado");
	}
	else
		printf("\t\t\tid Invalido!");
}

void eliminarProducto(FILE *productPtr){
	struct producto temp;
	int identificador;
	printf("\t\t\tIngresa el id del producto a eliminar\n\t\t\t");
	scanf("%d",&identificador);
	if(identificador>0 ){
		fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
		fread(&temp,sizeof(struct producto),1,productPtr);
		if(temp.id!=0){
			temp.id=0;
			fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
			fwrite(&temp,sizeof(struct producto),1,productPtr);
		}
		else
			printf("\t\t\tProducto no existente");
	}
	else
		printf("\t\t\tid Invalido!");
}
void ModificarProducto(FILE *productPtr){
	struct producto temp;
	int opc;
	int identificador;
	printf("\t\t\tIngresa el id del producto que deseas modificar\n\t\t\t");
	scanf("%d",&identificador);
	if(identificador>0 ){
		fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
		fread(&temp,sizeof(struct producto),1,productPtr);
		if(temp.id!=0){
			printf("\t\t\tSelecciona el campo que desees modificar\n\t\t\t");
			printf("1: Nombre\n\t\t\t");
			printf("2: Precio de compra\n\t\t\t");
			printf("3: Precio de venta\n\t\t\t");
			printf("3: Numero de elementos\n\t\t\t");
			scanf("%d",&opc);
			switch(opc){
				case 1: 
					printf("\t\t\tIngresa el nuevo nombre\n\t\t\t");
					scanf("%s",temp.nombre);
					break;
				case 2: 
					printf("\t\t\tIngresa el nuevo precio de compera\n\t\t\t");
					scanf("%f",&temp.precioC);
					break;
				case 3: 
					printf("\t\t\tIngresa el nuevo precio de venta\n\t\t\t");
					scanf("%f",&temp.precioV);
					break;
				case 4: 
					printf("\t\t\tIngresa la nueva cantidad de productos\n\t\t\t");
					scanf("%d",&temp.nProd);
					break;
			}
			fseek(productPtr,(identificador-1)*sizeof(struct producto),SEEK_SET);
			fwrite(&temp,sizeof(struct producto),1,productPtr);
		}
		else
			printf("\t\t\tProducto no existente\n\t\t\t");

	}
	else
		printf("\t\t\tid Invalido!");
}
void consultarCliente(tipoColaPtr cola){
     int ident,bandera=0;
     tipoCliente cliente;
     struct producto producto;
     if(cola.ini==NULL)
     	printf("\t\t\tNo hay clientes formados\n");
     else{
         printf("\t\t\tIngresa el id del cliente que deseas consultar\n\t\t\t");
	     scanf("%d",&ident);
	     cliente=*cola.ini;
	     while(cliente.sig!=NULL){
	         if(cliente.id==ident){
	         	if(cliente.ini==NULL)
	         		printf("\t\t\tNo hay productos en el carrito\n");
				else{
		            producto=*cliente.ini;
		            printf("\t\t\t\t\tCarrito del cliente\n\n");
		            printf("\t\t\tid  Nombre    Precio de compra  Precio de venta\n");
		         	while(producto.next!=NULL){
						printf("\t\t\t%-4d%-16s%-16.2f%-16.2f\n",producto.id,producto.nombre,producto.precioC,producto.precioV);
						producto=*producto.next;
					}
					printf("\t\t\t%-4d%-16s%-16.2f%-16.2f\n",producto.id,producto.nombre,producto.precioC,producto.precioV);			
					bandera=1;
				} 
	         }
	         cliente=*cliente.sig;
	     }
	        if(cliente.id==ident){
	         	if(cliente.ini==NULL)
	         		printf("\t\t\tNo hay productos en el carrito\n");
				else{
		            producto=*cliente.ini;
		            printf("\t\t\t\t\tCarrito del cliente\n\n");
		            printf("\t\t\tid  Nombre    Precio de compra  Precio de venta\n");
		         	while(producto.next!=NULL){
		         		
						printf("\t\t\t%-4d%-16s%-16.2f%-16.2f\n",producto.id,producto.nombre,producto.precioC,producto.precioV);
						producto=*producto.next;
					}
					printf("\t\t\t%-4d%-16s%-16.2f%-16.2f\n",producto.id,producto.nombre,producto.precioC,producto.precioV);			
					bandera=1;
				} 
	
	         } 
		if(bandera==0)
	    printf("\n\t\t\tid invalido!\n");	
  	 } 
}
void facturaCliente(tipoCliente cliente){
	struct producto temp;
	char output[128];
  	time_t t;
  	struct tm *tm;
  	t=time(NULL);
  	tm=localtime(&t);
	strftime(output,128,"%d/%m/%y %H:%M:%S",tm);
	if(cliente.ini==NULL)
		printf("\t\t\tGracias por su preferencia\n");
	else{
		if(cliente.total>0){
			printf("\n\n\t\t  *********** SUPERMARKER**********\n\n\t\t\t");
			printf("Atendio Armando Fabian\n\t\t\t");
			printf("Lista de productos\n\n\t\t\t");
			temp=*cliente.ini;
			printf("id  Nombre    Precio de venta$");
			while(temp.next!=NULL){
				printf("\n\n\t\t\t%-4d%-10s%.2f",temp.id,temp.nombre,temp.precioV);
				temp=*temp.next;
			}
			printf("\n\n\t\t\t%-4d%-10s%.2f",temp.id,temp.nombre,temp.precioV);
			printf("\n\n\t\t\tTotal         %.2f",cliente.total);
			printf("\n\t\t\tEfectivo      %.2f",cliente.pagar);
			printf("\n\t\t\tSu cambio     %.2f",cliente.efectivo);
	    	printf("\n\n\t\t\t%s\n",output);
			printf("\n\n\t\t\t¡Gracias por su compra!\n\t\t");	
		}
		else
			printf("\n\n\t\t\tCliente [%d] no compro nada\n",cliente.id);
	}
}
void consultarGanancias(FILE *gananciaPtr){
	struct ganancias ganancia;
	int i,bandera=0,dia1,mes1,year1,dia2,mes2,year2;
	float total=0.0;
	printf("Ingresa el intervalo de frecha [dia/mes/year]-[dia/mes/year]\nde..");
	scanf("%d",&dia1);
	scanf("%d",&mes1);
	scanf("%d",&year1);
	printf("\na..");
	scanf("%d",&dia2);
	scanf("%d",&mes2);
	scanf("%d",&year2);
	for(i=1;i<=200;i++){
		fseek(gananciaPtr,(i-1)*sizeof(struct producto),SEEK_SET);
		fread(&ganancia,sizeof(struct producto),1,gananciaPtr);
		if(ganancia.id==0)
			
			if((ganancia.dia>=dia1 && ganancia.dia<=dia2) && (ganancia.mes>=mes1 || ganancia.mes<=mes2) && (ganancia.year>=year1 || ganancia.year<=year2)){
				bandera=1;
				total+=ganancia.ganancia;
			}
	}
	if(bandera==1)
		printf("\nGanancia de [%d/%d/%d]-[%d/%d/%d] : %.2f\n",dia1,mes1,year1,dia2,mes2,year2,total);
	else
		printf("No hay registros de ganancias en ese intervalo de fechas\n");
}
void menuProd(FILE *productPtr){
	struct producto temp;
	int opc,i;
	printf("\n\t\t");
	for(i=1;i<=33;i++)
		printf("%c ",248);
	printf("\n\t\t%c\t\t\t  Productos en stok                     %c\n\t\t%c  ",248,248,248);
	printf("id    Nombre   Cantidad   Precio de venta   Precio de compra %c\n\t\t%c\t\t\t\t\t\t\t\t%c\n",248,248,248);
	rewind(productPtr);
	while(!feof(productPtr)){
		fread(&temp,sizeof(struct producto),1,productPtr);
		if(temp.id!=0)
			printf("\t\t%c  %-6d%-12s%-12d%-18.2f%-13.2f%c\n",248,temp.id,temp.nombre,temp.nProd,temp.precioV,temp.precioC,248);
	}
printf("\t\t");
	for(i=1;i<=33;i++)
		printf("%c ",248);
	printf("\n\t\t\t");
}
int menu2(){
	int opc,i;
	printf("\t\t\t");
	for(i=1;i<=13;i++)
		printf("%c ",176);
	printf("\n\t\t\t%c 1:agregar al carrito  %c\n",176,176);
	printf("\t\t\t%c 2:eliminar producto   %c\n",176,176);
	printf("\t\t\t%c 3:salir		%c\n\t\t\t",176,176);
	for(i=1;i<=13;i++)
		printf("%c ",176);
	printf("\n\t\t\tIngresa una opcion...");
	scanf("%d",&opc);
	return opc;
}
int menu(void){
	int opc,i;
	struct producto temp;
	printf("\n\n\t\t****************** SUPERMARKER ******************\n\n\t\t\t");
	printf("\n\t\t\t");
	for(i=1;i<=17;i++)
		printf("%c ",176);
	printf("\n\t\t\t%c 1:%-28s%c\n",176,"Dar de alta un producto",176);
	printf("\t\t\t%c 2:%-28s%c\n",176,"Dar de baja un producto",176);
	printf("\t\t\t%c 3:%-28s%c\n\t\t\t",176,"Modificar un producto",176);
	printf("%c 4:%-28s%c\n\t\t\t",176,"Enlistar productos",176);
	for(i=1;i<=17;i++)
		printf("%c ",176);
	printf("\n\n\n\t\t\t");
	for(i=1;i<=17;i++)
		printf("%c ",176);	
	printf("\n\t\t\t%c 5:%-28s%c\n",176,"Insertar Cliente",176);
	printf("\t\t\t%c 6:%-28s%c\n",176,"Consultar Cliente",176);
	printf("\t\t\t%c 7:%-28s%c\n",176,"Visualizar cola de clientes",176);
	printf("\t\t\t%c 8:%-28s%c\n",176,"Atender Cliente",176);
	printf("\t\t\t%c 9:%-28s%c\n",176,"Consultar Ganancias",176);
	printf("\t\t\t%c 10:%-27s%c\n\t\t\t",176,"Salir",176);
	for(i=1;i<=17;i++)
		printf("%c ",176);
	printf("\n\t\t\tIngresa una opcion...");
	scanf("%d",&opc);
	return opc;
}
