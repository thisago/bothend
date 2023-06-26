include pkg/karax/prelude
import pkg/jester
import ./renderer

routes:
  get "/":
    resp $baseHtml render(true)
  get "/script/frontend.js":
    resp readFile "public/script/frontend.js"
