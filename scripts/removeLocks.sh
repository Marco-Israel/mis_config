#!/bin/bash

find -type f -name .*.swp -print0 | xargs -0 rm 2>/dev/zero
find -type f -name .*.swo -print0 | xargs -0 rm 2>/dev/zero
find -type f -name .*.lock -print0 | xargs -0 rm 2>/dev/zero
find -type f -name *.lock -print0 | xargs -0 rm 2>/dev/zero
