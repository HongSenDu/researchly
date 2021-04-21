# Welcome to Researchly
Welcome to Researchly! Researchly is a research group project management SaaS application. As such, you will be able to create and join research groups, create and edit projects for that group, and create and edit deliverables (tasks) for each project. You can also assign group members to work on specific tasks.

## Links
Heroku Link: [https://researchly-app.herokuapp.com](https://researchly-app.herokuapp.com)

Github Repository Link: [https://github.com/HongSenDu/researchly.git](https://github.com/HongSenDu/researchly.git)

## Team Members:
* Hong Du (hd2455)	
* Andrew Kenn (ajk2251)
* Michael Winitch (mlw2173)
* Aaron Jackson (arj2145)

### CAUTION
* Please do not create a new account with a Columbia University Email Address. All emails sent from Researchly to @Columbia.edu addresses are automatically marked as low priority by CUIT's filters. We recommend signing up with a regular @gmail.com account. 


## Final Iteration: New Features
* Added messaging functionality to groups
* Recent activity now shows when member joins and/or leaves group
* Recent activity now shows when member is assigned to or unassigned from a deliverable
* Users now get an email when they've been assigned to a deliverable, when a deliverable they're assigned to is complete, when someone joins a group they're in, and when someone leaves a group they're in.
* Add due dates to deliverables
* Sort deliverables by due date
* Added ability to attach data to deliverables so you can share important files with teammates

## Iteration Three: New Features
* See deliverables on an User's Home Page
* Added ability to see a project's completion percentage
* Join groups via code
* Add members to deliverables
* Enhanced deliverables page
* Implemented Navbar
* Seamlessly update status of deliverables and projects
* Check recent activities within a group
* Change/Assign group leaders
* Sort deliverables by name

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

**For the final iteration make sure to place the master.key file submitted with the README in the `config` folder. It is needed to decrypt the `credentials.yml.enc` file that contains aws credentials. Also yarn has to be run on the terminal as well to make sure the `jquery-rails` gem works.**

On command line:
~~~
bundle install
rake db:migrate
rake db:seed
yarn 
rails s
~~~
Then you can open the browser to localhost:3000 to see the application. 

Once you have the application running you can do the following:

### Signing up for an account
On the landing page, click sign-up, enter an email, password, and password confirmation, and you should now be logged in and able to see all the research groups you're a part of.

Once you signed in, go to profile in the top right corner, and you will be able to view your profile. Then you can click on edit your profile where you can upload an avatar or change your username or bio. 

### Create a new group
On either the home page, or group page, you can click "New Group" to create a new group. Whoever creates the group will be the leader of that group. 

### Join a group
On the profile page click "join a group" which lists all groups and you can then choose one you wish to join. You will need a unique code to join each group. The codes for each group are as follows:
* Human Centered Design Lab: QwdmntyA
* Bell Labs: Qwd23tyB
* Scrum Bucket: Qwd23tyC

### Remove group members
On the group's homepage, if you are a group leader you can remove members from the group by clicking "Remove from Group" for that person.

### Make a group member a leader
On the group's homepage, if you are a group leader you can upgrade members to become leaders by clicking "Upgrade to Leader" for that person.

### Creating a new project
On the group home page, click "new project" and give the project a name and description. Then click create and you should now be on the project details page

### Creating a new deliverable:
On the project details page, click "Add new deliverable" and give the deliverable a name, description and status. Click create deliverable and you should now be back on the project details page and see you're new deliverable

### Editing a group
On the group homepage click "edit" and then you can edit the group's name or description. Then you can click "Update Group" to update the group.

### Editing a project:
On the group home page, click the project you'd like to edit and then you should now be on the projects detail page. Then click "edit" and change the project name and description to your liking. Click "Update Project" and you should now be back on the project details page and see the updated name and description. 

### Editing a Deliverable
On the details page of the project whose deliverable you'd like to edit, locate the deliverable you'd like to edit. Then click the "edit" link that corresponds to it in the table. Change the deliverable name, description and status to your liking. Click "Update Deliverable" and you should now be back on the Deliverable details page and see the updated deliverable.

### Assigning Members to Deliverables
Also on the "edit deliverable page", you will have the ability to assign a member to that specific deliverable. All members in the group who are not already assigned to the deliverable will be listed with a checkbox next to their name. To assign a member, click the checkbox by their name and click "Update Deliverable." You should now be back on the Deliverable Details page and see the updated deliverable with the new assignments. 

### Removing Members from Deliverables
On the Deliverables Detail page - you should see all the members currently assigned to that specific deliverable listed in a table. In this table, their should be a "remove" link next to each members name. To remove a member, simply click their respective "remove" link and they will be unassigned from the deliverable. 

### Attaching Data to Deliverables
On the edit deliverable page, click upload files to upload files to the deliverable. You can select multiple using shift click. Click update deliverable and you can now see the files appear on the deliverable show page.

### Removing Data from Deliverables
On the edit deliverable page, click remove next to the files you want to remove and then click update deliverable. This will remove them from the deliverable on the show page.

### Delete a group
On the group's homepage click the "delete" button to delete the group. This will also remove all of its projects and deliverables. Only group leaders can delete a group. 

### Delete a project
Go onto the projects homepage for the group, and click the "delete" button for that project to remove it. This will also remove all of its deliverables. 

### Delete a deliverable
Go to the project you want to delete a deliverable from. You should see a table of all deliverables. CLick the "Delete" button for the deliverable you want to remove. 

### Inbox
Click on the inbox on the rop right of the navigation bar to access messages. You can also click on new message to draft your own message. Select who you want to send the message to, the subject, and body, and then click create to post the message. 

### Message Board
In addition to sending direct messages, you can also send a message to a research group in the group's message board. On a group's homepage you can see the message board in the center. Fill in the body and click create to post your own message to the message board. Then this message will be displayed in that group's message board. 
