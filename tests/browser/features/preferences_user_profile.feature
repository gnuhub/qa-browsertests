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
Feature: Preferences User profile

  Scenario: Preferences User profile
    Given I am logged in
    When I navigate to Preferences
      And I click User profile
    Then I can see my Basic informations
      And I can change my language
      And I can change my gender
      And I have more language settings
      And I can see my signature
      And I can change my signature
      And I can see my email
      And I can change my email options
      And I can click Save
      And I can restore default settings
