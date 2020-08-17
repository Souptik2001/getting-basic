#include<stdio.h>
#include <string.h>

int main(int argc, char *argv[]){
    if(argc==2){
        printf("Checking key : <%s>\n", argv[1]);
        if(strcmp(argv[1], "BAR-FOO-SECRET_1425")==0){
            printf("Access Granted !\n");
        }else
        {
            printf("Invalid Key !\n");
        }
        
    }else{
        printf("Usage : <key>\n");
    }
}
