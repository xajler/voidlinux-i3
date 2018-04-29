#!/bin/bash
xbps=$(xbps-install -Mnu 2> /dev/null | wc -l)

echo " $xbps "
