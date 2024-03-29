-module (web_comet1).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).

main() ->
       web_common:assert_path( "jqm.html" ).

title() ->
     "Simple Comet".

layout() ->
     
    Body = [
        #span { text="Counter updated via Comet: " },
        #span { id=myCounter, text="-" }
	   ],
        
    wf:comet(fun() ->
		     background_update(myCounter, 1) end),
        Body.

event(_) ->
     ok.

background_update(ControlID, Count) ->
    
    % Sleep for a second, then update
    timer:sleep(1000),
    
    % Update the control.
    wf:update(ControlID, wf:to_list(Count)),
    
    % wf:comet_flush() is only needed because we are looping. Otherwise,
    % we could just let the function complete.
    wf:flush(),
    
    % Loop. This process will automatically be killed
    % once the page stops requesting the output that
    % it generates.
    background_update(ControlID, Count + 1).
