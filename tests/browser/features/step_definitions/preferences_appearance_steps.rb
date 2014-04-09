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
When(/^I navigate to Preferences$/) do
  visit(PreferencesPage)
end
When(/^I click Appearance$/) do
  visit(PreferencesPage).appearance_link_element.when_present.click
end
Then(/^I can select skins$/) do
  on(PreferencesAppearancePage) do |page|
    page.cologne_blue_element.should exist
    page.modern_element.should exist
    page.monobook_element.should exist
    page.vector_element.should exist
  end
end
Then(/^I have a link to Custom CSS$/) do
  on(PreferencesAppearancePage).css_link_element.should exist
end
Then(/^I have a link to Custom Javascript$/) do
  on(PreferencesAppearancePage).javascript_link_element.should exist
end
Then(/^I can select image size$/) do
  on(PreferencesAppearancePage).size_select_element.should exist
end
Then(/^I can select thumbnail size$/) do
  on(PreferencesAppearancePage).thumb_select_element.should exist
end
Then(/^I can select Threshold for stub link$/) do
  on(PreferencesAppearancePage).threshold_select_element.should exist
end
Then(/^I can select underline preferences$/) do
  on(PreferencesAppearancePage).underline_select_element.should exist
end
Then(/^I have advanced options checkboxes$/) do
  on(PreferencesAppearancePage) do |page|
    page.hidden_categories_check_element.should exist
    page.auto_number_check_element.should exist
  end
end
Then(/^I have Math options radio buttons$/) do
  on(PreferencesAppearancePage) do |page|
    page.always_render_radio_element.should exist
    page.leave_as_tex_radio_element.should exist
    page.mathjax_button_element.should exist
  end
end
Then(/^I can click Save$/) do
  on(PreferencesAppearancePage).save_button_element.should exist
end
Then(/^I can restore default settings$/) do
  on(PreferencesAppearancePage).restore_default_link_element.should exist
end
