# README

* Overview
    - This is Team Jaws' implementation of a Grader Application Portal for tOSU students/instructors/admins. Our webapp is written in Ruby on Rails and HTML with the styling done with CSS.
	
* Preview
    - https://pacific-atoll-60708.herokuapp.com/

* Configuration
    1.  Gemfile
        - Make sure ```Ruby``` and ```Ruby on Rails``` are installed, otherwise the server WILL NOT RUN, they are the core of our implementation. 
        - Open up the terminal, run command ```$ ruby -v ```
        - Go to the directory ```jaws/project4/wsl```
        - Open the file ```Gemfile```, and check if the version specified is the same as what shows in the terminal
        - If not, copy the version in the terminal and paste it in Gemfile, then save the Gemfile.
        - In the terminal run ```bundle version```
        - Open the file ```Gemfile.lock```, scroll to the bottom and change the attributes of ruby version and bundler version ("Bundled with")

    2.  Run other necessary commands from the wsl directory before firing up the server
        - ```bundle install```
        - ```rails db:migrate```
        - ```rails db:seed``` (details below)

* Execution
    1. Command Line
        - In the command line, navigate to the project folder and populate the database with ```rails db:seed```
        - To access our database, start the rails console (```rails c```); use rails console commands to access data
            - Our table names are Authentication (Devise Gem login), User, Course, and Grading
    2. Web Page View
        - In the command line, navigate to the project folder and populate the database with "rails db:seed"
        - Start the rails server (```rails s```)
        - In a web browser, type ```localhost:3000``` and you will be directed to the sign-in page
        - Click "sign up" underneath the sign-in and follow the steps to create an account; you will be automatically signed in
            - When you sign up, you will need to select which user group you belong to, and the views will be different for different user groups
            - Distinct Functions
                - Students - submit, edit and withdraw applications
                - Instructors - write and edit recommendations for students
                - Admins - review applications and make hiring decisions - approve/disapprove applications and fire graders
        - Use the Navigation Bar to navigate to the courses View which shows all info from the courses table
        - Check out the courses page for the functionalities
    

* Members and responsibilities
    - Project Leads - Steven & Neha
    - Tushar & Diego - Student Fuctionalities
    - Neha & Jaiy - Administrator Fuctionalities
    - Steven & Casey - Instructor Functionalites
	
* Outside sources
	- Cited in indivial files with comments, most can be found at the top before the code

* Presentation
    - ```https://docs.google.com/presentation/d/1Z_GQyQoRPW2zmhHiu1yWdU9SkR8GjfBBHxvPkrPCi-0/edit#slide=id.p```
		
* Other thoughts
	- Rails is easy to use, if you already know it, or know good sources of learning it
    - Before spending time to write your own immature implentation of a certain function, check if there already exists a mature and well-written gem that handles this. It will save time and tears.
    - Many more functions we can implement, but we didn't have much time
