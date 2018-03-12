#!/bin/bash
xbps=$(xbps-install -Mnu 2> /dev/null | wc -l)

echo "%{F#5b5b5b}%{F-} $xbps "
