#include <stdio.h>

void bubbleSort(int arr[], int n)
{
    int temp = 0;
    int i = 0;
    
    if (n == 1) //base case;
        return;
    
    for (i = 0; i< n-1; i++)
        if (arr[i] > arr[i+1]){
            //swap
            temp = arr[i];
            arr[i] = arr[i+1];
            arr[i + 1] = temp;
        }

    bubbleSort(arr, n-1);
}

int binarySearch(int arr[], int l, int r, int x)
{
    if (r >= l)
    {
        int mid = l + (r - l)/2;
        
        
        if (arr[mid] == x)  return mid; // If in middle.
        
        // if smaller, then left sub array.
        if (arr[mid] > x) return binarySearch(arr, l, mid-1, x);
        
        // else, right sub array.
        return binarySearch(arr, mid+1, r, x);
    }
    
    return -1; // wrong index indication.
}

int main() {
    
    int array[100] = {0};
    int i = 0;
    int size, search_element, temp_index, answer;
    
    scanf("%d", &size);
    
    for(i = 0; i < size; ++i){
        scanf("%d", &array[i]);
    }
    
    scanf("%d", &search_element);
    
    bubbleSort(array, size);
    
    
    /* output array.
    for(int i = 0; i < size; ++i){
        printf("%d", array[i]);
    }
     */
 
    temp_index = binarySearch(array, 0, size, search_element);
    answer = temp_index;
    
    for(i = temp_index; i > 0; --i){
        if(array[temp_index] == array[temp_index - 1]) answer = temp_index -1;
    }
    
    printf("%d",answer);

    return 0;
}


