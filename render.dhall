   let prelude =
         https://raw.githubusercontent.com/dhall-lang/Prelude/v2.0.0/package.dhall
           sha256:4de4adaa8b63ec74998dbb2f3c09bc22f6ed85434d8e747b0b99805f5d2b8953

in let step-output =
         constructors ./step-output.dhall

in

\(input : ./stylish-haskell.dhall) ->

  { columns = input.columns
  , language_extensions = input.language-extensions
  , newline =
      merge
      { crlf = \(_ : {}) -> "crlf"
      , lf = \(_ : {}) -> "lf"
      , native = \(_ : {}) -> "native"
      }
      input.newline
  , steps =
      prelude.`List`.map
        ./step.dhall
        ./step-output.dhall
        (\(step : ./step.dhall) ->
          merge
          { imports =
              \(imports : ./imports.dhall) ->
                step-output.imports
                  { imports =
                      { align =
                          merge
                          { file = \(_ : {}) -> "file"
                          , global = \(_ : {}) -> "global"
                          , group = \(_ : {}) -> "group"
                          , none = \(_ : {}) -> "none"
                          }
                          imports.align
                      , empty_list_align =
                          merge
                          { inherit = \(_ : {}) -> "inherit"
                          , right-after = \(_ : {}) -> "right_after"
                          }
                          imports.empty-list-align
                      , list_align =
                          merge
                          { after-alias = \(_ : {}) -> "after_alias"
                          , new-line = \(_ : {}) -> "new_line"
                          , with-alias = \(_ : {}) -> "with_alias"
                          }
                          imports.list-align
                      , list_padding = imports.list-padding
                      , long_list_align =
                          merge
                          { inline = \(_ : {}) -> "inline"
                          , multiline = \(_ : {}) -> "multiline"
                          , new-line = \(_ : {}) -> "new_line"
                          , new-line-multiline = \(_ : {}) -> "new_line_multiline"
                          }
                          imports.long-list-align
                      , pad_module_names = imports.pad-module-names
                      , separate_lists = imports.separate-lists
                      , space_surround = imports.space-surround
                      }
                  }
          , language-pragmas =
              \(language-pragmas : ./language-pragmas.dhall) ->
                step-output.language_pragmas
                  { language_pragmas =
                      { align = language-pragmas.align
                      , remove_redundant = language-pragmas.remove-redundant
                      , style =
                          merge
                          { compact = \(_ : {}) -> "compact"
                          , compact-line = \(_ : {}) -> "compact_line"
                          , vertical = \(_ : {}) -> "vertical"
                          }
                          language-pragmas.style
                      }
                  }
          , simple-align =
              \(simple-align : ./simple-align.dhall) ->
                step-output.simple_align
                  { simple_align =
                      { cases = simple-align.cases
                      , records = simple-align.records
                      , top_level_patterns = simple-align.top-level-patterns
                      }
                  }
          , squash =
              \(squash : Bool) ->
                step-output.squash
                  (if squash
                    then
                      [{squash = {=}}]
                        : Optional { squash : {} }
                    else
                      []
                        : Optional { squash : {} })
          , tabs =
              \(tabs : Optional Natural) ->
                step-output.tabs
                  (prelude.`Optional`.map
                    Natural
                    { tabs : { spaces : Natural } }
                    (\(n : Natural) ->
                      { tabs = { spaces = n } })
                    tabs)
          , trailing-whitespace =
              \(trailing-whitespace : Bool) ->
                step-output.trailing_whitespace
                  (if trailing-whitespace
                    then
                      [{trailing_whitespace = {=}}]
                        : Optional { trailing_whitespace : {} }
                    else
                      []
                        : Optional { trailing_whitespace : {} })
          }
          step)
        input.steps
  }
