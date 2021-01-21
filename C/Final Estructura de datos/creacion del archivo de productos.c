# include <stdio.h>
# include <stdlib.h>
# include <conio.h>
struct producto{
	int id;
	char nombre[20];
	int nProd;
	float precioC;
	float precioV;
	struct producto *next;
};
int main(){
	struct producto productos={0,"",0,0.0,0.0,NULL};
	FILE *productPtr;
	int i;
	if((productPtr=fopen("Registros de productos.txt","w"))!=NULL){
		for(i=0;i<100000;i++)
			fwrite(&productos,sizeof(struct producto),1,productPtr);
		
	}
	else
		printf("error");
	fclose(productPtr);

}
