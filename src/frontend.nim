include pkg/karax/prelude

import ./renderer

proc renderPage: VNode =
  render(false)

setRenderer renderPage
