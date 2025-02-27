#include "functions.h"
#include <stdio.h>
#include <stdlib.h>

// Main function (entry point)
#include <stddef.h>
int main() {

    // Main code here:
    int arr_int[] = {1,2,3,4,5};
    size_t size_of = sizeof(arr_int) / sizeof(int);
    int* arr_new = reverse_array(arr_int, size_of);

    int i = 0;

    while (i < size_of) {
        // *(new_arr + i) = *(arr_int + j);
        printf("%d\n", arr_new[i]);
        i++;
    }

    free(arr_new);

    return 0;  // Return 0 to indicate successful execution
    // Example main:
    // Example usage of add_numbers
    // int sum = add_numbers(3, 5);
    // printf("Sum: %d\n", sum);

    // Example usage of reverse_string
    // char str[] = "Hello, world!";
    // reverse_string(str);
    // printf("Reversed string: %s\n", str);

}
