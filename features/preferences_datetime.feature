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
@en.wikipedia.beta.wmflabs.org @login @test2.wikipedia.org
Feature: Preferences Date Time

  Scenario: Preferences Date Time
    Given I am logged in
    When I navigate to Preferences
      And I click Date and time
    Then I can select date format
      And I can see server time
      And I can see local time
      And I can select my time zone
