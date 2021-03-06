//
//  main.c
//  Lab1
//
//  Created by Hok Yin Shum on 9/20/17.
//  Copyright © 2017 Hok Yin Shum. All rights reserved.
//

/*
 Write a C program that accepts an integer from standard input, and prints out that integer as an unsigned binary number. Assume the input integer is 32 bits long. The output should have no leading zeros.
 Test your code with the following examples: • 72 → 1001001
 • 274 → 100010010
 • 1042 → 10000010010
 
 */



#include <stdio.h>

int main() {
    int a;
    int b[32] = {0};
    int FOUND = 0; //boolean.
    int MSB = 0;
    int i = 0;
    scanf("%d", &a);
    
    for(i=0; i<32; i++) {
        int bit = a % 2;
        a = a >> 1;
        b[i] = bit;
    }
    
    for(i = 31; i>= 0; i--){
    // find MSB first.
        if(b[i] != 0 && !(FOUND)){
        MSB = i;
        FOUND = 1;
    }
    if(i <= MSB){
        printf("%d", b[i]);
    }
    }

    
    

    printf("\n");
}


