#
# This file is subject to the license terms in the LICENSE file found in the
# qa-browsertests top-level directory and at
# https://git.wikimedia.org/blob/qa%2Fbrowsertests/HEAD/LICENSE. No part of
# qa-browsertests, including this file, may be copied, modified, propagated, or
# distributed except according to the terms contained in the LICENSE file.
#
# Copyright 2012-2014 by the Mediawiki developers. See the CREDITS file in the
# qa-browsertests top-level directory and at
# https://git.wikimedia.org/blob/qa%2Fbrowsertests/HEAD/CREDITS
#
Given(/^I am at page that does not exist$/) do
  visit(DoesNotExistPage, using_params: {page_name: @random_string})
end

Given(/^I am starting a page to be moved$/)  do
  visit(DoesNotExistPage, using_params: {page_name: @random_string})
end

Given(/^I am starting a page to be moved to a new name$/)  do
  visit(DoesNotExistPage, using_params: {page_name: @random_string})
end

Given(/^I create the page to be moved$/)  do
  step "I click link Create source"
  step "I enter article text"
  step "I click Save page button"
end

Given(/^I have clicked Move on the newly created page$/) do
  step "I click link Create source"
  step "I enter article text"
  step "I click Save page button"
  step "I click Move"
end

When(/^I click link Create source$/) do
  on(DoesNotExistPage).create_source_element.when_present.click
end

When(/^I click Move$/) do
  on(ArticlePage) do |page|
    page.actions_link_element.when_present.click
    page.move_link_element.when_present.click
  end
end

When(/^I click Move page$/) do
  on(MovePage).move_page_element.when_present.click
end

When(/^I click Save page button$/) do
  on(EditPage).save_element.when_present.click
end

When(/^I enter article text$/) do
  on(EditPage) do |page|
    page.article_text_element.when_present.click
    page.article_text = "Starting a new page using the URL"
  end
end

When(/^I make a new page name for the moved page$/) do
  on(MovePage).new_title="#{@random_string} Moved"
end

Then(/^Discussion link should be there$/) do
  on(ArticlePage).discussion_element.when_present.should be_visible
end

Then(/^I should have a link to the old page title and a link to the new page title$/) do
  on(MovePage) do |page|
    page.old_page_link_element(@random_string).when_present.should be_visible
    page.moved_page_link_element(@random_string).when_present.should be_visible
  end
end

Then(/^I should be on a page Move newly created page$/) do
  @browser.url.should match Regexp.escape("Special:MovePage")
  on(ArticlePage).page_text.should match Regexp.escape("Move page: #{@random_string}")
end

Then(/^I should be on a page that says (.+)$/) do |success_message|
  on(ArticlePage).page_text.should match Regexp.escape(success_message)
end

Then(/^I should see the text A redirect has been created$/) do
  on(ArticlePage).page_text.should match Regexp.escape("A redirect has been created")
end

Then(/^I should see a Leave a redirect radio button$/) do
  on(MovePage).leave_redirect_element.should be_visible
end

Then(/^I should see a Namespace selectbox$/) do
  on(MovePage).namespace_element.should be_visible
end

Then(/^I should see a Reason textarea$/) do
  on(MovePage).reason_element.should be_visible
end

Then(/^I should see a To new title textbox$/) do
  on(MovePage).new_title_element.should be_visible
end

Then(/^I should see a Watch source page radio button$/) do
  on(MovePage).watch_source_element.should be_visible
end

Then(/^link Create should be there$/) do
  on(DoesNotExistPage).create_source_element.when_present.should be_visible
end

Then(/^newly created page should open$/) do
  @browser.url.should match Regexp.escape(@random_string)
end

Then(/^page text should be there$/) do
  on(ArticlePage).page_text.should match Regexp.escape("Starting a new page using the URL")
end

Then(/^page text should contain (.+)$/) do |text|
  on(DoesNotExistPage).page_text.should match Regexp.escape(text)
end

Then(/^page title should be there$/) do
  on(ArticlePage).title.should match Regexp.escape(@random_string)
end

Then(/^text box with page text should be there$/) do
  on(EditPage).article_text_element.should be_visible
end

Then(/^the new page should have the correct text$/) do
  on(MovePage) do |page|
    page.old_page_link_element(@random_string).when_present.click
    page.redirect_content.should match(/Redirect page/)
  end
end

Then(/^the old page should display a redirect to the new page$/) do
  on(MovePage) do |page|
    page.moved_page_link_element(@random_string).when_present.click
    page.body_content.should match(/Moved/)
    page.body_content.should_not match(/Redirect page/)
  end
end

Then(/^watch element should be there$/) do
  on(ArticlePage).watch_element.when_present.should be_visible
end

Then(/^unwatch element should not be there$/) do
  on(ArticlePage).unwatch_element.should_not be_visible
end
