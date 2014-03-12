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
@chrome @firefox @internet_explorer_6 @internet_explorer_7 @internet_explorer_8 @internet_explorer_9 @internet_explorer_10 @login @phantomjs @test2.wikipedia.org
Feature: Hotcat

  Background:
    Given I am logged in
      And I am at a random page

  Scenario: Hotcat category link
    When I click the Categories link
    Then I am taken to the Special:Categories page

  Scenario: Hotcat Modify several categories
    When I click the Modify several categories button
    Then a Save button is visible
      And an Add new categories link is visible

  Scenario: Hotcat Add category
    When I click the Add a new category link
    Then I can click OK and click Add new category
      And I can click Cancel and click Add new category
