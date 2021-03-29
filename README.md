# Welcome to Researchly
Welcome to Researchly! Researchly is a research group project management SaaS application. As such, you will be able to create and join research groups, create and edit projects for that group, and create and edit deliverables (tasks) for each project.

## Links
Heroku Link: [https://researchly-app-2.herokuapp.com](https://researchly-app-2.herokuapp.com)

Github Repository Link: [https://github.com/HongSenDu/researchly.git](https://github.com/HongSenDu/researchly.git)

## Team Members:
* Hong Du (hd2455)	
* Andrew Kenn (ajk2251)
* Michael Winitch (mlw2173)
* Aaron Jackson (arj2145)

## Iteration Two: New Features
* The ability to delete groups, projects, and deliverables
* The ability to leave a group
* Fixed all of the back buttons
* Added an enhanced profile page, including the ability to upload a profile picture
* The ability to search groups
* Sort projects and deliverables
* Sign out functionality

## Instructions:

To run Researchly after cloning this repository:
On command line:
~~~
bundle install
rake db:migrate
rake db:seed
rails s
~~~
Then you can open the browser to localhost:3000 to see the application. 

Once you have the application running you can do the following:

### Signing up for an account
On the landing page, click sign-up, enter an email, password, and password confirmation, and you should now be logged in and able to see all the research groups you're a part of.

Once you signed in, go to profile in the top right corner, and you will be able to view your profile. Then you can click on edit your profile where you can upload an avatar or change your username or bio. 

### Create a new group
On your profile page click "new group" and give the group a name and description, and then click create. 

### Join a group
On the profile page click "join a group" which lists all the groups and you can then choose one you wish to join. 

### Creating a new project
On the group home page, click "new project" and give the project a name and description. Then click create and you should now be on the project details page

### Creating a new deliverable:
On the project details page, click "Add new deliverable" and give the deliverable a name, description and status. Click create deliverable and you should now be back on the project details page and see you're new deliverable

### Editing a group
On the group homepage click "edit" and then you can edit the group's name or description. Then you can click "Update Group" to update the group.

### Editing a project:
On the group home page, click the project you'd like to edit and then you should now be on the projects detail page. Then click "edit" and change the project name and description to your liking. Click "Update Project" and you should now be back on the project details page and see the updated name and description. 

### Editing a Deliverable
On the details page of the project whose deliverable you'd like to edit, locate the deliverable you'd like to edit. Then click the "edit" link that corresponds to it in the table. Change the deliverable name, description and status to your liking. Click "Update Deliverable" and you should now be back on the project details page and see the updated deliverable.

### Delete a group
On the group's homepage click the "delete" button to delete the group. This will also remove all of its projects and deliverables.

### Delete a Project
Go onto the projects homepage for the group, and click the "delete" button for that project to remove it. This will also remove all of its deliverables. 

### Delete a Deliverable
Go to the project you want to delete a deliverable from. You should see a table of all deliverables. CLick the "Delete" button for the deliverable you want to remove. 
