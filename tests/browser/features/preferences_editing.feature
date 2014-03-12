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
@chrome @en.wikipedia.beta.wmflabs.org @firefox @internet_explorer_6 @internet_explorer_7 @internet_explorer_8 @internet_explorer_9 @internet_explorer_10 @login @phantomjs @test2.wikipedia.org
Feature: Preferences Editing

  Scenario: Preferences Date Time
    Given I am logged in
    When I navigate to Preferences
      And I click Editing
    Then I can select edit area font style
      And I can select section editing via edit links
      And I can select section editing by right clicking
      And I can select section editing by double clicking
      And I can select to prompt me when entering a blank edit summary
      And I can select to warn me when I leave an edit page with unsaved changes
      And I can select show edit toolbar
      And I can select enable enhanced editing toolbar
      And I can select enable wizards for inserting links, tables as well as the search and replace function
      And I can select show preview on first edit
      And I can select show preview before edit box
      And I can select live preview

