Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  data = table.hashes
  data.each do |row|
    puts row.to_s
    Movie.create(row)
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  Movie.find_by_title("#{arg1}") == arg2
end


