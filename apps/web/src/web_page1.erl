-module (web_page1).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).
            
main() ->
       web_common:assert_path( "jqm.html" ).

title() -> "Nitrogen Web Framework for Erlang".

layout() ->
    [
     #h1 { text="My Simple Application" },
     #panel { data_role="fieldcontain", body=[
       #label { for="f1", text="Text input:" },
       #literal { text="<input type='text' id='f1' value='' />",
		  html_encode=false }
       ] },

     #panel { data_role="fieldcontain", body=[
       #label { for="f2", text="Flip switch:" },
       #dropdown { id=f2, html_id="f2", data_role="slider",
		   options= [
                     #option { text="Off", value='off' },
                     #option { text="On", value='on', selected=true }
                   ], postback={set, "f2"} },
 
     #panel { data_role="fieldcontain", body=[
       #label { for="f3", text="Slider:" },
       #literal { text="<input type='range' id='f3' value='0' min='0' max='100'/>", html_encode=false }
     ] },

     #button { text="Submit", postback=submit }
    ] 
  }].

event(_Arg) ->
    io:format( "event( ~p )~n", [_Arg] ).
