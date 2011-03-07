#!/usr/bin/osascript

on run icommand
  tell application "Safari"
      activate
      set url of document 1 to "" & icommand
  end tell
end run

