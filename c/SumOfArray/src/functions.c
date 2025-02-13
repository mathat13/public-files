#include "functions.h"
#include <limits.h>
#include <stddef.h>
#include <stdio.h>

// Sum the elements of an array

int add_array_elements(int *arr, size_t size) {
    // Covers use cases where a NULL pointer is passed
    if (arr == NULL) {
        fprintf(stderr,"NULL array provided as input, please check array is being passed correctly!\n");
        return -1;
    }

    // Covers case where array is empty
    if (size == 0) return 0;

    if (size > SIZE_MAX / sizeof(int)) {
        fprintf(stderr,"Invalid size: Too large!\n");
        return -1;
        }
    
    int summed_elements = 0;
    
    for (int i = 0; i < size; i++) {
        // Check for integer overflow (summed_elements + arr[i] > INT_MAX without actually performing the overflow)
        if (arr[i] > 0 && summed_elements > INT_MAX - arr[i]) {
            fprintf(stderr,"Overflow detected!\n");
            return -1;
        }

        // Check for integer underflow (summed_elements + arr[i] < INT_MIN without actually performing the overflow)
        if (arr[i] < 0 && summed_elements < INT_MIN - arr[i]) {
            fprintf(stderr,"Underflow detected!\n");
            return -1;
        }

        // Add the array element to the sum variable
        summed_elements += arr[i];
  }
    return summed_elements;
}
