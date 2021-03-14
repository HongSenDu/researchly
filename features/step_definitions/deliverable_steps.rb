Given /the following groups exist/ do |groups_table|
    groups_table.hashes.each do |group|
      Group.create group
    end
end

# Given /the following projects exist/ do |projects_table|
#     projects_table.hashes.each do |project|
#       Project.create project
#     end
# end

Given /the following deliverables exist/ do |deliverables_table|
    deliverables_table.hashes.each do |deliverable|
      Deliverable.create deliverable
    end
end

When /I click on edit for deliverable (.+)/ do |num|
    find("a[href='/deliverables/#{num}/edit']").click
end

Then /the project "(.+)" should have a status of "(.+)"/ do |project, status|
    d = Deliverable.find_by_name(project)
    expect(d.status).to eq(status)
end