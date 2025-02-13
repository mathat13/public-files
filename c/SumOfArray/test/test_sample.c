#include "unity.h"
#include "../src/functions.h" // Include the code you're testing

void setUp(void) {
    // Initialize anything needed before each test
}

void tearDown(void) {
    // Clean up after each test
}

void test_add_array_elements(void) {
    // Define and test all positive values
    int arr_int[] = {1,2,3,4,5};
    size_t n = sizeof(arr_int) / sizeof(int);
    TEST_ASSERT_EQUAL(15, add_array_elements(arr_int, n));

    // Define and test mixed values that sum to positive
    int arr_int_mixed[] = {1,-2,3,4,-5};
    size_t m = sizeof(arr_int_mixed) / sizeof(int);
    TEST_ASSERT_EQUAL(1, add_array_elements(arr_int_mixed, m));

    // Define and test mixed values that sum to negative
    int arr_int_negative[] = {-1,-2,-3,-4,-5};
    size_t o = sizeof(arr_int_negative) / sizeof(int);
    TEST_ASSERT_EQUAL(-15, add_array_elements(arr_int_negative, o));

    // Define and test array of single element
    int arr_int_single[] = {0};
    size_t p = sizeof(arr_int_single) / sizeof(int);
    TEST_ASSERT_EQUAL(0, add_array_elements(arr_int_single, p));

    //Define and test an empty array
    int arr_empty[] = {};
    size_t q = sizeof(arr_empty) / sizeof(int);
    TEST_ASSERT_EQUAL(0, add_array_elements(arr_empty, q));

    //Define and test a NULL pointer
    int *null_array = NULL;
    size_t r = 5;
    TEST_ASSERT_EQUAL(-1, add_array_elements(null_array, r));

    int arr_overflow[] = {INT_MAX, 1};
    size_t s = sizeof(arr_overflow) / sizeof(int);
    TEST_ASSERT_EQUAL(-1, add_array_elements(arr_overflow, s));

    int arr_underflow[] = {INT_MIN, -1};
    size_t t = sizeof(arr_underflow) / sizeof(int);
    TEST_ASSERT_EQUAL(-1, add_array_elements(arr_underflow, t));

    size_t biig_size = (SIZE_MAX / sizeof(int)) + 40;
    TEST_ASSERT_EQUAL(-1, add_array_elements(arr_int, biig_size));
}

// Test the add_numbers function
//void test_add_numbers(void) {
//    TEST_ASSERT_EQUAL(5, add_numbers(2, 3));
//    TEST_ASSERT_EQUAL(0, add_numbers(-1, 1));
//    TEST_ASSERT_EQUAL(-10, add_numbers(-5, -5));
//}

// Test the reverse_string function
//void test_reverse_string(void) {
//    char str1[] = "hello";
//    reverse_string(str1);
//    TEST_ASSERT_EQUAL_STRING("olleh", str1);
//
//    char str2[] = "world!";
//    reverse_string(str2);
//    TEST_ASSERT_EQUAL_STRING("!dlrow", str2);
//
//}

int main(void) {
    UNITY_BEGIN();
      RUN_TEST(test_add_array_elements);
//    RUN_TEST(test_add_numbers);
//    RUN_TEST(test_reverse_string);

    return UNITY_END();
}