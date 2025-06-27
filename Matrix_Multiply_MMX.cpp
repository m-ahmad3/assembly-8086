#include <iostream>
using namespace std;

                // Muhammad Ahmad
                // L1F22BSCS0634

// Function to display a 2x2 matrix
void displayMatrix(const int matrix[2][2]) {
    for (int row = 0; row < 2; row++) {
        for (int col = 0; col < 2; col++) {
            cout << matrix[row][col] << " ";
        }
        cout << endl;
    }
}

int main() {
    // Initializing two 2x2 matrices
    int matA[2][2] = { {1, 2}, {3, 4} };
    int matB[2][2] = { {5, 6}, {7, 8} };
    int matC[2][2] = { {0, 0}, {0, 0} }; // Resultant matrix initialized to zeros

    // Perform matrix multiplication using MMX instructions
    for (int a = 0; a <= 2 * sizeof(int); a += 8) {
        __asm {
            mov esi, a

            // Load matrixA row into mm0
            movq mm0, qword ptr[matA + esi]
            // Load matrixB column into mm1
            movq mm1, qword ptr[matB + esi]

            // Perform multiply and add with packed integers
            pmaddwd mm0, mm1

            // Store result into matC
            movq qword ptr[matC + esi], mm0

            // Clear MMX state
            emms
        }
    }

    // Display the matrices
    cout << "Matrix A:" << endl;
    displayMatrix(matA);
    cout << "Matrix B:" << endl;
    displayMatrix(matB);
    cout << "\nMatrix A x Matrix B = Matrix C (Result):" << endl;
    displayMatrix(matC);

    system("pause");

    return 0;
}
