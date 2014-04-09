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
class PreferencesAppearancePage
  include PageObject

  include URL
  page_url URL.url("Special:Preferences#mw-prefsection-rendering")

  radio_button(:always_render_radio, id: "mw-input-wpmath-0")
  checkbox(:auto_number_check, id: "mw-input-wpnumberheadings")
  checkbox(:collapse_sidebar_vector_check, id: "mw-input-wpvector-collapsiblenav")
  radio_button(:cologne_blue, id: "mw-input-wpskin-cologneblue")
  a(:css_link, text:"Custom CSS")
  checkbox(:dont_show_aft_check, id: "mw-input-wparticlefeedback-disable")
  checkbox(:exclude_from_experiments_check, id: "mw-input-wpvector-noexperiments")
  checkbox(:hidden_categories_check, id: "mw-input-wpshowhiddencats")
  a(:javascript_link, text: "Custom JavaScript")
  radio_button(:leave_as_tex_radio, id: "mw-input-wpmath-3")
  button(:mathjax_button, id: "mw-input-wpmathJax")
  radio_button(:modern, id: "mw-input-wpskin-modern")
  radio_button(:monobook, id: "mw-input-wpskin-monobook")
  a(:restore_default_link, text:/Restore all default settings/)
  button(:save_button, text: "Save")
  select_list(:size_select, id: "mw-input-wpimagesize")
  select_list(:threshold_select, id: "mw-input-wpstubthreshold")
  select_list(:thumb_select, id: "mw-input-wpthumbsize")
  select_list(:underline_select, id: "mw-input-wpunderline")
  radio_button(:vector, id: "mw-input-wpskin-vector")
end
