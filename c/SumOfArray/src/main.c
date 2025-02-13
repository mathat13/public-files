#include "functions.h"
#include <stdio.h>

// Main function (entry point)
int main() {

    // Define array for add_array_elements
    int arr_int[] = {1,2,3,4,5};

    // Get the size of the array by getting the size in bytes and then dividing by the size of an int
    size_t n = sizeof(arr_int) / sizeof(int);

    // Store the result of add_array_elements() in a variable
    int added_elements = add_array_elements(arr_int, n);
    //printf("Elements: %zu\n", n);

    return 0;  // Return 0 to indicate successful execution
}
