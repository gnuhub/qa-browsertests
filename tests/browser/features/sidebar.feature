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
@en.wikipedia.beta.wmflabs.org
Feature: Sidebar

  Scenario: Go to a random page and interaction should be expanded
    Given I am at a random page
    Then Interaction section should be expanded

  Scenario: Go to a random page and click interaction and it should collapse
    Given I am at a random page
    When I click the interaction section
    Then Interaction section should be collapsed

  Scenario: Go to a random page and print/export section should be collapsed
    Given I am at a random page
    Then Print export section should be collapsed

  Scenario: Go to a random page and click print/export and it should expand
    Given I am at a random page
    When I click print export section
    Then Print export section should be expanded

  Scenario: Go to a random page and tools section should be collapsed
    Given I am at a random page
    Then Tools section should be collapsed

  Scenario: Go to a random page and click tools and it should expand
    Given I am at a random page
    When I click tools section
    Then Tools section should be expanded

  Scenario: Go to the main page and languages section should be expanded
    Given I am at main page
    Then Languages section should be expanded

  Scenario: Go to the main page and click languages and it should collapse
    Given I am at main page
    When I click languages section
    Then Languages section should be collapsed
