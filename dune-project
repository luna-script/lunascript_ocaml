(lang dune 3.1)

(using menhir 2.0)

(name lunascript_ocaml)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name lunascript_ocaml)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune menhir)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
