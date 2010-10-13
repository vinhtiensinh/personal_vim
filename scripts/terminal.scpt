#!/usr/bin/osascript

on run icommand
  tell application "Terminal"
    activate
    do script " "  & icommand
  end tell 
end run
