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
@chrome @en.wikipedia.beta.wmflabs.org @firefox @internet_explorer_7 @internet_explorer_8 @internet_explorer_9 @internet_explorer_10 @login @phantomjs @test2.wikipedia.org
Feature: Page

  Background:
    Given I am logged in

  @internet_explorer_6
  Scenario:Go to page that does not exist
    Given I am at page that does not exist
    Then page text should contain pages
      And link Create should be there

  @internet_explorer_6
  Scenario: Prepare to start a new page using the URL
    Given I am at page that does not exist
    When I click link Create source
    Then edit page should open
      And text box with page text should be there
      And Save button should be there
      And Preview button should be there
      And Show Changes button should be there
      And Edit controls should be there

  @internet_explorer_6
  Scenario: Start a new page using the URL
    Given I am at page that does not exist
    When I click link Create source
      And I enter article text
      And I click Save page button
    Then newly created page should open
      And page title should be there
      And page text should be there
      And Discussion link should be there
      And Edit link should be there
      And unwatch element should be there
      And watch element should not be there

  @internet_explorer_6
  Scenario: Move existing page dialog
    Given I am starting a page to be moved
      And I create the page to be moved
    When I click Move
    Then I should be on a page Move newly created page
      And I should see a Namespace selectbox
      And I should see a To new title textbox
      And I should see a Reason textarea
      And I should see a Watch source page radio button

  Scenario: Move existing page
    Given I am starting a page to be moved to a new name
    And I have clicked Move on the newly created page
    When I make a new page name for the moved page
      And I click Move page
    Then I should be on a page that says has been moved
      And I should see the text A redirect has been created
      And I should have a link to the old page title and a link to the new page title
      And the new page should have the correct text
      And the old page should display a redirect to the new page
