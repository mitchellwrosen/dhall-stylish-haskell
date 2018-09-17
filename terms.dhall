   let align            = constructors ./Align.dhall
in let empty-list-align = constructors ./EmptyListAlign.dhall
in let extension        = constructors ./Extension.dhall
in let list-align       = constructors ./ListAlign.dhall
in let list-padding     = constructors ./ListPadding.dhall
in let long-list-align  = constructors ./LongListAlign.dhall
in let newline          = constructors ./Newline.dhall
in let step             = constructors ./Step.dhall
in let style            = constructors ./Style.dhall
in

{ align =
    { file = align.file {=}
    , global = align.global {=}
    , group = align.group {=}
    , none = align.none {=}
    }

, empty-list-align =
    { inherit = empty-list-align.inherit {=}
    , right-after = empty-list-align.right-after {=}
    }

, extension =
    extension

, imports =
    \(imports : ./Imports.dhall) ->
      step.imports imports

, language-pragmas =
    \(language-pragmas : ./LanguagePragmas.dhall) ->
      step.language-pragmas language-pragmas

, list-align =
    { after-alias = list-align.after-alias {=}
    , new-line = list-align.new-line {=}
    , with-alias  = list-align.with-alias {=}
    }

, list-padding =
    { constant = \(n : Natural) -> list-padding.constant n
    , module-name = \(name : Text) -> list-padding.module-name name
    }

, long-list-align =
    { inline = long-list-align.inline {=}
    , multiline = long-list-align.multiline {=}
    , new-line = long-list-align.new-line {=}
    , new-line-multiline = long-list-align.new-line-multiline {=}
    }

, newline =
    { crlf = newline.crlf {=}
    , lf = newline.lf {=}
    , native = newline.native {=}
    }

, render =
    ./render.dhall

, simple-align =
    \(simple-align : ./SimpleAlign.dhall) ->
      step.simple-align simple-align

, style =
    { compact = style.compact {=}
    , compact-line = style.compact-line {=}
    , vertical = style.vertical {=}
    }

, trailing-whitespace =
    \(trailing-whitespace : Bool) ->
      step.trailing-whitespace trailing-whitespace
}
