#!/bin/bash

report=~/report
at -f script1.sh now +1 minutes
(tail -f "$report")