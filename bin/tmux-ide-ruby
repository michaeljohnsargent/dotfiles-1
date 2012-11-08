#! /usr/bin/env sh

me=`basename $0`
case $@ in
  "--help"|"-h" )
    echo Usage:
    echo "  $me"
    exit
    ;;
  "" )
    ;;
  * )
    echo Arguments '"'$@'"' not recognized
    echo Try:
    echo "  $me --help"
    exit
    ;;
esac

echo Setting up tmux IDE for Ruby

bundler=''
bundle check >/dev/null 2>&1
case $? in
  # Exit code 0: bundle is defined and installed
  # Exit code 1: bundle is defined but not installed
  0|1 )
    echo "* Detected Bundler configuration"
    bundler=true
    ;;
esac

command_prefix=""
if [ $bundler ]; then
  command_prefix="bundle exec"
fi

code_test_window_name='code/test'
web_server_window_name='web-server'
repl_window_name='REPL'

session_name=`basename $(pwd)`
tmux_cmd="tmux -S /var/tmux/$session_name"

$tmux_cmd new-session -s $session_name -d

vim_pane_id=`$tmux_cmd list-panes -F "#{pane_active} #{pane_id}" | sed -n -e '/^1 /s/^1 %\([0-9]*\)$/\1/gp'`

$tmux_cmd rename-window -t "%$vim_pane_id" $code_test_window_name

$tmux_cmd send-keys -t "%$vim_pane_id" 'vim .' C-m

$tmux_cmd split-window -h -p 40 -t "%$vim_pane_id"
tests_pane_id=`$tmux_cmd list-panes -F "#{pane_active} #{pane_id}" | sed -n -e '/^1 /s/^1 %\([0-9]*\)$/\1/gp'`

guard show >/dev/null 2>&1

if [ $? = 0 ]; then
  echo "* Detected Guard configuration"
  $tmux_cmd send-keys -t "%$tests_pane_id" "$command_prefix guard --clear" C-m
  $tmux_cmd split-window -v -p 40 -t "%$tests_pane_id"
fi

if [ -d app ] && [ -d config ] && [ -d db ]; then
  echo "* Detected Rails project"
  $tmux_cmd new-window -t $session_name -n $web_server_window_name
  web_server_pane_id=`$tmux_cmd list-panes -F "#{pane_active} #{pane_id}" | sed -n -e '/^1 /s/^1 %\([0-9]*\)$/\1/gp'`
  $tmux_cmd send-keys -t "%$web_server_pane_id" "$command_prefix `if [ -f script/server ]; then echo 'script/'; else echo 'rails '; fi`server" C-m

  $tmux_cmd new-window -t $session_name -n $repl_window_name
  repl_pane_id=`$tmux_cmd list-panes -F "#{pane_active} #{pane_id}" | sed -n -e '/^1 /s/^1 %\([0-9]*\)$/\1/gp'`
  $tmux_cmd send-keys -t "%$repl_pane_id" "$command_prefix `if [ -f script/console ]; then echo 'script/'; else echo 'rails '; fi`console" C-m
else
  $tmux_cmd new-window -t $session_name -n $repl_window_name
  repl_pane_id=`$tmux_cmd list-panes -F "#{pane_active} #{pane_id}" | sed -n -e '/^1 /s/^1 %\([0-9]*\)$/\1/gp'`
  if [ $bundler ]; then
    $tmux_cmd send-keys -t "%$repl_pane_id" "bundle console" C-m
  else
    $tmux_cmd send-keys -t "%$repl_pane_id" "irb" C-m
  fi
fi

$tmux_cmd select-window -t $code_test_window_name
$tmux_cmd select-pane -t "%$vim_pane_id"

$tmux_cmd attach-session -t $session_name
