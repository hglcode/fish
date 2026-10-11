# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_dp_global_optspecs
    string join \n format= h/help V/version
end

function __fish_dp_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_dp_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_dp_using_subcommand
    set -l cmd (__fish_dp_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c dp -n "__fish_dp_needs_command" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_needs_command" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_needs_command" -s V -l version -d 'Print version'
complete -c dp -n "__fish_dp_needs_command" -f -a "init" -d 'Initialize a dp database in this project (.dp/dp.db)'
complete -c dp -n "__fish_dp_needs_command" -f -a "adr" -d 'ADR (architecture decision record) operations'
complete -c dp -n "__fish_dp_needs_command" -f -a "plan" -d 'Plan (milestone) operations'
complete -c dp -n "__fish_dp_needs_command" -f -a "task" -d 'Task operations'
complete -c dp -n "__fish_dp_needs_command" -f -a "stats" -d 'Show project stats'
complete -c dp -n "__fish_dp_needs_command" -f -a "generate"
complete -c dp -n "__fish_dp_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand init" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand init" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -f -a "accept" -d 'Mark a proposed (or rejected) decision as accepted'
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -f -a "reject" -d 'Reject a proposed decision (may be re-accepted later — verdicts can be revisited)'
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -f -a "supersede" -d 'Mark an old decision as superseded by an accepted newer one'
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -f -a "show" -d 'Show one ADR in full, including rationale'
complete -c dp -n "__fish_dp_using_subcommand adr; and not __fish_seen_subcommand_from add list accept reject supersede show help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from add" -l context -d 'Background / problem statement' -r
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from add" -l decision -d 'The decision made' -r
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from add" -l consequence -d 'Consequences / follow-ups' -r
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from add" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from list" -s n -l limit -d 'Limit output to the first N decisions(ADRs) (after ordering)' -r
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from list" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from accept" -l rationale -d 'Review rationale recorded with the acceptance' -r
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from accept" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from accept" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from reject" -l rationale -d 'Review rationale recorded with the rejection' -r
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from reject" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from reject" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from supersede" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from supersede" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from show" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from help" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from help" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from help" -f -a "accept" -d 'Mark a proposed (or rejected) decision as accepted'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from help" -f -a "reject" -d 'Reject a proposed decision (may be re-accepted later — verdicts can be revisited)'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from help" -f -a "supersede" -d 'Mark an old decision as superseded by an accepted newer one'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show one ADR in full, including rationale'
complete -c dp -n "__fish_dp_using_subcommand adr; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show archive help" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show archive help" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show archive help" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show archive help" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show archive help" -f -a "show" -d 'Show a plan with its pending tasks and done count'
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show archive help" -f -a "archive" -d 'Mark a plan as Archived'
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show archive help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -l adr -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -l start -d 'Planned start date, YYYY-MM-DD (schedule window left edge)' -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -l due -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -s p -l priority -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -s d -l description -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from list" -s n -l limit -d 'Limit output to the first N plans (after ordering)' -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from list" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from show" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from archive" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from archive" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show a plan with its pending tasks and done count'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "archive" -d 'Mark a plan as Archived'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "add" -d 'Add a new task'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "list" -d 'List tasks'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "show" -d 'Show one task in description'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "search" -d 'Search tasks by text: title, description, status/resolution notes'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "start" -d 'Start working on a task: sets status active, records started_at'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "done" -d 'Mark a task as done'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "abandon" -d 'Abandon a task: done with resolution \'abandoned\' (excluded from output stats)'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "duplicate" -d 'Close a task as duplicate of another'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "rm" -d 'Delete a task'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "mod" -d 'Modify a task\'s fields'
complete -c dp -n "__fish_dp_using_subcommand task; and not __fish_seen_subcommand_from add list show search start done abandon duplicate rm mod help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from add" -l plan -d 'Attach to an existing plan id' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from add" -l due -d 'Due date, YYYY-MM-DD' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from add" -s p -l priority -d 'Priority: low/normal/high/urgent or 0/1/2/3' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from add" -l tag -d 'Comma-separated tags' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from add" -s d -l description -d 'Long description' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from add" -s t -l type -d 'Type: feature / bug / chore / refactor/docs' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from add" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from list" -l plan -d 'Filter by plan id' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from list" -s s -l status -d 'Filter by status: todo / active / blocked / done (default: pending)' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from list" -s t -l type -d 'Filter by task type: feature / bug / chore / refactor / docs' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from list" -s n -l limit -d 'Limit output to the first N tasks (after ordering)' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from list" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from list" -l overdue -d 'Show only overdue tasks'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from show" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from search" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from start" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from done" -l note -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from done" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from done" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from abandon" -l note -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from abandon" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from abandon" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from duplicate" -l note -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from duplicate" -l of -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from duplicate" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from duplicate" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from rm" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from rm" -s f -l force
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -l title -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -l due -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -s p -l priority -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -s s -l status -d 'todo / active / blocked / done' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -l note -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -l tag -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -s d -l description -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -s t -l type -d 'Type: feature / bug / chore / refactor / docs' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -l plan -d 'Reassign to another plan' -r
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from mod" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a new task'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "list" -d 'List tasks'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show one task in description'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search tasks by text: title, description, status/resolution notes'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "start" -d 'Start working on a task: sets status active, records started_at'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "done" -d 'Mark a task as done'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "abandon" -d 'Abandon a task: done with resolution \'abandoned\' (excluded from output stats)'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "duplicate" -d 'Close a task as duplicate of another'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "rm" -d 'Delete a task'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "mod" -d 'Modify a task\'s fields'
complete -c dp -n "__fish_dp_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand stats" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand stats" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand generate" -l format -d 'Output format: table, json, or markdown' -r -f -a "table\t''
json\t''
markdown\t''"
complete -c dp -n "__fish_dp_using_subcommand generate" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init adr plan task stats generate help" -f -a "init" -d 'Initialize a dp database in this project (.dp/dp.db)'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init adr plan task stats generate help" -f -a "adr" -d 'ADR (architecture decision record) operations'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init adr plan task stats generate help" -f -a "plan" -d 'Plan (milestone) operations'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init adr plan task stats generate help" -f -a "task" -d 'Task operations'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init adr plan task stats generate help" -f -a "stats" -d 'Show project stats'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init adr plan task stats generate help" -f -a "generate"
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init adr plan task stats generate help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from adr" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from adr" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from adr" -f -a "accept" -d 'Mark a proposed (or rejected) decision as accepted'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from adr" -f -a "reject" -d 'Reject a proposed decision (may be re-accepted later — verdicts can be revisited)'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from adr" -f -a "supersede" -d 'Mark an old decision as superseded by an accepted newer one'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from adr" -f -a "show" -d 'Show one ADR in full, including rationale'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from plan" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from plan" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from plan" -f -a "show" -d 'Show a plan with its pending tasks and done count'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from plan" -f -a "archive" -d 'Mark a plan as Archived'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "add" -d 'Add a new task'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "list" -d 'List tasks'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "show" -d 'Show one task in description'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "search" -d 'Search tasks by text: title, description, status/resolution notes'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "start" -d 'Start working on a task: sets status active, records started_at'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "done" -d 'Mark a task as done'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "abandon" -d 'Abandon a task: done with resolution \'abandoned\' (excluded from output stats)'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "duplicate" -d 'Close a task as duplicate of another'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "rm" -d 'Delete a task'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "mod" -d 'Modify a task\'s fields'
