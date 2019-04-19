require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given /^I am logged into the officers panel$/ do
  visit '/users/new'
  fill_in 'user_first_name', :with => 'admin_first'
  fill_in 'user_last_name', :with => 'last_name'
  fill_in 'user_email', :with => 'fake@email.com'
  fill_in 'user_phone', :with => '911'
  fill_in 'user_password', :with => 'admin123'
  fill_in 'user_password_confirmation', :with => 'admin123'
  click_button 'Save Changes'
  if page.respond_to? :should
    page.should have_content('Logout')
  else
    assert page.has_content?('Logout')
  end
  visit '/'
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )follow Officer's Table "([^"]*)"$/ do |link|
  within("#users_officers_table") do
    click_link(link)
  end
end

When /^(?:|I )follow Member's Table "([^"]*)"$/ do |link|
  within("#users_members_table") do
    click_link(link)
  end
end


When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|

  expect(page.body.index(e1) < page.body.index(e2))
end

Then /^I should see the "([^"]*)" in this order:$/ do |selector, table|
  expected_order = table.raw
  actual_order = page.all(selector).collect(&:text)
  actual_order.should == expected_order.flatten
end