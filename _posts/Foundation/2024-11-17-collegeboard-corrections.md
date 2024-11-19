# Score: 33/40

![image](https://github.com/user-attachments/assets/6b4e0454-450e-4650-9202-9c182566c1cc)
The condition ((x < 10) && (y < 0)) evaluates to false because y is not less than 0. As a result, the else block executes, performing integer division 7 / 3, which outputs 2. I made the mistake of letting a float in the answer aswell instead of only a integer (2).

![image](https://github.com/user-attachments/assets/e8c16292-3da6-4593-8916-5c5db803b372)
The loop starts at i = 1, but arrays in Java are zero-indexed, so you need to use key[i - 1] to access the correct element. Using key[i] (option C) would skip the first element and potentially cause an out-of-bounds error. Using the key[i - 1] (option A) will access the correct element in the array. I made the mistake of not mentioning the zero-indexed nature of arrays in Java.

![image](https://github.com/user-attachments/assets/be1130e5-3208-4d36-81b0-ed4ebd6d6987)
In test case I, if the array contains only one element and that element is not the target, the recursion will terminate without an error, returning -1 as intended. Test case II will also not result in an error because the method will recursively check all elements and return -1 if the target is not found.  neither I nor II results in an error, so the correct answer is B (II only) because it does not trigger a coding error—it’s just part of normal operation. I made the mistake of incorrectly stating that test case I would result in an error.

![image](https://github.com/user-attachments/assets/b68a98ed-3a1c-4189-8121-b712f0aa2c21)
The error lies in the logic of condition A (if last <= 0 return -1;). It will incorrectly stop the recursion if last is 0, even though index 0 is a valid position in the array. The correct condition is B (if last < 0 return -1;), as it ensures the method only stops when the index becomes invalid (negative), allowing the method to check all valid indices, including index 

![image](https://github.com/user-attachments/assets/4c975558-9750-42b3-801f-07a42ce7788d)
Option A is incorrect because it assumes the order of the elements starting with "b" changes in relation to their original positions, but the method only appends them in reverse order without altering their relative sequence. Option B is correct because it accurately reflects the original order of elements starting with "b" being processed and appended to the end while preserving their relative order.

![image](https://github.com/user-attachments/assets/e806e818-10ff-42e2-b2b7-d9300c83a505)
 When x is 8, y will be assigned the value 3, since 8 is even. When x is 11, y will be assigned the value 5, since 11 is odd and greater than 9. When x is 13, y will be assigned the value 5, since 13 is odd and greater than 9. This set of values does not test the conditions when x is odd and greater than 9 and y is assigned the value 5. The correct answer is C because 9 would meet the test case the other option did not.

 ![image](https://github.com/user-attachments/assets/b1f7ae4d-79a1-4e9b-b7e0-1c20d8bcfb80)
 Option D is correct because combining x < 6 and x < 7 effectively ensures that the loop runs only while x is less than 6, which matches the desired output of 1 3 5. Option E is incorrect because x != 6 does not add meaningful restrictions beyond x < 6 and x < 7, and it introduces redundancy without affecting the loop’s behavior, making it an unnecessary addition.

 ![image](https://github.com/user-attachments/assets/6bef581c-718b-4565-b1ec-b0eda2d39853)

 I made the mistake of only ahving it run through one time since I did not see the recur method inside the recur caller. I realize that it goes until it is less than 10 thus I got it wrong. The call recur(27) returns the value of recur(recur(9)) since 27 is greater than 10. The call recur(9) returns 18, since 9 is less than or equal to 10. Therefore, recur(recur(9)) is recur(18). The call recur(18) returns recur(recur(6)) since 18 is greater than 10. The call recur(6) returns 12, since 6 is less than or equal to 10. Therefore, recur(recur(6)) is recur(12). The call recur(12) returns recur(recur(4)) since 12 is greater than 10. The call recur(4) returns 8, since 4 is less than or equal to 10. Therefore, recur(recur(4)) is recur(8). The call recur(8) returns 16, since 8 is less than or equal to 10.  Therefore, recur(27)returns the value of 16.