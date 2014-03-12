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
@chrome @firefox @internet_explorer_6 @internet_explorer_7 @internet_explorer_8 @internet_explorer_9 @internet_explorer_10 @phantomjs @test2.wikipedia.org
Feature: Print/Export menu Expand and Collapse

  Scenario: Check for Print/export section Expanded
    Given I am at a random page
    Then Print/export section should be expanded

  Scenario: Check for Print/export section Collapsed
    Given I am at a random page
    When I click Print/export
    Then Print/export section should be collapsed

  Scenario: Print/export section collapses after it is expanded
    Given I am at a random page
    When I click Print/export
      And I click Print/export again
    Then Print/export section should be expanded
