# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_dp_global_optspecs
    string join \n h/help V/version
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

complete -c dp -n "__fish_dp_needs_command" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_needs_command" -s V -l version -d 'Print version'
complete -c dp -n "__fish_dp_needs_command" -f -a "init" -d 'Initialize a dp database in this project (.dp/dp.db)'
complete -c dp -n "__fish_dp_needs_command" -f -a "add" -d 'Add a new todo task'
complete -c dp -n "__fish_dp_needs_command" -f -a "list" -d 'List todos'
complete -c dp -n "__fish_dp_needs_command" -f -a "show" -d 'Show one todo in detail'
complete -c dp -n "__fish_dp_needs_command" -f -a "done" -d 'Mark a todo as done'
complete -c dp -n "__fish_dp_needs_command" -f -a "rm" -d 'Delete a todo'
complete -c dp -n "__fish_dp_needs_command" -f -a "mod" -d 'Modify a todo\'s fields'
complete -c dp -n "__fish_dp_needs_command" -f -a "plan" -d 'Plan (milestone) operations'
complete -c dp -n "__fish_dp_needs_command" -f -a "decision" -d 'Decision record (ADR) operations'
complete -c dp -n "__fish_dp_needs_command" -f -a "stats" -d 'Show project stats'
complete -c dp -n "__fish_dp_needs_command" -f -a "generate" -d 'Generate shell completions, e.g. `dp generate bash > ~/.local/share/bash-completion/completions/dp`'
complete -c dp -n "__fish_dp_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand init" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand add" -l plan -d 'Attach to an existing plan id' -r
complete -c dp -n "__fish_dp_using_subcommand add" -l due -d 'Due date, YYYY-MM-DD' -r
complete -c dp -n "__fish_dp_using_subcommand add" -s p -l priority -d 'Priority: high / medium / low (or 1 / 2 / 3)' -r
complete -c dp -n "__fish_dp_using_subcommand add" -s t -l tags -d 'Comma-separated tags' -r
complete -c dp -n "__fish_dp_using_subcommand add" -l detail -d 'Long description' -r
complete -c dp -n "__fish_dp_using_subcommand add" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand list" -l plan -d 'Filter by plan id' -r
complete -c dp -n "__fish_dp_using_subcommand list" -l overdue -d 'Show only overdue tasks'
complete -c dp -n "__fish_dp_using_subcommand list" -l all -d 'Include in_progress and blocked (default: open only)'
complete -c dp -n "__fish_dp_using_subcommand list" -l done -d 'Show only completed tasks'
complete -c dp -n "__fish_dp_using_subcommand list" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand show" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand done" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand rm" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand mod" -l title -r
complete -c dp -n "__fish_dp_using_subcommand mod" -l due -r
complete -c dp -n "__fish_dp_using_subcommand mod" -l priority -r
complete -c dp -n "__fish_dp_using_subcommand mod" -l status -d 'open / in_progress / blocked / done' -r
complete -c dp -n "__fish_dp_using_subcommand mod" -l tags -r
complete -c dp -n "__fish_dp_using_subcommand mod" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show done help" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show done help" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show done help" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show done help" -f -a "show" -d 'Show a plan with its open todos and done count'
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show done help" -f -a "done" -d 'Mark a plan as done'
complete -c dp -n "__fish_dp_using_subcommand plan; and not __fish_seen_subcommand_from add list show done help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -l due -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -s p -l priority -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -l description -r
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from done" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show a plan with its open todos and done count'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "done" -d 'Mark a plan as done'
complete -c dp -n "__fish_dp_using_subcommand plan; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand decision; and not __fish_seen_subcommand_from add list accept supersede help" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand decision; and not __fish_seen_subcommand_from add list accept supersede help" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand decision; and not __fish_seen_subcommand_from add list accept supersede help" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand decision; and not __fish_seen_subcommand_from add list accept supersede help" -f -a "accept" -d 'Mark a decision as accepted'
complete -c dp -n "__fish_dp_using_subcommand decision; and not __fish_seen_subcommand_from add list accept supersede help" -f -a "supersede" -d 'Mark an old decision as superseded by an accepted newer one'
complete -c dp -n "__fish_dp_using_subcommand decision; and not __fish_seen_subcommand_from add list accept supersede help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from add" -l context -d 'Background / problem statement' -r
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from add" -l decision -d 'The decision made' -r
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from add" -l consequence -d 'Consequences / follow-ups' -r
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from accept" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from supersede" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from help" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from help" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from help" -f -a "accept" -d 'Mark a decision as accepted'
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from help" -f -a "supersede" -d 'Mark an old decision as superseded by an accepted newer one'
complete -c dp -n "__fish_dp_using_subcommand decision; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand stats" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand generate" -s h -l help -d 'Print help'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "init" -d 'Initialize a dp database in this project (.dp/dp.db)'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "add" -d 'Add a new todo task'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "list" -d 'List todos'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "show" -d 'Show one todo in detail'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "done" -d 'Mark a todo as done'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "rm" -d 'Delete a todo'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "mod" -d 'Modify a todo\'s fields'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "plan" -d 'Plan (milestone) operations'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "decision" -d 'Decision record (ADR) operations'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "stats" -d 'Show project stats'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "generate" -d 'Generate shell completions, e.g. `dp generate bash > ~/.local/share/bash-completion/completions/dp`'
complete -c dp -n "__fish_dp_using_subcommand help; and not __fish_seen_subcommand_from init add list show done rm mod plan decision stats generate help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from plan" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from plan" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from plan" -f -a "show" -d 'Show a plan with its open todos and done count'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from plan" -f -a "done" -d 'Mark a plan as done'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from decision" -f -a "add"
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from decision" -f -a "list"
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from decision" -f -a "accept" -d 'Mark a decision as accepted'
complete -c dp -n "__fish_dp_using_subcommand help; and __fish_seen_subcommand_from decision" -f -a "supersede" -d 'Mark an old decision as superseded by an accepted newer one'
