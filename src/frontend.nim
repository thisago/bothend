include pkg/karax/prelude
import ./renderer

proc renderPage: VNode =
  render(backend = false)

setRenderer renderPage
