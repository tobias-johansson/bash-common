#!/bin/bash

# Get script directory and include common.sh
DIR=$(cd "$(dirname "$BASH_SOURCE")" && pwd)
. $DIR/common.sh

# Require some environment variables to be set
vars SOME_ENVVAR ANOTHER_ENVVAR

log "== vars:"
log "SOME_ENVVAR is '$SOME_ENVVAR'"
show ANOTHER_ENVVAR
log ""

# Read arguments. Two are required, a third is optional
args name origin age? -- $@

log "== args:"
show name
show origin
show age
log ""

# Map names to integers. Earth -> 1, Space -> 2
origin_code=$(enum 1 origin 'Earth' 'Space')

show origin_code
log ""
