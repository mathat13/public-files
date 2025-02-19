#include "unity.h"
// Uncomment below line
// #include "../src/functions.h" // Include the code you're testing

// In your test_sample.c file

void setUp(void) {
    // Initialize anything needed before each test
}

void tearDown(void) {
    // Clean up after each test
}

// Add tests here:


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


    // RUN_TEST(test_add_numbers);
    // RUN_TEST(test_reverse_string);

    return UNITY_END();
}