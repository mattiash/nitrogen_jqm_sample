-module (web_index).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).
            
main() ->
       web_common:assert_path( "jqm.html" ).

title() -> "Nitrogen Web Framework for Erlang".

layout() ->
    [
     #literal { text="<ul data-role='listview' data-inset='true'>",
                html_encode=false},
     #literal { 
       text="<li data-role='list-divider' role='heading'>List divider</li>",
       html_encode=false },
     #literal { text="<li data-theme='c'>", html_encode=false },
     #link { id=page1, url='/page1', text="Page 1" },
     #literal { text="</li>", html_encode=false },
     #literal { text="</ul>", html_encode=false }
    ].
