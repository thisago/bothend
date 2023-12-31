when defined js:
  include pkg/karax/prelude
else:
  import pkg/karax/[
    karaxdsl,
    vdom,
  ]

when not defined js:
  proc baseHtml*(bodyNode: VNode): string =
    let vnode = buildHtml(html):
      head:
        title: text "Both-end"
        meta(name = "viewport", content = "width=device-width, initial-scale=1.0")
      body:
        bodyNode
        script(src = "script/frontend.js")
    result = $vnode

var rows = @["Static row, available in both ends"]

proc render*(backend: bool): VNode =
  ## HTML Renderer for JS, allowed with events too!
  buildHtml(tdiv(id = "ROOT")):
    h1:
      text "Hello from " &
        (if backend: "backend" else: "frontend")
      when defined js:
        proc onclick(ev: Event; n: VNode) =
          echo "clicked"
          rows.add "Frontend powers!"
    for row in rows:
      p: text row
