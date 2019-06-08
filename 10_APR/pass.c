#include<stdio.h>
#include<string.h>
int main()
{
    char a[100];
    printf("Enter the password to know the secret information\t");
    scanf("%s",a);
    if(strcmp(a,"mnit@12345")==0)
        printf("Sherlock is one step ahead of Moriarty!!\n");
    else
        printf("Sorry !! Wrong Match.\n");
    return 0;
}
