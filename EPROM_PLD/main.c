/*
	Gera os arquivos F6.bin e F8.bin
	para bankswitch do Atari 2600

*/
#include <stdio.h>

unsigned char buffer[32768];

const unsigned char f6_stuff[8] = {0x04,0x00,0x05,0x01,0x06,0x02,0x07,0x03};
const unsigned char f8_stuff[4] = {0x02,0x00,0x03,0x01};

const unsigned char traps[4] = {0x00,0x01,0x02,0x03};

int main ( void )
{
    int i = 0;
    int k = 0;
    FILE * fout;
    
    /* f6 */
    for ( k = 1; k < 9; k++)
    {
        for (i = (0x1000 * (k-1)); i < (0x1000 * k); i++)
        {
            buffer[i] = f6_stuff[k - 1];
        }    
    }
    
    for (i=0; i<4; i++)
    {
        buffer[(i * 0x2000) + 0x1FF6] = traps[0];
        buffer[(i * 0x2000) + 0x1FF7] = traps[1];
        buffer[(i * 0x2000) + 0x1FF8] = traps[2];
        buffer[(i * 0x2000) + 0x1FF9] = traps[3];
    }

    fout = fopen("F6.bin","w");
    
    for (i=0; i<32768; i++)
    {
        fprintf(fout,"%c",*(buffer+i));
    }
    
    fclose(fout);
    
    printf ("\nFile F6.bin OK...");
    
    /* f8 */
   for ( k = 1; k < 5; k++)
    {
        for ( i = (0x1000 * (k-1)); i < (0x1000 * k); i++)
        {
            buffer[i] = f8_stuff[k-1];
        }
    }
    
    buffer[0x1ff8] = 00;
    buffer[0x1ff9] = 01;
    buffer[0x3ff8] = 00;
    buffer[0x3ff9] = 01;
        
    fout = fopen("F8.bin","w");
    
    for (i = 0; i < 16384; i++)
    {
        fprintf(fout,"%c",*(buffer+i));
    }
    
    fclose(fout);
    
    printf("\nFile F8.bin OK...");

    return 0;
}
