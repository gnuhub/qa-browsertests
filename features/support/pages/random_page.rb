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
class RandomPage
  include PageObject

  include URL
  page_url URL.url("Special:Random")

  span(:cog, title: "Language settings")
  a(:community_portal, text: "Community portal")
  a(:create_a_book, text: "Create a book")
  a(:download_as_pdf, text: "Download as PDF")
  a(:download_the_file, text: "Download the file")
  a(:edit_page, title: /You can edit this page/)
  text_area(:editor_text, id: "wpTextbox1")
  div(:input_method, class: "imeselector imeselector-toggle")
  a(:input_method_enabled, class: "ime-name imeselector-toggle")
  h3(:input_method_ime_list_title, class: "ime-list-title")
  ul(:input_method_language_list, class: "ime-language-list")
  div(:input_method_selector_menu, class: "imeselector-menu")
  a(:interaction_section, text: "Interaction")
  text_field(:language_filter, id: "languagefilter")
  div(:language_settings_dialog, id: "language-settings-dialog")
  li(:main_page, id: "n-mainpage-description")
  a(:more_languages, class: "ime-selector-more-languages")
  a(:print_export, text: "Print/export")
  a(:printable_version, text: "Printable version")
  li(:uls_malayalam_inscript2_item, data_ime_inputmethod: "ml-inscript2")
  button(:search_button, id: "searchButton")
  text_field(:search_input, id: "searchInput")
  a(:tools, text: "Tools")
  a(:uls_trigger, class: "uls-trigger")
  a(:upload_file, text: "Upload file")
end
