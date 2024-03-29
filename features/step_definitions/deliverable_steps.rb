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

Given /the following assignments exist/ do |assignments_table|
  assignments_table.hashes.each do |assignment|
    Assignment.create assignment
  end
end

When /I click on edit for deliverable (.+)/ do |num|
    find("a[href='/deliverables/#{num}/edit']").click
end

Then /the project "(.+)" should have a status of "(.+)"/ do |project, status|
    d = Deliverable.find_by_name(project)
    expect(d.status).to eq(status)
end

# Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#   #  ensure that that e1 occurs before e2.
#   #  page.body is the entire content of the page as a string.
#   words = page.body
#   num1 = words.index(e1)
#   num2 = words.index(e2)
#   if num1 > num2
#       fail "Incorrect"
#   end
# end

When /I press delete for deliverable (.*)/ do |num|
  page.find_by_id(num).click
end

When /I click remove user (.+) for deliverable (.+)/ do |user, num|
  find("a[href='/deliverables/#{num}/remove?user_id=#{user}']").click
end
#/deliverables/4/remove?user_id=4