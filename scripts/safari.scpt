#!/usr/bin/osascript

  
on run icommand
  tell application "Safari"
      activate
      set url of document 1 to "" & icommand
      delay 5

      set RESULT to do JavaScript "
        var result =  document.body.innerHTML;
        document.title = result;
      " in document 1

  End tell
end run
