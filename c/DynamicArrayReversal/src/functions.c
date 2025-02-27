#include "functions.h"
#include "stdio.h"
#include "stdlib.h"
// #include <string.h>

//Add functions here:

int* reverse_array(int *arr, size_t size) {
    int* new_arr;

    // int* new_arr = calloc(size, size * sizeof *new_arr );
    // Define new array
    new_arr = malloc( sizeof *new_arr * size );

    // Check if memory allocated correctly
    if (new_arr == NULL) {
        printf("Memory Allocation Failed!");
        return NULL;
    }
    
    // Define initial index values for each array
    int i = 0;
    int j = size - 1;

    while (i < size) {
        new_arr[i] = arr[j];
        // *(new_arr + i) = *(arr_int + j);
        // printf("%d\n", new_arr[i]);
        i++;
        j--;
    }

    return new_arr;
}

// Example functions:
// A simple function to add two integers
// int add_numbers(int a, int b) {
//     return a + b;
// }

// A function to reverse a string in place
// void reverse_string(char* str) {
//     int len = strlen(str);
//     for (int i = 0; i < len / 2; ++i) {
//         char temp = str[i];
//         str[i] = str[len - i - 1];
//         str[len - i - 1] = temp;
//     }
// }