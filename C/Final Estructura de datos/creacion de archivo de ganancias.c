# include <stdio.h>
# include <stdlib.h>
struct ganancias{
	int id;
	int dia;
	int mes;
	int year;
	float ganancia;
};
int main(){
	int i;
	FILE *fptr;
	struct ganancias ganancias={0,0,0,0,0.0};
	if((fptr=fopen("Registros de ganancias.text","w"))!=NULL){
		for(i=1;i<20000;i++)
			fwrite(&ganancias,sizeof(struct ganancias),1,fptr);	
	}
	else
		printf("error");
	fclose(fptr);
}
