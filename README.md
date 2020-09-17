# README

# README

Initially, the application has one account created:  the Administrator.  Log in as the Administrator and navigate to "Teachers" from the home page.  Create as many teachers as needed.  Then return to "Home", navigate to "Courses", and create as many courses as needed.

To register teachers for courses, log in as each of the teacher accounts that were just ceated, navigate to "Courses" and click "Register" on all applicable courses.

Student accounts can be created at any time from the login page by clicking "Sign up as Student."  Once the account has been created, the student can login and navigate to "Courses."  Click "Add to Cart" on any applicable courses.  Then navigate to "Cart" and click "Checkout."  As long as the student has provided a valid email address, they will recieve and email confirmation of their purchase from testmailer489@gmail.com.  The student can then navigate back to "Courses" and should see "Enrolled" next to each course they just purchased.

To create a feedback for a course, return to "Home" and navigate to "Feedbacks."  Select the teacher and course to review, enter the review, and click "Submit."

Teachers and Administrators can view feedbacks by navigating to "Feedbacks" from their respective home pages.

The Administrator has the added ability to impersonate any user by navigating to "Teachers" or "Students" and clicking "Impersonate" next to a specific user.  They will have all functionality of the account type they are impersonating.

Corner Cases:
* Administrators can register teachers for a course, but cannot purchase a course for students.
* If a teacher is deleted, the associated class gets removed from the students view.
* The purchase history and feedback will remain intact even if the student or teacher is deleted.
* Students and Teachers will be restricted from updating their major or discipline.
* Students and Teachers cannot drop courses.
