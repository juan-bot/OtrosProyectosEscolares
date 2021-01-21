//proyecto del supermercado
# include <stdio.h>
# include <stdlib.h>
# include <conio.h>
struct producto{
	int id;
	char nombre[20];
	float precio;
	struct producto *sig;
};

typedef struct cliente{
	int cliente; 
	struct producto *producto;
	float efectivo;
	float total;
	struct cliente *sig;
}tipoCliente;
typedef struct producto *tipoProducto; 
void menuPrincipal();
int menuProducto();
int menuCliente();
void altaProductos(tipoProducto *);
void listarProductos(tipoProducto );
int bajaProductos(tipoProducto *);
void modificacionProducto(tipoProducto *);
void mostrarProductos(tipoProducto );
int main(){
	int opc,x;
	tipoProducto producto={NULL}; 
	do{
		printf("	************");
		printf(" SUMERMERCADO ");
		printf("************\n\n");
		menuPrincipal();
		scanf("%d",&opc);
		switch(opc){
			case 1:
				system("cls");
				do{
				x=menuProducto();
					switch(x){
						case 1:
							system("cls");
							altaProductos(&producto);
							break;
						case 2:
							system("cls");
							break;
						case 3:
							system("cls");
							break;
						case 4:
							system("cls");
							listarProductos(producto);
							break;
						case 5:
							system("cls");
							break;
					}
				}while(x!=6);
			break;
		
			case 2:
				system("cls");
				do{
					x=menuCliente();
					switch(x){
						case 1:break;
						case 2:break;
						case 3:break;
						case 4:break;
					}	
				}while(x!=5);
			break;
		}	
	}while(opc!=3);
}
void altaProductos(tipoProducto *productoT){
	struct producto *nuevo;
	int id,n;
	nuevo=(struct producto *)malloc(sizeof(struct producto));
	if(nuevo!=NULL){
		printf("Ingresa el id del producto\n");
		scanf("%d",&nuevo->id);
		printf("Ingresa el nombre del producto\n");
		scanf("%s",nuevo->nombre);
		printf("Ingresa el precio del producto\n");
		scanf("%f",&nuevo->precio);
		nuevo->sig=*productoT;
		*productoT=nuevo;
	}
}
void listarProductos(tipoProducto productoT){
	if(productoT==NULL)
		printf("No hay elementos\n");
	else{
		printf("Id     Nombre    Precio\n");
		while(productoT!=NULL){
			printf("%-7d%-10s%.1f\n",productoT->id,productoT->nombre,productoT->precio); 
			productoT=productoT->sig;
		}	
	}
}
void menuPrincipal(){
	printf("		1: Gestion de productos\n		2: Clientes\n		3: Salir\nIngresa una opcion...");
}
int menuProducto(){
	int opc;
	printf("1. Altas de productos\n");
	printf("2. Bajas de productos\n");
	printf("3. Modificaciones a algún producto\n");
	printf("4. Listar productos existentes\n");
	printf("5. Guardar registros en un archivo\n");
	printf("6: Salir\nIngresa una opcion...");
	scanf("%d",&opc);
	return opc;
}
int menuCliente(){
	int opc;
	printf("1. Insertar cliente a la cola\n	a. Agregar producto al carrito\n	b. Quitar producto del carrito\n");
	printf("2. Consultar un cliente\n");
	printf("3. Visualizar cola de clientes\n");
	printf("4. Atender cliente\n");
	printf("5. Salir\nIngresa una opcion...");
	scanf("%d",&opc);
	return opc;
}
