## dhall-stylish-haskell

Dhall expressions for generating a `.stylish-haskell.yaml` file.

To use: copy the Dhall file below to `stylish-haskell.dhall`, tweak it, and
generate `.stylish-haskell.yaml` with

    dhall-to-yaml <<< ./stylish-haskell.dhall > .stylish-haskell.yaml

To see the full schema, run

    dhall <<< 'https://raw.githubusercontent.com/mitchellwrosen/dhall-stylish-haskell/0.9.2.0/StylishHaskell.dhall'

and poke through [terms.dhall](./terms.dhall) to see what syntactic improvements
are available.

### Copy me

```dhall
   let p = https://raw.githubusercontent.com/mitchellwrosen/dhall-stylish-haskell/0.9.2.0/terms.dhall
             sha256:2d357a2be9ef62e607002324cf9790773f9d9a27367c5001e1f40356613d3c9f
in let P = https://raw.githubusercontent.com/mitchellwrosen/dhall-stylish-haskell/0.9.2.0/types.dhall
             sha256:662ff742918cefe0013b5a71a78f7831f0049b0a53dab3e5fa1aeff6966b1b92
in

p.render
  { steps =
      [ p.simple-align
          { cases = True
          , records = True
          , top-level-patterns = True
          }
      , p.imports
          { align = p.align.global
          , empty-list-align = p.empty-list-align.inherit
          , list-align = p.list-align.after-alias
          , list-padding = p.list-padding.constant 4
          , long-list-align = p.long-list-align.inline
          , pad-module-names = True
          , separate-lists = True
          , space-surround = False
          }
      , p.language-pragmas
          { align = True
          , remove-redundant = True
          , style = p.style.vertical
          }
      , p.trailing-whitespace True
      ]
  , columns = 80
  , newline = p.newline.native
  , language-extensions = [] : List P.Extension
  }
```
