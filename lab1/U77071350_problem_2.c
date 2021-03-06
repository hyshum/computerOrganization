//
//  main.c
//  new_problem2
//
//  Created by Hok Yin Shum on 9/25/17.
//  Copyright © 2017 Hok Yin Shum. All rights reserved.
//

#include <stdio.h>
#include <math.h>

int main() {
    char in[8];
    int output = 0;
    int i = 0;
    scanf("%s", in);
    
    if(in[0] == '0'){
        for(i = 1; i <= 7; ++i){
            if(in[i] == '1'){
                output = output + pow(2.0,(7.0-i));
            }
        }
    }
    
    else{ // negative.
        for(i = 0; i < 8; ++i){
            if(in[i] == '0') in[i] = '1';
            else in[i] = '0';
        }
        for(i = 0; i <= 7; ++i){
            if(in[i] == '1'){
                output = output + pow(2.0,(7.0-i));
            }
        }
        output = output + 1; // add 1.
        printf("%c",'-');
    }
    
    printf("%d",output);
    return 0;
}
