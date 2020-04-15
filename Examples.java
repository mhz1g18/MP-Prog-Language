import java.util.Arrays;

public class Examples
{

    /**
     * Creates three different arrays all of same lengths, this is assumed per spec
     * Then applies all 5 problems on all of them and prints out the result
     * @param args not used
     */
    public static void main(String[] args)
    {
        int[] array1 = {1,2,3,4};
        int[] array2 = {5,6,7,8};
        int[] array3 = {9,10,11,12};

        System.out.println("Sequences used:\n" +
                "Sequence 1: "+ Arrays.toString(array1) +"\n"+
                "Sequence 2: "+ Arrays.toString(array2) +"\n"+
                "Sequence 3: "+ Arrays.toString(array3) +"\n\n");

        System.out.println("Problem 1 with sequence(s) 1 and 2:\n");
        printArray(problem1(array1, array2));

        System.out.println("\n\nProblem 2 with sequence(s) 1, 2 and 3:\n");
        printArray(problem2(array1, array2, array3));

        System.out.println("\n\nProblem 3 with sequence(s) 2 and 3:\n");
        printArray(problem3(array2, array3));

        System.out.println("\n\nProblem 4 with sequence(s) 1:\n");
        printArray(problem4(array1));

        System.out.println("\n\nProblem 5 with sequence(s) 2:\n");
        printArray(problem5(array2));
    }

    /**
     * @param array1
     * @param array2
     * @return empty array if given arrays are empty else return array as resultant from problem
     */
    private static int[] problem1(int[] array1, int[] array2)
    {
        if(array1.length == 0 && array2.length == 0) { return array1; }

        int size = array1.length + array1.length/2;
        int[] out = new int[size];
        int j = 0;
        int z = 0;

        for(int i = 0 ; i < size ; i++)
        {
            if( i%3 != 0) { continue;}
            out[i] = array1[z];
            out[i+1] = array1[z+1];
            out[i+2] = array2[j];
            j++;
            z = z + 2;
        }
        return out;
    }

    /**
     * @param array1
     * @param array2
     * @param array3
     * @return empty array if given arrays are empty else return array as resultant from problem
     */
    private static int[] problem2(int[] array1, int[] array2, int[] array3)
    {
        if(array1.length == 0 && array2.length == 0 && array3.length == 0) { return array1; }
        int size = array1.length + array2.length + array3.length + 2*array1.length;
        int[] out = new int[size];
        int a = 0;
        for(int i = 0 ; i < size ; i = i + 5)
        {
            out[i+0] = array3[a];
            out[i+1] = array2[a];
            out[i+2] = array1[a];
            out[i+3] = array1[a] + array2[a];
            out[i+4] = array2[a] + array3[a];
            a++;
        }
        return out;
    }

    /**
     * @param array1
     * @param array2
     * @return empty array if given arrays are empty else return array as resultant from problem
     */
    private static int[] problem3(int[] array1, int[] array2)
    {
        if(array1.length == 0 && array2.length == 0) { return array1; }
        int size = 1 + array1.length/2 + array2.length/2;
        int[] out = new int[size];
        out[0] = 0;
        int a = 1;
        int b = 0;
        for(int i = 1 ; i < size ; i = i + 2)
        {
            out[i+0] = array2[a];
            out[i+1] = array1[b];
            a = a + 2;
            b++;
        }
        return out;
    }

    /**
     * @param array takes a single array
     *              also makes sure that the array's size is divisible by three
     * @return an empty array if given array is empty else return array as resultant from problem
     */
    private static int[] problem4(int[] array)
    {
        if(array.length == 0) { return array; }
        int length = array.length;
        for(int j = 0 ; j < array.length ; j++)
        {
            if(length % 3 != 0){ length--; }
            if(length % 3 == 0) { break; }
        }
        int[] out = new int[length];
        int a = 0;
        for(int i = 0 ; i < out.length ; i = i + 3)
        {
            out[i+0] = array[a+2];
            out[i+1] = array[a+1] * 2;
            out[i+2] = (array[a] * 3) - 1;
            a = a + 3;
        }
        return out;
    }

