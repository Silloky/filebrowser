#!/bin/sh

go get github.com/jteeuwen/go-bindata/go-bindata
go get github.com/bountylabs/gitversion

go-bindata -pkg assets -prefix "_embed" \
  -o assets/binary.go -ignore "^.*theme-([^g]|g[^i]|gi[^t]|git[^h]|gith[^u]|githu[^b]).*\.js$" \
  _embed/templates/... _embed/public/js/... _embed/public/css/... _embed/public/ace/src-min/...

gitversion -s -o page/version.go -p page
git add -A
