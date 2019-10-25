#!/bin/bash
UPDATES=$(apt-get -s -o Debug::NoLocking=true upgrade | grep ^Inst | wc -l)

echo " $UPDATES"
