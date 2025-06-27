#include <iostream>
using namespace std;

int main()
{
    const int size = 5; // Size of the array
    int data = sizeof(int); // Size of each array element in bytes
    int array[size] = { 1, 2, 3, 4, 5 }; // Initialize the array

    for (int a = 0; a < data * size; a += data)
    {
        __asm
        {
            mov esi, a // Load the offset into ESI

            // Rotate the least significant byte (byte #0) to the left
            rol byte ptr[array + esi], 1

            // Rotate byte #1 to the right
            inc esi
            ror byte ptr[array + esi], 1

            // Rotate byte #2 to the right
            inc esi
            ror byte ptr[array + esi], 1

            // Rotate the most significant byte (byte #3) to the left
            inc esi
            rol byte ptr[array + esi], 1
        }
    }

    // Print the modified array
    cout << "Array: ";
    for (int a = 0; a < size; a++) {
        cout << array[a] << " ";
    }
    cout << endl;

    return 0;
}
