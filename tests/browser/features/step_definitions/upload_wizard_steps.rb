#
# This file is subject to the license terms in the LICENSE file found in the
# qa-browsertests top-level directory and at
# https://git.wikimedia.org/blob/qa%2Fbrowsertests/HEAD/LICENSE. No part of
# qa-browsertests, including this file, may be copied, modified, propagated, or
# distributed except according to the terms contained in the LICENSE file.
#
# Copyright 2012-2013 by the Mediawiki developers. See the CREDITS file in the
# qa-browsertests top-level directory and at
# https://git.wikimedia.org/blob/qa%2Fbrowsertests/HEAD/CREDITS
#
Given(/^I am logged in$/) do
  visit(LoginPage).login_with(ENV["MEDIAWIKI_USER"], ENV["MEDIAWIKI_PASSWORD"])
  on(LoginPage).logout_link_element.when_present(15).should be_visible
end

When(/^click button Continue$/) do
  on(UploadPage).continue_element.when_present(15).click
end
When(/^I click Next button$/) do
  on(UploadWizardPage).next_element.when_present(15).click
end
When(/^I click Next button at Describe page$/) do
  sleep 1 # todo # I can not figure out at the moment how to make this work without using sleep
  on(DescribePage).next_element.when_present(15).click
end
When(/^I click Next button at Learn page$/) do
  on(LearnPage).next_element.when_present(15).click
end
When(/^I click Next button at Release rights page$/) do
  on(ReleaseRightsPage).next_element.when_present(15).click
end
When(/^I click This file is my own work$/) do
  on(ReleaseRightsPage).select_my_own_work
end
When(/^I enter category$/) do
  on(DescribePage).category = "Test"
end
When(/^I enter description$/) do
  on(DescribePage).description = "description"
end
When(/^I enter title$/) do
  on(DescribePage).title = "Title #{Random.new.rand}"
end
When(/^I navigate to Upload Wizard$/) do
  visit UploadWizardPage
end
When(/^thumbnail should be visible$/) do
  on(ReleaseRightsPage).thumbnail_element.when_present.should be_visible
end
When(/^upload file (.+)$/) do |file_name|
  require "tempfile"
  path = "#{Dir.tmpdir}/#{file_name}"

  require "chunky_png"
  ChunkyPNG::Image.new(Random.new.rand(255), Random.new.rand(255), Random.new.rand(255)).save path

  if @browser.driver.browser == :chrome
    @browser.execute_script "document.getElementsByName('file')[0].removeAttribute('class');"
    @browser.execute_script "document.getElementsByName('file')[0].removeAttribute('style');"
  end

  on(UploadPage).select_file = path
end
Then(/^(.+) checkbox should be there$/) do |_|
  on(LearnPage).skip_element.when_present.should be_visible
end
Then(/^Describe page should open$/) do
  @browser.url.should match /Special:UploadWizard/
end
Then(/^Learn page should appear$/) do
  @browser.url.should match /Special:UploadWizard/
end
Then(/^Release rights page should open$/) do
  @browser.url.should match /Special:UploadWizard/
end
Then(/^Select a media file to donate button should be there$/) do
  sleep 1
  on(UploadPage).select_file_element.when_present.should be_visible
end
Then(/^title text field should be there$/) do
  on(DescribePage).title_element.when_present.should be_visible
end
Then(/^Upload more files button should be there$/) do
  on(UsePage).upload_more_files_element.when_present.should be_visible
end
Then(/^Upload page should appear$/) do
  @browser.url.should match /Special:UploadWizard/
end
Then(/^Use page should open$/) do
  @browser.url.should match /Special:UploadWizard/
end
