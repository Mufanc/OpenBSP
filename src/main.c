#include <STC15F2K60S2.h>
#include "utils/types.h"


int main() {
    P0M0 = 0xFF; P0M1 = 0x00;
    P2M0 = 0x08; P2M1 = 0x00;
    P2 = 0xFF;

    while (1) {
       for (uchar i = 0; i < 8; ++i) {
           for (uint j = 0; j < 1000; j++) {
               P0 = (j % 5) ? 0 : (1 << i);
           }
       } 
    }
}

