-module (web_page1).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).
            
main() ->
       web_common:assert_path( "jqm.html" ).

title() -> "Nitrogen Web Framework for Erlang".

layout() ->
    [
     #h1 { text="My Simple Application" },
     #label { text="What is your name?" },
     #textbox { },
     #button { text="Submit", postback=submit }
    ].

event(submit) ->
    io:format( "Hello~n" ).
