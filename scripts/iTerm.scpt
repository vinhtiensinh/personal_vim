#!/usr/bin/osascript

on run icommand
  tell application "iTerm"
    activate

    set myterm to (make new terminal)

    tell myterm
      set mysession to (make new session at the end of sessions)
      tell mysession
        exec command "/bin/bash"
        write text " " & icommand 
      end tell
    end tell

  end tell
end run
