// now we're going to add in a library
#include <stdio.h>
#include "library.h"
 
int main(int argc, char **argv) {
    printf(" Hello world from 03_batch!\n");

    library_hello();
    return 0 // missing ';'
}
