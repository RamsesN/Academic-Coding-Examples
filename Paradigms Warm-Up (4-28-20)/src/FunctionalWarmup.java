import java.util.*;
import java.util.function.Function;
import java.util.function.IntSupplier;
import java.util.function.Supplier;
import java.util.function.ToIntFunction;
import java.util.stream.*;
import java.util.stream.IntStream;
import java.util.stream.Stream;
public class FunctionalWarmup {
public static void main(String[] args) {
new FunctionalWarmup().go();
}
private int dividend = 18;
private void go() {
int dividend = 200;
// Question 1: What do you think the following lines print?
System.out.println("\nQuestion 1\n");
Stream<Integer> allInts = Stream.iterate(-5, x -> x+1);
allInts.limit(10).forEach(System.out::println);
// Question2:
// if I did this:
// allInts.limit(10).forEach(System.out::println);
// again, I would get an error. Can you think of a reason
// that might be?
System.out.println("\nQuestion 2\n");
allInts = Stream.iterate(-5, x -> x+1);
Stream<Integer> allInts2 = allInts.map(this::divide);
allInts2.limit(5).forEach(System.out::println);
/*
* Question3: The line above will give the following output:
* -3
* -4
* -6
* -9
* -18
* Why? */
/* Question4: If I change that line to this:
*
*
*
* allInts2.limit(10).forEach(System.out::println);
*
* I will get an error:
*
* Exception in thread "main"
* java.lang.ArithmeticException: / by zero
*
* What does this tell you about map?
*/
/* Question5: What does the first line below do? */
Function<Integer,Integer> sp = ((x) -> (dividend/x));
System.out.println("\nQuestion 6\n");
allInts = Stream.iterate(-5, x -> x+1);
Stream<Integer> allInts3 = allInts.map(sp);
/* Question6:
*
* The line below will print a different set of answers than
* allInts2.limit(5).forEach(System.out::println); above
* Why?
* What does this show you?
*/
allInts3.limit(5).forEach(System.out::println);
/* Extra blank space – keep going */
/* Question7:
*
* What printout do you think you will get from the lines below?
*/
System.out.println("\nQuestion 7\n");
Function<Integer,Integer> sp2 = (Weird::divide);
allInts = Stream.iterate(-5, x -> x+1);
Stream<Integer> allInts4 = allInts.map(sp2);
allInts4.limit(5).forEach(System.out::println);
}
private int divide (int y ) {
return dividend/y;
}
}
class Weird {
private static int dividend = 1000;
public static int divide (int y ) {
return dividend/y;
}
}