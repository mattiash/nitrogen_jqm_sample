-module (web_index).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).
            
main() ->
       web_common:assert_path( "jqm.html" ).

title() -> "Nitrogen Web Framework for Erlang".

layout() ->
    [
     #list { numbered=false, data_role="listview", data_inset="true",
       body=[
	 #listitem { data_role="list-divider",
		     role="heading", text="List divider" },
	 #listitem { data_theme="c", body= [
	   #link { id=page1, url='/page1', text="Form test" }
					   ] },
	 #listitem { data_theme="c", body= [
	   #link { id=page1, url='/comet1', text="Comet 1" }
					   ] }
     ] }
    ].
