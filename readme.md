<div align="center">

# **both-end**
#### Render your HTML in both ends!

<br>

<!-- [About](#about) - [Features](#features) -->
[License](#license)
</div>

```nim
# renderer.nim
include pkg/karax/prelude
[...]
proc render*(backend: bool): VNode =
  ## HTML Renderer for JS, allowed with events too!
  buildHtml(tdiv(id = "ROOT")):
    h1:
      text "Hello from " &
        (if backend: "backend" else: "frontend")
      proc onclick(ev: Event; n: VNode) =
        echo "clicked"
    script(src = "script/frontend.js")

```
```nim
# backend.nim (compile with: `nim c backend.js`)
include pkg/karax/prelude
import pkg/jester
import ./renderer

routes:
  get "/":
    resp $baseHtml render(true)
  get "/script/frontend.js":
    resp readFile "public/script/frontend.js"
```
```nim
# frontend.nim (compile with: `nim js frontend.js`)
include pkg/karax/prelude
import ./renderer

proc renderPage: VNode =
  render(false)

setRenderer renderPage
```
## License

This repository is libre, licensed over MIT.
