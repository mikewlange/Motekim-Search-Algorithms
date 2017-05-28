//
//  MOFinateAutomatica.m
//  MotekimSearchAlgos
//
//  Created by Michael Lange on 5/28/17.
//  Copyright © 2017 motekim. All rights reserved.
//

#import "MOFinateAutomatica.h"
#include<stdio.h>
#include<string.h>
#define NO_OF_CHARS 256


@implementation MOFinateAutomatica 


/* This function builds the TF table which represents Finite Automata for a
 given pattern  */
void computeTransFun(char *pat, int M, int TF[][NO_OF_CHARS])
{
    int i, lps = 0, x;
    
    // Fill entries in first row
    for (x =0; x < NO_OF_CHARS; x++)
    TF[0][x] = 0;
    TF[0][pat[0]] = 1;
    
    // Fill entries in other rows
    for (i = 1; i<= M; i++)
    {
    // Copy values from row at index lps
    for (x = 0; x < NO_OF_CHARS; x++)
    TF[i][x] = TF[lps][x];
    
    // Update the entry corresponding to this character
    TF[i][pat[i]] = i + 1;
    
    // Update lps for next row to be filled
    if (i < M)
    lps = TF[lps][pat[i]];
    }
}

/* Prints all occurrences of pat in txt */
void FAsearch(char *pat, char *txt,int *x)
{
    int M = (int)strlen(pat);
    int N = (int)strlen(txt);
    int y = 0;
    int TF[M+1][NO_OF_CHARS];
    
    computeTransFun(pat, M, TF);
    
    // process text over FA.
    int i, j=0;
    for (i = 0; i < N; i++)
    {
    j = TF[j][txt[i]];
    if (j == M)
        {
        x[y] = i-M+1;
        y++;
        printf ("\n pattern found at index %d", i-M+1);
        }
    }
}

/* Driver program to test above function */
//int main()
//{
//    char *txt = "GEEKS FOR GEEKS";
//    char *pat = "GEEKS";
//    FAsearch(pat, txt);
//    getchar();
//    return 0;
//}
@end
