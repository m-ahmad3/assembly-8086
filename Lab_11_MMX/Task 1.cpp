#include <iostream>
using namespace std;

int main()
{
    const int size = 5; // Size of the array
    int data = sizeof(int); // Size of each array element
    int array[size] = { 1, 2, 3, 4, 5 }; // Initialize the array

    for (int a = 0; a < data * size; a += data)
    {
        __asm
        {
            mov esi, a // Load the offset into ESI
            mov ah, byte ptr[array + esi] // Move the first byte to AH

            // Rotate the nibbles of the second byte
            inc esi
            ROR BYTE PTR[array + ESI], 4

            add esi, 2 // Move to the last byte
            mov al, byte ptr[array + esi] // Move the last byte to AL
            mov byte ptr[array + esi], ah // Move AH to the last byte position

            mov esi, a // Reset ESI to the original offset
            mov byte ptr[array + esi], al // Move AL to the first byte position
        }
    }

    // Print the modified array
    cout << "Array: ";
    for (int a = 0; a < size; a++) {
        cout << array[a] << " ";
    }
    return 0;
}
