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
class EditPage
  include PageObject

  a(:advanced, text: "Advanced")
  text_area(:article_text, id: "wpTextbox1")
  a(:bold, text: "Bold")
  a(:edit, text: "Edit source")
  a(:embedded, text: "Embedded file")
  a(:italic, text: "Italic")
  a(:link, text: "Link")
  img(:math_image, class: "tex")
  button(:preview, id: "wpPreview")
  a(:read, text: "Read")
  a(:reference, text: "Reference")
  button(:save, id: "wpSave")
  button(:show_changes, id: "wpDiff")
  a(:sig, text: "Signature and timestamp")
  a(:special, text: "Special characters")
  a(:view_history, text: "View history")
end
