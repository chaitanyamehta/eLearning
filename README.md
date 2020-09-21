# README

### Out-of-the-Box Functionality
Initially, the application has one account created:  the Administrator.  Log in as the Administrator with the email "admin@admin.com" and the password "admin".
### Creating Teachers
Navigate to "Teachers" from the home page.  Create as many teachers as needed.  Each time a Teacher is created, the provided email address will receive a confirmation email.  Then return to "Home", navigate to "Courses", and create as many courses as needed.
###Registering Teachers for Courses
To register teachers for courses, log in as each of the teacher accounts that were just ceated, navigate to "Courses" and click "Register" on all applicable courses.
### Creating Students
Student accounts can be created at any time from the login page by clicking "Sign up as Student."  Each time a Student is created, the provided email address will receive a confirmation email.  Once the account has been created, the student can login and navigate to "Edit Profile" and click "Add a Credit Card."  
### Purchasing Courses
Navigate to "Courses" and click "Add to Cart" on any applicable courses.  Note that any courses with an "Unavailable" tag are not being taught and cannot be added to cart.  Then navigate to "Cart" and click "Checkout."  As long as the student has provided a valid email address, they will recieve an email with a one-time password from testmailer489@gmail.com to confirm the purchase.  This password must be submitted through the rendered form within 1 minute, or it will expire.  Upon successful submission of the OTP, the purchase will go through.  A confirmation of their purchase will be sent to their email and the teacher of the course will be notified of their enrollment via email.  The student can then navigate back to "Courses" and should see "Enrolled" next to each course they just purchased.  If a student tries to purchase a course without adding a credit card, they will be redirected to the "Edit Profile" page with a notice asking them to add a card first.
### Providing Feedback
To create a feedback for a course, return to "Home" and navigate to "Feedbacks."  Select the teacher and course to review, enter the review, and click "Submit."  Teachers and Administrators can view feedbacks by navigating to "Feedbacks" from their respective home pages.
### Impersonation
The Administrator has the added ability to impersonate any user by navigating to "Teachers" or "Students" and clicking "Impersonate" next to a specific user.  They will have all functionality of the account type they are impersonating.
###Corner Cases
* Administrators can register teachers for a course, but cannot purchase a course for students.
* If a teacher is deleted, the associated class gets removed from the students view.
* The purchase history and feedback will remain intact even if the student or teacher is deleted.
* Students, Teachers, and Courses will be restricted from updating their major or discipline.
* Students and Teachers cannot drop courses.