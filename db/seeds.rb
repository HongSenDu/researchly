# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [{:email => "michael@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', :username => "Michael", :bio => "Junior at Columbia University studying CS."},
    {:email => "aaron@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', :username => "Aaron", :bio => "Junior at Columbia University studying CS."},
    {:email => "andrew@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', :username => "Andrew", :bio => "Junior at Columbia University studying CS."},
    {:email => "hong@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', :username => "Hong", :bio => "Sophmore at Columbia University studying CS."},
  ]

users.each do |user|
    User.create!(user)
end


groups = [{:name => "Human Centered Design Lab", :description => "Lab focused on tackling the biggest issues in human computer interaction.", :code => 'QwdmntyA'},
          {:name => "Bell Labs", :description => "Follow the River and Find the C", :code => 'Qwd23tyB'},
          {:name => "Scrum Bucket Research Group", :description => "The Coolest Research Group on Zoom", :code => 'Qwd23tyC'},
        ]

groups.each do |group|
    Group.create!(group)
end



projects = [{:name => "Solving P = NP", :description => "Trying to Solve the P = NP", :group_id => 3, :status => 'Ongoing'},
    {:name => "Programmer Client Interaction", :description => "Finding out the best approaches for clients and programmers to communicate.", :group_id => 3, :status => 'Ongoing'},
  ]

projects.each do |project|
    Project.create!(project)
end

deliverables = [{:name => "Initial Meeting", :description => "First meeting to establish the project.", :status => "Complete", :project_id => 2},
    {:name => "Early draft of paper", :description => "An initial outline of what the eventual published paper will consist of.", :status => "Complete", :project_id => 2},
    {:name => "Demo communication product", :description => "Demo new communication project to clients to get feedback", :status => "Ongoing", :project_id => 2},
    {:name => "Deploy early demo", :description => "Figure out how to deploy the application", :status => "Ongoing", :project_id => 2},
  ]

deliverables.each do |deliverable|
    Deliverable.create!(deliverable)
end

memberships = [{:user_id => 1, :group_id => 1, :member_type => 'leader', :username => "Michael"},
    {:user_id => 1, :group_id => 3, :member_type => 'member', :username => "Michael"},
    {:user_id => 2, :group_id => 3, :member_type => 'member', :username => "Aaron"},
    {:user_id => 3, :group_id => 3, :member_type => 'leader', :username => "Andrew"},
    {:user_id => 3, :group_id => 2, :member_type => 'member', :username => "Andrew"},
    {:user_id => 4, :group_id => 3, :member_type => 'member', :username => "Hong"}
  ]

memberships.each do |membership|
    Membership.create!(membership)
end

assignments = [{:user_id => 3, :deliverable_id => 3},
    {:user_id => 2, :deliverable_id => 1},
    {:user_id => 3, :deliverable_id => 4},
    {:user_id => 1, :deliverable_id => 4},
    {:user_id => 2, :deliverable_id => 4},
    {:user_id => 4, :deliverable_id => 4},
    {:user_id => 2, :deliverable_id => 3},
    {:user_id => 4, :deliverable_id => 3},
  ]

assignments.each do |assignment|
    Assignment.create!(assignment)
end

messages = [
    {:user_id => 2, :group_id => 1, :body => "Hello World!"},
    {:user_id => 3, :group_id => 3, :body => "Good job team"},
    {:user_id => 1, :group_id => 3, :body => "Researchly is awesome"},
    {:user_id => 2, :recipient_id => 3, :subject => "Status of Deliverable", :body => "Hey can you give me an update on the status of those deliverables", :read => false, :show_user => true, :show_recipient => true},
    {:user_id => 2, :recipient_id => 3, :subject => "Research", :body => "hey my research is showing something amazing", :read => false, :show_user => true, :show_recipient => true},
    {:user_id => 1, :recipient_id => 3, :subject => "Testing", :body => "Is this thing on?", :read => false, :show_user => true, :show_recipient => false},
    {:user_id => 3, :recipient_id => 1, :subject => "Idea", :body => "Hey lets meet up i think this will be a good idea.", :read => false, :show_user => false, :show_recipient => true},
  ]

messages.each do |message|
    Message.create!(message)
end