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
@chrome @en.wikipedia.beta.wmflabs.org @firefox @internet_explorer_6 @internet_explorer_7 @internet_explorer_8 @internet_explorer_9 @internet_explorer_10 @phantomjs @test2.wikipedia.org
Feature: Log in

  Background:
    Given I am at Log in page

  Scenario: Go to Log in page
    Then Log in page should open
      And Username element should be there
      And Password element should be there
      And Log in element should be there

  Scenario: Log in without entering credentials
    When I log in without entering credentials
    Then Log in page should open
      And feedback should be You have not specified a valid user name.

  Scenario: Log in without entering password
    When I log in without entering password
    Then Log in page should open
      And feedback should be The password field was empty. Please try again.

  Scenario: Log in with incorrect username
    When I log in with incorrect username
    Then Log in page should open
    And feedback should be There is no user by the name "incorrect username". Check your spelling, or go to Wikipedia's signup page to create a new user account.

  Scenario: Log in with incorrect password
    When I log in with incorrect password
    Then Log in page should open
      And feedback should be Incorrect password entered. Please try again.

  @login
  Scenario: Log in with valid credentials
    When Log in as Selenium_user
    Then there should be a link to Selenium user
