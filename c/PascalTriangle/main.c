/*
*   @file main.c
*   @brief Dislay the pascal triangle
*   @author Loic GUEGAN
*   @version 1.0
*
*/


#include <stdio.h>
#include <stdlib.h>


//Define size of pascal triangle (Pascal Triangle Size)
#define __PTS__ 10



//Functions prototype
void printPascalTriangle(int pascalTriangle[__PTS__][__PTS__]);
int isValid(int value);



/*
*   @fun int => int
*   @brief Main function
*
*   @param No parameters
*   @return Return an int, corresponding to exit status
*/
int main()
{
    //Instanciate the pascal triangle
    int pascalTriangle[__PTS__][__PTS__]={{0}};
    //Init first value of the pascal triangle
    pascalTriangle[0][0]=1;

    //Init iterator
    int i,j;



    //Build pascal triangle (start with second line)
    for(i=1; i<__PTS__;i++){

        //Walk in a table
        for(j=0; j<=i;j++){

                //Init X and Y position
                int X=j-1, Y=i-1;

                //Init value
                int val1=0,val2=0;

                //Retrieve val1
                val1= (isValid(X) && isValid(Y)) ? pascalTriangle[Y][X] : 0;

                //Increment X
                X++;

                //Retrieve val2
                val2= (isValid(X) && isValid(Y)) ? pascalTriangle[Y][X] : 0;

                //Put val1+val2 in the pascal triangle
                pascalTriangle[i][j]=val1+val2;



        }

    }

    //Print the triangle
    printPascalTriangle(pascalTriangle);

    //Exit code
    return 0;
}


/*
*   @fun void => void
*   @brief Print the pascal triangle on the standard stream
*
*   @param A table in 2 dimensions
*   @return No return
*/
void printPascalTriangle(int pascalTriangle[__PTS__][__PTS__]){
    //Init i and j
    int i,j;

    //Print pascal triangle
    for(i=0;i<__PTS__;i++){
        for(j=0;j<__PTS__;j++){

            //Print pascal triangle and hide all 0
            (pascalTriangle[i][j] != 0) ? printf("%d ", pascalTriangle[i][j]) : 0;

        }

        //Start new line
        printf("\n");
    }
}


/*
*   @fun int => int
*   @brief Test if a value is valid for a given 2 dimensions square table
*
*   @param A int value corresponding to the square table dimension
*   @return 1 if the value is valid and 0 else
*/
int isValid(int value){ return (value >=0 && value < __PTS__) ?  1 :  0; };
