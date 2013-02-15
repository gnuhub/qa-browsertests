

When /^I append \?tour=gettingstarted to the page URL$/ do
  @browser.goto(@browser.url + '?tour=gettingstarted')
end

Then /^I should see the guider lightbox$/ do
  on(TourPage).guider1_element.should exist
end

Given /^I am on a page with Ready to Help lightbox$/ do
  step 'I am at random page'
  step 'I append ?tour=gettingstarted to the page URL'
end

When /^I click Okay$/ do
  on(TourPage).okay_element.when_present.click
end

Then /^I should see a Click Edit popup$/ do
  on(TourPage).guider2_element.should exist
end

Given /^I am on a page with Click Edit popup$/ do
  step 'I am on a page with Ready to Help lightbox'
  step 'I click Okay'
end

When /^I click the Edit link on the wiki page$/ do
  on(TourPage).edit
end

Then /^I should see a Preview popup$/ do
  on(TourPage).guider3_element.should exist
end

Given /^I am on a page with Preview popup$/ do
  step 'I am on a page with Click Edit popup'
  step 'I click the Edit link on the wiki page'
end

When /^I click Show Preview on the wiki page$/ do
  on(TourPage).preview
end

Then /^I should see a You're almost finished popup$/ do
  on(TourPage).guider4_element.should exist
end




