# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create! movie
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  i1 = page.body.index e1
  i2 = page.body.index e2
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(i1).to be < i2
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list = rating_list.gsub(/\s+/, "")
  ratings_list_as_arr = rating_list.split ','
  ratings_list_as_arr.each {|element| step "I #{uncheck}check \"ratings[#{element}]\""}
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  rows = page.all('table#movies tr').count - 1
  expect(rows).to eq 10
end


Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |title, director|
  movie = Movie.find_by title:title
  expect(movie["director"]).to eq director
end
