#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<ctype.h>

int main() {
    char *string = malloc(255 * sizeof(char)); // initial size 255 => dynamic memory allocation
    fgets(string, 255, stdin);
    printf("\n");
    for (int i = 0; i < strlen(string); i++) {
        if (string[i] == '+' || string[i] == '-' || string[i] == '/' || string[i] == '*' || string[i] == '=') {
            printf("%c is an operator\n", string[i]);
        }
        else if (((int)string[i] >= 65 && (int)string[i]<=91) || ((int)string[i] >= 97 && (int)string[i]<=122) )
            printf("%c is a identifier\n", string[i]);
        else if(isdigit(string[i])){
            printf("%c is a constant" , string[i]);
        }
    }
    

    free(string); // free the allocated memory when done using it
    return 0;
}
