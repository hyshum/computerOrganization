//
//  main.c
//  problem4
//
//  Created by Hok Yin Shum on 9/25/17.
//  Copyright © 2017 Hok Yin Shum. All rights reserved.
//

#include <stdio.h>

int main() {
    int n = 0;
    int zero = 0;
    int first = 1;
    int nth_term  = 0;
    int i = 0; 
    
    scanf("%d",&n);
    for(i = 0; i <= n; ++i){
        if(i <= 1){
            nth_term = i;
        }
        else{
            nth_term = zero + first;
            zero = first;
            first = nth_term;
        }
    }
    printf("%d",nth_term);
    return 0;
}
