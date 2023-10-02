1.0 Use Case: Secure SignUp
      Actors: Student or Professor
      Overview: Actor uses email to verify their identity 

      Typical Course of Events
1. Page Prompts for user to enter email address.
2. User will then proceed when the user confirms email address.
3. User will then enter a Username and Password.
4. User will enter a password again to confirm.
 
      Alternative Courses
      1. If username is taken display error message.
      2. If password is not eligible display error message.

2.0 Use Case: Secure Login
      Actors: Student or Professor
      Overview: Actor uses password to verify their identity 

      Typical Course of Events
1. Page Prompts for username and password.
2. User enters their username and password and hits enter/login.
3. System verifies that the username and password are correct.

      Alternative Courses
      Step 3: User and/or password are not correct.
      1. Displays error.
      2. Go back to step 1.
      3. If user does not exist prompt register/sign up link.

3.0 Use Case: User Register University 
      Actors: Student or Professor 
      Overview: Actor uses password to verify their identity 

      Typical Course of Events
1. Page Prompts a screen for the user to search their university. 
2. User clicks on university 
3. User proceeds to enter university email address.
4. User will be sent a confirmation email.

      Alternative Courses
1.If user does not have school email address prompt error message.

4.0 Use Case: User/Account quality
      Actors: Student or Professor
      Overview: Actor uses email to verify their role

      Typical Course of Events
1. System will use actors registered email 
2. User will then proceed according to what role they are student/professor 
 
      Alternative Courses
      1. If email is invalid or not registed with school display error message.
      2. Bring user to the main sign up page.
  
5.0 Use Case: User will genrate QR code 
      Actors: Professor
      Overview: Actor will use a button to generate an QR code

      Typical Course of Events
1. System will use actors registered email 
2. User will then proceed according to what role they are student/professor 
 
      Alternative Courses
      1. If email is invalid or not registed with school display error message.
      2. Bring user to the main sign up page.
   
6.0 Use Case: User will Scan code
      Actors: Student
      Overview: Actor will use camera to scan QR Code

      Typical Course of Events
1. System will use actors camera to scan propmted QR code  
2. User will then verify the QR scan code
 
      Alternative Courses
      1. If QR is not readable display error message.
      2. Reset user camera focus 

7.0 Use Case: User will have a roster
      Actors: Professor
      Overview: Actor will see all the students who scanned the QR code

      Typical Course of Events
1. System will tally up all the student who scans QR code
2. Actor will see a green light if the user scanned QR code if not it will appear red.
 
      Alternative Courses
      1. If QR code is not the new one, User will be prompted then to make a new one.
      2. If it is under wrong class and students  who scan are not registered under that class, an error message will be prompted.

