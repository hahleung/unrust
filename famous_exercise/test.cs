using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Linq;
// Add any other imports you need here

namespace Solution {
    class Solution {
      	static IEnumerable<int> ParseIntegerSequence(string input, String delimiter)
        {
          	// You shouldn't need to change this code
            // but you are certainly free to if you wish
            input = Regex.Replace(input ?? "", "[^\\-0-9,]", "");
          	var inputItems = input.Split(new[] { delimiter }, StringSplitOptions.RemoveEmptyEntries);
          
          	foreach (string item in inputItems)
            {
            	int parsedItem = 0;
              
              	if (int.TryParse(item, out parsedItem))
                  	yield return parsedItem;
            }
        }
      
        static void Main(string[] args) 
        {         
            var userInput = Console.ReadLine();
        	var inputSequence = ParseIntegerSequence(userInput, ",");
            int largestSliceSize = CalculateLargestSlice(inputSequence);
          	Console.WriteLine(largestSliceSize);
        }
      
      static int CalculateLargestSlice(IEnumerable<int> source)
        {
            // Your code goes here, use Console.WriteLine() for debugging
            // but comment out your debug statements once you're done
          
          	// Use the "Run Code" button below to try out your code as you go
          	IComparer<int> comparer = Comparer<int>.Default;
            using (var iterator = source.GetEnumerator())
            {
                if (!iterator.MoveNext())
                {
                    throw new InvalidOperationException("Empty");
                }
                int maxIndex = 0;
                int maxElement = iterator.Current;
                int index = 0;
                while (iterator.MoveNext())
                {
                    index++;
                   int element = iterator.Current;
                    if (comparer.Compare(element, maxElement) > 0)
                    {
                        maxElement = element;
                        maxIndex = index;
                    }
                }
                return maxIndex;
            }
        }
    }
}
