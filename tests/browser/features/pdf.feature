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
@ie6-bug  @ie7-bug @test2.wikipedia.org
Feature: PDF

  Scenario: Check for Download as PDF link
    Given I am at random page
    Then Download as PDF should be present

  Scenario: Click on Download as PDF link
    Given I am at random page
    When I click on Download as PDF
    Then Download the file link should be present
