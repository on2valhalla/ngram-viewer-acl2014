#!/bin/bash

# Remove commas and transpose.
sed 's/,//g' $1 | python -c "import sys; print('\n'.join(' '.join(c) for c in zip(*(l.split() for l in sys.stdin.readlines() if l.strip()))))" 