Given /the following projects exist/ do |projects_table|
    projects_table.hashes.each do |project|
      Project. create project
    end
  end

Given /the following group exists/ do |groups_table|
  groups_table.hashes.each do |group|
    Group.create group
  end
end 

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    page1 = page.body.gsub("\n", '')
    expect(page1 =~ /.*#{e1}.*#{e2}.*/).not_to eq(nil) 
end

# When /I press delete for project(.+)/ do |num|
#   find("a[href='/projects/5']").press
# end
  
=begin
  Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    #  ensure that that e1 occurs before e2.
    #  page.body is the entire content of the page as a string.
    expect(page.body.index(e1) < page.body.index(e2))
  end
  
  When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
    rating_list.split(', ').each do |rating|
      step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
    end
  end
  
  Then /I should see all the movies/ do
    # Make sure that all the movies in the app are visible in the table
    Movie.all.each do |movie|
      step %{I should see "#{movie.title}"}
    end
  end
  
  Then /the director of "(.*)" should be "(.*)"/ do |e1, e2|
    movie = Movie.find_by_title(e1)
    expect(movie.director).to eq(e2) 
  end
=end