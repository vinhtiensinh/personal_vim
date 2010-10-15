#!/usr/bin/osascript

on run icommand
  tell application "Terminal"
    activate
    do script " "  & icommand in front window
  end tell 
end run
