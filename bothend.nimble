# Package

version       = "0.1.0"
author        = "Thiago Navarro"
description   = "Karax model in both ends (back and front)"
license       = "MIT"
srcDir        = "src"
bin           = @["backend", "frontend"]
binDir = "build"


# Dependencies

requires "nim >= 1.9.1"
requires "karax"
requires "jester"

task buildJs, "Builds the frontend":
  exec "nim js --out:public/script/frontend.js src/frontend"
  
task buildJsRelease, "Builds the frontend":
  exec "nim js --out:public/script/frontend.js -d:release src/frontend"

task buildRelease, "Builds the frontend":
  exec "nimble build -d:release"
