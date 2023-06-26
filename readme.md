<div align="center">

# **both-end**
#### Render your HTML in both ends!

<br>

[License](#license)
</div>

[**renderer.nim**](src/renderer.nim)
```nim
include pkg/karax/prelude
[...]

var rows = @["Static row, available in both ends"]

proc render*(backend: bool): VNode =
  ## HTML Renderer for JS, allowed with events too!
  buildHtml(tdiv(id = "ROOT")):
    h1:
      text "Hello from " &
        (if backend: "backend" else: "frontend")
      proc onclick(ev: Event; n: VNode) =
        echo "clicked"
        rows.add "Frontend powers!"
    for row in rows:
      p: text row
    script(src = "script/frontend.js")
```

[**backend.nim**](src/backend.nim)
```nim
# compile with: `nimble build_release`
import pkg/jester
import ./renderer

routes:
  get "/":
    resp baseHtml render(backend = true)
  get "/script/frontend.js":
    resp readFile "public/script/frontend.js"
```

[**frontend.nim**](src/frontend.nim)
```nim
# compile with: `nimble build_js_release`
include pkg/karax/prelude
import ./renderer

proc renderPage: VNode =
  render(backend = false)

setRenderer renderPage
```
## License

This repository is libre, licensed over MIT.
