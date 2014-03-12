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
Feature: Preferences Appearance

  Scenario: Preferences Appearance
    Given I am logged in
    When I navigate to Preferences
      And I click Appearance
    Then I can select skins
      And I have a link to Custom CSS
      And I have a link to Custom Javascript
      And I can select image size
      And I can select thumbnail size
      And I can select Threshold for stub link
      And I can select underline preferences
      And I have advanced options checkboxes
      And I have Math options radio buttons
      And I can click Save
      And I can restore default settings
