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
@chrome @firefox @internet_explorer_6 @internet_explorer_7 @internet_explorer_8 @internet_explorer_9 @internet_explorer_10 @login @phantomjs
Feature: ProveIt

  Background:
    Given I am logged in
    When I am at a random page
      And I click Edit button on the page
      And I click ProveIt show button
      And I click add a reference link

  Scenario: Add a new reference
    When I choose a Book reference
      And I enter new reference data
      And I click Insert into edit form
    Then I see the new reference in the list
      And I see the new reference in the page editor

  Scenario: Edit and update a reference
    When I choose a Web reference
      And I enter new reference data
      And I click Insert into edit form
      And I click on the edit button for the new reference
      And I enter updated reference data
      And I click on the update edit form button
    Then I see the updated reference in the list
      And I see the updated reference in the page editor
