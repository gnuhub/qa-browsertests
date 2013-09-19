# Browser testing at WMF

## Environment

To run the Selenium tests you will have to install Ruby. Look at the `.ruby-version` file for the exact required version. You also have to install the latest versions of RubyGems and Firefox (the default browser in which the tests run). The easiest way to install Ruby on Linux/Unix is [RVM](https://rvm.io/) and on Windows [RubyInstaller](http://rubyinstaller.org/).
ALERT: On Windows you must use Ruby 1.9.3 for now because cucumber/gherkin library currently doesn't work with Ruby 2.x.x.

Clone the repository, `cd` into it, update RubyGems and install the required RubyGems:

    cd browsertests
    gem update --system
    gem install bundler
    bundle install

If you're not using rvm to manage your Ruby versions, you will need to run the commands as root (using `sudo`).

Environment variable MEDIAWIKI_PASSWORD is required for tests tagged `@login`. For local testing, create a user named `Selenium_user` on your local wiki and export the password as the value for this variable.
For example:

    export MEDIAWIKI_PASSWORD: password here

Run the tests with `bundle exec cucumber`, this should start Firefox.

By default the tests run at en.wikipedia.beta.wmflabs.org. If you want to run the tests elsewhere, set the `MEDIAWIKI_URL` environment variable. For example:

    export MEDIAWIKI_URL=http://commons.wikimedia.beta.wmflabs.org/wiki/ # Linux/Unix
    set MEDIAWIKI_URL=http://commons.wikimedia.beta.wmflabs.org/wiki/ # Windows

The test run creates an HTML report in `reports/` and an XML report (for Jenkins) in `reports/junit`.

To run a single test file enter `bundle exec cucumber features/FEATURE_NAME.feature`.

To run a single test scenario, put a colon and the line number (NN) on which the scenario begins after the file name: `bundle exec cucumber features/FEATURE_NAME.feature:NN`.

By default, the browser will close itself at the end of every scenario. If you want the browser to stay open, set the environment variable KEEP_BROWSER_OPEN to `true`:

    export KEEP_BROWSER_OPEN=true # Linux/Unix
    set KEEP_BROWSER_OPEN=true # Windows

## Sites

The code repository is https://gerrit.wikimedia.org/r/#/admin/projects/qa/browsertests, the GitHub mirror is at https://github.com/wikimedia/qa-browsertests

There is a Jenkins instance that orchestrates test runs when WMF repositories are updated, it is hosted at https://wmf.ci.cloudbees.com/
It runs the tests in multiple browsers at http://saucelabs.com/

Several MediaWiki extensions have their own browser tests:
Mobile tests are in the `tests/acceptance` folder of the [MobileFrontend](https://github.com/wikimedia/mediawiki-extensions-MobileFrontend) extension,
VisualEditor tests are in its `modules/ve-mw/test/browser` folder, etc.

Interested? Read more at [How to contribute](http://www.mediawiki.org/wiki/QA/Browser_testing#How_to_contribute) section of Browser testing page.

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/wikimedia/qa-browsertests)
