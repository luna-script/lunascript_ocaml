open Lib
open Js_of_ocaml

let () =
  Js.export "jslib"
    (object%js
       method compile str = Js.string @@ Js_codegen.compile @@ Js.to_string str
    end)
