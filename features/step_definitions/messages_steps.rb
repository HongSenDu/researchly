Given /the following messages exist/ do |messages_table|
    messages_table.hashes.each do |message|
        Message.create message
    end
end
# When I select option "My Test Inc Account" from ".accounts-dropdown"
When(/^I select option "(.*?)" from dropdown for "(.*?)"$/) do |option, 
    selector|
    select option, from: selector
    end