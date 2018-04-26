# CS3744 Data Interaction Project
## Purpose:
The purpose of this website is to deliver information about The Battle of Peleliu. The website is designed to utilize the front-end and back-end skills we’ve learned in CS 3744 to present the information we received from Thomas Mcgrath of the HIST class in a clean and impactful way. 
## Audience:
The main audience is people interested in The Battle of Peleliu, but the general audience is everyone who has an interest in military battles/WWII battles specifically.
## Technologies used:
* HTML/CSS/JS
* PHP/Jquery/AJAX/JSON
* MySQL
* MVC Architecture
* Bootstrap Front-end Framework
* Google Fonts/Subtle Pattern Backgrounds
## Pages
### Home Page: 
The Homepage features an interactive design that displays pictures and notable information from the Battle of Peleliu. Users can scroll down to learn brief info about what the battle is and casualty numbers for both sides. There is also an activity feed that shows different user actions.
### Timeline: 
This page features an interactive timeline that pops-up events in a timeline format as users scroll down the page. It allows readers to learn more information about detailed battles and events of the Battle of Peleliu.
### Medal of Honor: 
With every battle, comes distinct soldiers who shined during times of peril. This page shows every soldier who received the Medal of Honor during battle, and their rank. Hovering over their profile card reveals basic information about them.
### Forum: 
The forum is designated as a spot for both history fanatics and casual people to discuss and debate the events that happened at the Battle of Peleliu. As long as a user is registered, he/she can create new posts or respond to current posts already on the forum. API Usage helps filter out sensitive words. 
### Login: 
Page that allows users to log-in to their site-specific account. New users can register an account to gain access to the main pages. The login to access the website is as follows; Username: prof Password: gui
### My Account: 
The My Account page shows your activity on the site and is used to edit your profile. Through this page you can edit your personal information and change your password. You can follow and unfollow other profiles and view the usernames of who follows you.
## AJAX Usage: 
Ajax was used in two different areas. The main use was for posting to a specific forum. The post would appear on the topic timeline without refreshing the page. The other area we used this ajax system was in the login page where you could get the accounts from the database by clicking the “find account” button. This would show a table with your name and username right next to it to help find your account.
## API Usage: 
The API that was set up for the project was used to censor all of the inappropriate language in the topics and posts. This was done in order to add a feeling of a moderator in the forum.
## Instructions on Setting Up: 
Please make sure to have xampp running and apache and mysql running. In order to set up the website, extract the files into a directory of your choosing within the xampp\htdocs folder. Go into the config.php file and set the base url to the location of the folder you extracted the files. The go to your web browser and type in the directory location starting with localhost. This should bring you to the website.
## Above and Beyond: 
* Used bootstrap to emphasize clean-website design and utilize its mobile-scaling and nav-bar tools. 
* Integrated javascript interactivity into every main page (code sources at the bottom). 
* The back end of the website implemented all of the minimum requirements and also added a realistic community effect to the overall experience. We did this through a forum and adding a topic creator and the ability to add posts. 
* The forum also has a moderator effect with the use of the API we used. The API censors the topics and posts for inappropriate language. 
* The website works smoothly and provides every user with a profile in order to be given access to the webpage.

## Project 5 Features
* Added password validation when changing password
* Correct e-mail format validation
* Custom backgrounds for individual pages
* Use of Google Fonts
* Javascript animations on most pages
* Follower/Following list
* Activity Feeds based on following

## User Roles:
* Unregistered, Normal User, Admin, Owner
* Owner can see special “Owner Page” on Account page and make Normal Users->Admin and Admins->Normal Users
* Admins can see special “Admin Page” on Account page and make Normal Users->Admin, but can’t touch Owners
* Normal Users do not see a special page on Account page and have no rights to change other peoples roles
* Unregistered Users only see the Home Screen unless they sign-up and log-in
* Users can sign-up to be Admins if they know the secret passcode on the sign-up page.
The only Owners are the 4 members of GUI substances.

## Site URL: 
http://ec2-18-222-16-185.us-east-2.compute.amazonaws.com/CS3744Project4/

## Code References
* Bootstrap - https://getbootstrap.com
* Home Page - https://html5up.net/spectral
* Timeline - https://codyhouse.co/demo/vertical-timeline/index.html
* Medal of Honor - http://www.imcreativebythesea.com/css-html-bio-card-codepen-challenge/

### Collaborators
* Keller Han
* Anthony Medovar 
* Campbell Johnson
* Staci Williams