# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie) #Simply create a movie for every entry in the table.
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

#handles multiple checkboxes
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  #split the line on the comma
  rating_list.split(', ').each do |rating|
    #uncheck is a Boolean, if true uncheck, false check
    if uncheck
      uncheck ("ratings_#{rating}")
    else
      check ("ratings_#{rating}")
    end
  end
end

Then /I should see all of the movies/ do
  # Make sure that all the movies in the app are visible in the table
  # page.body is the page's HTML body as one giant string.
  expect(page.all('table#movies tbody tr').length).to eq Movie.count
end

#using from web_steps.rb
#When /^(?:|I )press "([^"]*)"$/ do |button|
  #click_button(button)
#end