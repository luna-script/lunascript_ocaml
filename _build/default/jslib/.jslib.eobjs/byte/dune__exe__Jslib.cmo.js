(function(globalThis)
   {"use strict";
    var runtime=globalThis.jsoo_runtime;
    function caml_call1(f,a0)
     {return f.length == 1?f(a0):runtime.caml_call_gen(f,[a0])}
    function caml_call2(f,a0,a1)
     {return f.length == 2?f(a0,a1):runtime.caml_call_gen(f,[a0,a1])}
    var
     global_data=runtime.caml_get_global_data(),
     cst_jslib=runtime.caml_string_of_jsbytes("jslib"),
     Lib_Js_codegen=global_data.Lib__Js_codegen,
     Js_of_ocaml_Js=global_data.Js_of_ocaml__Js;
    function t1(param,str)
     {var _a_=runtime.caml_string_of_jsstring(str);
      return runtime.caml_jsstring_of_string
              (caml_call1(Lib_Js_codegen[3],_a_))}
    caml_call2
     (Js_of_ocaml_Js[46],
      cst_jslib,
      {"compile":runtime.caml_js_wrap_meth_callback(t1)});
    var Dune_exe_Jslib=[0];
    runtime.caml_register_global(8,Dune_exe_Jslib,"Dune__exe__Jslib");
    return}
  (globalThis));

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLjAsImZpbGUiOiIuanNsaWIuZW9ianMvYnl0ZS9kdW5lX19leGVfX0pzbGliLmNtby5qcyIsInNvdXJjZVJvb3QiOiIiLCJuYW1lcyI6WyJzdHIiXSwic291cmNlcyI6WyIvd29ya3NwYWNlX3Jvb3QvanNsaWIvanNsaWIubWwiXSwibWFwcGluZ3MiOiI7O0k7Ozs7Ozs7Ozs7c0JBTXNCQTtNQUF5Qyx3Q0FBekNBO01BQXlEO2VBQXRDLGtDQUFzQztJQUY3RTs7Ozs7O1UiLCJzb3VyY2VzQ29udGVudCI6WyJvcGVuIExpYlxub3BlbiBKc19vZl9vY2FtbFxuXG5sZXQgKCkgPVxuICBKcy5leHBvcnQgXCJqc2xpYlwiXG4gICAgKG9iamVjdCVqc1xuICAgICAgIG1ldGhvZCBjb21waWxlIHN0ciA9IEpzLnN0cmluZyBAQCBKc19jb2RlZ2VuLmNvbXBpbGUgQEAgSnMudG9fc3RyaW5nIHN0clxuICAgIGVuZClcbiJdfQ==
