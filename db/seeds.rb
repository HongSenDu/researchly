# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [{:email => "michael@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', :username => "Michael", :bio => "Cool person"},
    {:email => "aaron@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', :username => "Aaron", :bio => "Cool person"},
    {:email => "andrew@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', :username => "Andrew", :bio => "Cool person"},
    {:email => "hong@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', :username => "Hong", :bio => ""},
  ]

users.each do |user|
    User.create!(user)
end


groups = [{:name => "Group 1", :description => "cool group"},
          {:name => "Group 2", :description => "not cool group"},
          {:name => "Group 3", :description => "decent group"},
          {:name => "Group 4", :description => "test group"},
          {:name => "Group 5", :description => "group 5"},
          {:name => "Group 6", :description => "group 6"}
        ]

groups.each do |group|
    Group.create!(group)
end



projects = [{:name => "Project 1", :description => "", :group_id => 1},
    {:name => "Project 2", :description => "", :group_id => 2},
    {:name => "Project 3", :description => "", :group_id => 3},
    {:name => "Project 4", :description => "", :group_id => 4}
  ]

projects.each do |project|
    Project.create!(project)
end

deliverables = [{:name => "deliverable 1", :description => "", :status => "done", :project_id => 1},
    {:name => "deliverable 2", :description => "", :status => "ongoing", :project_id => 1},
    {:name => "deliverable 3", :description => "", :status => "done", :project_id => 2},
    {:name => "deliverable 4", :description => "", :status => "ongoing", :project_id => 3},
    {:name => "deliverable 5", :description => "", :status => "ongoing", :project_id => 3},
    {:name => "deliverable 6", :description => "", :status => "done", :project_id => 3}
  ]

deliverables.each do |deliverable|
    Deliverable.create!(deliverable)
end

memberships = [{:user_id => 1, :group_id => 1},
    {:user_id => 1, :group_id => 2},
    {:user_id => 2, :group_id => 1},
    {:user_id => 3, :group_id => 3},
    {:user_id => 3, :group_id => 2},
    {:user_id => 4, :group_id => 1},
    {:user_id => 3, :group_id => 3}
  ]

memberships.each do |membership|
    Membership.create!(membership)
end

assignments = [{:user_id => 1, :deliverable_id => 1},
    {:user_id => 2, :deliverable_id => 1},
    {:user_id => 3, :deliverable_id => 1}
  ]

assignments.each do |assignment|
    Assignment.create!(assignment)
end
