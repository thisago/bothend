import pkg/karax
import pkg/jester

routes:
  get "/":
    resp h1("Hello world")
