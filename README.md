# Welcome to Researchly
Welcome to Researchly! Researchly is a research group project management SaaS application. As such, you will be able to create and join research groups, create and edit projects for that group, and create and edit deliverables (tasks) for each project.

## Links
Heroku Link: [https://researchly-app.herokuapp.com](https://researchly-app.herokuapp.com)
Github Repository Link: [https://github.com/HongSenDu/researchly.git](https://github.com/HongSenDu/researchly.git)

## Team Members:
Hong Du (hd2455)	
Andrew Kenn (ajk2251)
Michael Winitch (mlw2173)
Aaron Jackson (arj2145)

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
On the landing page, click sign-up enter an email, password, and password confirmation you should now be logged in and able to see all the research groups you're apart of

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

# Editing a Deliverable
On the details page of the project whose deliverable you'd like to edit, locate the deliverable you'd like to edit. Then click the "edit" link that corresponds to it in the table. Change the deliverable name, description and status to your liking. Click "Update Deliverable" and you should now be back on the project details page and see the updated deliverable.
