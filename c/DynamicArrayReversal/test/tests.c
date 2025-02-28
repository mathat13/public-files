#include "unity.h"
// Uncomment below line
#include "../src/functions.h" // Include the code you're testing

// In your test_sample.c file

void setUp(void) {

}

void tearDown(void) {
    // Clean up after each test
}

// Add tests here:

void test_reverse_array(void) {
    // Define expected input for each test
    int test_arr_standard[7] = {1,2,3,4,5,6,7};
    int test_arr_single_element[1] = {1};
    int * test_arr_null_pointer = NULL;
    int test_arr_no_values[0] = {};
    
    // Define expected output for each test
    int expected_return_standard[7] = {7,6,5,4,3,2,1};
    int expected_return_single_element[1] = {1};
    int * expected_return_null_pointer = NULL;
    int * expected_return_no_values = NULL;
    
    // Define size for each test
    size_t size_of_standard = sizeof(test_arr_standard) / sizeof(*test_arr_standard);
    size_t size_of_single = sizeof(test_arr_single_element) / sizeof(*test_arr_single_element);
    size_t size_of_zero = sizeof(test_arr_no_values) / sizeof(*test_arr_no_values);
    size_t size_of_null = 0;
    size_t size_of_incorrect = 8;

    // Test each condition
    TEST_ASSERT_EQUAL_INT_ARRAY(expected_return_standard, reverse_array(test_arr_standard, size_of_standard), 7);
    TEST_ASSERT_EQUAL_INT_ARRAY(expected_return_single_element, reverse_array(test_arr_single_element, size_of_single), 1);
    TEST_ASSERT_EQUAL(expected_return_null_pointer, reverse_array(test_arr_null_pointer, size_of_null));
    TEST_ASSERT_EQUAL(expected_return_no_values, reverse_array(test_arr_no_values, size_of_zero));
}

// Example tests:
// Test the add_numbers function
// void test_add_numbers(void) {
//     TEST_ASSERT_EQUAL(5, add_numbers(2, 3));
//     TEST_ASSERT_EQUAL(0, add_numbers(-1, 1));
//     TEST_ASSERT_EQUAL(-10, add_numbers(-5, -5));
// }

// Test the reverse_string function
// void test_reverse_string(void) {
//     char str1[] = "hello";
//     reverse_string(str1);
//     TEST_ASSERT_EQUAL_STRING("olleh", str1);
// 
//     char str2[] = "world!";
//     reverse_string(str2);
//     TEST_ASSERT_EQUAL_STRING("!dlrow", str2);
// 
// }

int main(void) {
    UNITY_BEGIN();

    // Add test runs here

    RUN_TEST(test_reverse_array);
    // RUN_TEST(test_add_numbers);
    // RUN_TEST(test_reverse_string);

    return UNITY_END();
}