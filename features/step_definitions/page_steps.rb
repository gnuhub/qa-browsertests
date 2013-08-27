Given(/^I am at page that does not exist$/) do
  visit(DoesNotExistPage, using_params: {page_name: @does_not_exist_page_name})
end

When(/^I click link Create source$/) do
  on(DoesNotExistPage).create_source
end
When(/^I click Save page button$/) do
  on(EditPage).save
end
When(/^I enter article text$/) do
  on(EditPage).article_text = "Starting a new page using the URL"
end

Then(/^Discussion link should be there$/) do
  on(ArticlePage).discussion_element.should exist
end
Then(/^link Create should be there$/) do
  on(DoesNotExistPage).create_source_element.should exist
end
Then(/^newly created page should open$/) do
  @browser.url.should match Regexp.escape(@does_not_exist_page_name)
end
Then(/^page text should be there$/) do
  on(ArticlePage).page_text.should match Regexp.escape("Starting a new page using the URL")
end
Then(/^page text should contain (.+)$/) do |text|
  on(DoesNotExistPage).page_text.should match Regexp.escape(text)
end
Then(/^page title should be there$/) do
  on(ArticlePage).title.should match Regexp.escape(@does_not_exist_page_name)
end
Then(/^text box with page text should be there$/) do
  on(EditPage).article_text_element.should exist
end
Then(/^watch element should not be there$/) do
  on(ArticlePage).watch_element.should_not exist
end

Then(/^unwatch element should be there$/) do
  on(ArticlePage).unwatch_element.should exist
end

Given(/^I am starting a page to be moved$/)  do
  visit(DoesNotExistPage, using_params: {page_name: @does_not_exist_page_name})
end

Given(/^I create the page to be moved$/)  do
  step 'I click link Create source'
  step 'I enter article text'
  step 'I click Save page button'
end

When(/^I click Move$/) do
  on(ArticlePage) do |page|
    page.actions_link
    page.move_link
  end
end

Then(/^I should be on a page Move newly created page$/) do
  @browser.url.should match Regexp.escape('Special:MovePage')
  on(ArticlePage).page_text.should match Regexp.escape("Move page: #{@does_not_exist_page_name}")
end

Then(/^I should see a Namespace selectbox$/) do
  on(MovePage).namespace_element.should exist
end

Then(/^I should see a To new title textbox$/) do
  on(MovePage).new_title_element.should exist
end

Then(/^I should see a Reason textarea$/) do
  on(MovePage).reason_element.should exist
end

Then(/^I should see a Leave a redirect radio button$/) do
  on(MovePage).leave_redirect_element.should exist
end

Then(/^I should see a Watch source page radio button$/) do
  on(MovePage).watch_source_element.should exist
end

Given(/^I am starting a page to be moved to a new name$/)  do
  visit(DoesNotExistPage, using_params: {page_name: @does_not_exist_page_name})
end

Given(/^I have clicked Move on the newly created page$/) do
  step 'I click link Create source'
  step 'I enter article text'
  step 'I click Save page button'
  step 'I click Move'
end

When(/^I make a new page name for the moved page$/) do
  on(MovePage).new_title="#{@does_not_exist_page_name} Moved"
end

When(/^I click Move page$/) do
  on(MovePage).move_page
end

Then(/^I should be on a page that says (.+)$/) do |success_message|
  on(ArticlePage).page_text.should match Regexp.escape(success_message)
end

Then(/^I should have a link to the old page title and a link to the new page title$/) do
  on(MovePage) do |page|
    page.old_page_link_element(@does_not_exist_page_name).when_present.should exist
    page.moved_page_link_element(@does_not_exist_page_name).when_present.should exist
  end
end

Then(/^I should see the text A redirect has been created$/) do
  on(ArticlePage).page_text.should match Regexp.escape('A redirect has been created')
end

Then(/^the the new page should have the correct text$/) do
  on(MovePage) do |page|
    page.old_page_link_element(@does_not_exist_page_name).when_present.click
    page.redirect_content.should match(/Redirect page/)
  end
end

Then(/^the old page should display a redirect to the new page$/) do
  on(MovePage) do |page|
    page.moved_page_link_element(@does_not_exist_page_name).when_present.click
    page.body_content.should match(/Moved/)
    page.body_content.should_not match(/Redirect page/)
  end
end