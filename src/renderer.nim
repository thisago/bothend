include pkg/karax/prelude

when not defined js:
  proc baseHtml*(bodyNode: VNode): string =
    let vnode = buildHtml(html):
      head:
        title: text "Both-end"
        meta(name="viewport", content="width=device-width, initial-scale=1.0")
      body:
        bodyNode
    result = $vnode

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