    /**
     * @param array takes a single array
     * @return an empty array if given array is empty else return array as resultant from problem
     */
    private static int[] problem5(int[] array)
    {
        if(array.length == 0) { return array; }
        int[] out = new int[array.length];
        for(int i = 0 ; i < array.length ; i++)
        {
            int sum = 0;
            for(int j = 0 ; j <= i; j++) { sum = sum + array[j]; }
            out[i] = sum;
        }
        return out;
    }

    /**
     * @param array prints out the array downwards
     */
    private static void printArray(int[] array) { for(int x : array) { System.out.println(x); } }

        /**
         * ***************************************************************************************************
         *                                      PSEUDO CODE FOR OUR LANGUAGE BOI
         * ***************************************************************************************************
         *
         * SETUP:
         *      integer[] array1 = [1,2,3,4];
         *      integer[] array2 = [5,6,7,8];
         *      integer[] array3 = [9,10,11,12];
         *      print("If we do print statements then we should do them the same as python, which is like this Kyle.");
         *
         *
         * PROBLEM 1:
         *      if(array1.length == 0)
         *          return array1;
         *
         *      integer size = array1.length + array1.length/2;
         *      integer[] out = size;
         *      integer j = 0;
         *      integer z = 0;
         *
         *      loop(integer i = 0 ; i < size ; i = i + 1)
         *          if( i%3 != 0)
         *              continue;
         *
         *          out[i] = array1[z];
         *          out[i+1] = array1[z+1];
         *          out[i+2] = array2[j];
         *          j = j + 1;
         *          z = z + 2;
         *
         *
         * PROBLEM 2:
         *      if(array1.length == 0)
         *          return array1;
         *
         *      integer size = array1.length + array2.length + array3.length + 2*array1.length;
         *      integer[] out = size;
         *      integer a = 0;
         *
         *      loop(integer i = 0 ; i < size ; i = i + 5)
         *          out[i+0] = array3[a];
         *          out[i+1] = array2[a];
         *          out[i+2] = array1[a];
         *          out[i+3] = array1[a] + array2[a];
         *          out[i+4] = array2[a] + array3[a];
         *          a = a + 1;
         *
         *
         * PROBLEM 3:
         *      if(array1.length == 0)
         *          return array1;
         *
         *      integer size = 1 + array1.length/2 + array2.length/2;
         *      integer[] out = size;
         *      out[0] = 0;
         *      integer a = 1;
         *      integer b = 0;
         *
         *      loop(integer i = 1 ; i < size ; i = i + 2)
         *          out[i+0] = array2[a];
         *          out[i+1] = array1[b];
         *          a = a + 2;
         *          b = b + 1;
         *
         *
         * PROBLEM 4:
         *      integer length = array.length;
         *      if(length == 0)
         *          return array1;
         *
         *      loop(int j = 0 ; j < length ; j++)
         *          if(length % 3 != 0)
         *              length = length - 1;
         *          if(length % 3 == 0)
         *              break;
         *
         *      integer[] out = length;
         *      integer a = 0;
         *      loop(integer i = 0 ; i < length ; i = i + 3)
         *          out[i+0] = array[a+2];
         *          out[i+1] = array[a+1] * 2;
         *          out[i+2] = (array[a] * 3) - 1;
         *          a = a + 3;
         *
         *
         * PROBLEM 5:
         *      length = array.length
         *      if(length == 0)
         *          return array;
         *
         *      integer[] out = length;
         *      loop(integer i = 0 ; i < length ; i++)
         *          integer sum = 0;
         *          loop(integer j = 0 ; j <= i; j++)
         *              sum = sum + array[j];
         *          out[i] = sum;
         *
         * ***************************************************************************************************
         *                                             END OF PSEUDO CODE
         * ***************************************************************************************************
         */







}

