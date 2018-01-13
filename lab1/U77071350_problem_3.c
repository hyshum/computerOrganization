//
//  main.c
//  problem3
//
//  Created by Hok Yin Shum on 9/25/17.
//  Copyright © 2017 Hok Yin Shum. All rights reserved.
//

#include<stdio.h>
int main(){
    int D = 0;
    int Q = 0;
    int i=0;
    int j = 0;
    int temp = 0;
    char reversed_hexstring[50];
    
    scanf("%d", &D);
    
    Q = D;
    
    while(Q!=0){
        temp = Q % 16;
        
        if( temp < 10) temp = temp + 48;
        else temp = temp + 55;
        
       reversed_hexstring[i++]= temp;
        Q = Q / 16;
    }
    
    for(j = i -1 ;j>= 0;j--) // decrement output.
        printf("%c",reversed_hexstring[j]);
    
    return 0;
}

