# bash-common

Tiny set of useful bash functions

## Logging etc.
```bash
log "a message"

err "an error message"

die "shows this and then quits"

show SOME_VARIABLE_TO_PRINT
```

## Input
```bash
vars THESE ARE_NOW REQUIRED ENV_VARS

args these_variables are_bound_to command_line arguments in_order -- $@
```
