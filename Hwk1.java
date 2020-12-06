import java.io.*;
import java.util.Arrays;
public class Hwk1 {
	public static void main(String args[]) throws IOException{
		
		System.out.println("Number of [Vowels, Consonants]: " + Arrays.toString(counts((new BufferedReader(new InputStreamReader(System.in)).readLine()),0)));
		}
		// this method returns the 1 for a vowel, 3 for spaces, and 2 for all other characters (consonants), and 4 for an 's' char
		// note: the handout code counts spaces as consonants, but I decided to at least take those out (but left punctuation).
		public static int isVowel(char thisletter) {
			if ((thisletter == 'a')||(thisletter == 'e')||(thisletter == 'i')||
				(thisletter == 'o')||(thisletter == 'u')) {
				return 1;
			}else if (thisletter == ' ') {
				return 3;
			}else if (thisletter == 's') {
				return 4;
			}else {
				return 2;
			}
				
		} 
		public static int[] counts(String myString, int index){
			
		if (index >= myString.length() || isVowel(myString.charAt(index)) == 4) {
			return new int[]{0,0};
		} 
		if (isVowel(myString.charAt(index)) == 1) {
			return new int[]{counts(myString, index+1)[0]+1,counts(myString, index+1)[1]}; 
		}else if (isVowel(myString.charAt(index)) == 2) {
			return new int[]{counts(myString, index+1)[0],counts(myString, index+1)[1]+1}; 
		}else { 
			return new int[]{counts(myString, index+1)[0],counts(myString, index+1)[1]};
		}
	}
}

