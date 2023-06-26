import pkg/jester
import ./renderer

routes:
  get "/":
    resp baseHtml render(backend = true)
  get "/script/frontend.js":
    resp readFile "public/script/frontend.js"
