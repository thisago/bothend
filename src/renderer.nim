include pkg/karax/prelude

when not defined js:
  proc baseHtml*(bodyNode: VNode): VNode =
    buildHtml(html):
      head:
        title: text "Both-end"
        meta(name="viewport", content="width=device-width, initial-scale=1.0")
      body:
        bodyNode

proc render*(backend: bool): VNode =
  ## HTML Renderer for JS, allowed with events too!
  buildHtml(tdiv(id = "ROOT")):
    h1:
      text "Hello from " &
        (if backend: "backend" else: "frontend")
      proc onclick(ev: Event; n: VNode) =
        echo "clicked"
    script(src = "script/frontend.js")
