#!/bin/sh
# Show the state of a Claude Code session on its tmux window tab.
#
# Claude hooks (in ~/.claude/settings.json) call this with one argument:
#   working - Claude is busy
#   waiting - Claude needs you (permission prompt or a question)
#   done    - Claude finished its answer
#   clear   - the session ended
#
# The state is stored in the window option @claude_state, and ~/.tmux.conf
# turns it into a marker on the tab. It is a window option (not a pane option)
# because the tab only sees the window's active pane, which may be a shell.
#
# No hook runs when you press Esc, so after an interrupt the marker stays
# until you send the next prompt.

# Not running inside tmux: nothing to show.
[ -n "$TMUX_PANE" ] || exit 0

state=$1

# If you are already looking at this window, there is no need for a "done"
# marker. The tmux hook only clears it when you switch to a window.
if [ "$state" = done ] &&
  [ "$(tmux display -p -t "$TMUX_PANE" '#{&&:#{window_active},#{session_attached}}')" = 1 ]; then
  state=clear
fi

if [ "$state" = clear ]; then
  tmux set -wu -t "$TMUX_PANE" @claude_state
else
  tmux set -w -t "$TMUX_PANE" @claude_state "$state"
fi
