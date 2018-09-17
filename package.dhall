   let align            = constructors ./align.dhall
in let empty-list-align = constructors ./empty-list-align.dhall
in let list-align       = constructors ./list-align.dhall
in let list-padding     = constructors ./list-padding.dhall
in let long-list-align  = constructors ./long-list-align.dhall
in let newline          = constructors ./newline.dhall
in let step             = constructors ./step.dhall
in let style            = constructors ./style.dhall
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

, imports =
    \(imports : ./imports.dhall) ->
      step.imports imports

, language-pragmas =
    \(language-pragmas : ./language-pragmas.dhall) ->
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

, simple-align =
    \(simple-align : ./simple-align.dhall) ->
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
