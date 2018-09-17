   let step-output =
         constructors ./StepOutput.dhall

in let render-extension =
         \(name : Text) -> \(enabled : Bool) ->
           if enabled
             then name
             else "No" ++ name

in

\(input : ./StylishHaskell.dhall) ->

  { columns = input.columns
  , language_extensions =
      (./prelude.dhall).`List`.map
        ./Extension.dhall
        Text
        (\(extension : ./Extension.dhall) ->
          merge
          { AllowAmbiguousTypes        = \(enabled : Bool) -> render-extension "AllowAmbiguousTypes"        enabled
          , ApplicativeDo              = \(enabled : Bool) -> render-extension "ApplicativeDo"              enabled
          , Arrows                     = \(enabled : Bool) -> render-extension "Arrows"                     enabled
          , AutoDeriveTypeable         = \(enabled : Bool) -> render-extension "AutoDeriveTypeable"         enabled
          , BangPatterns               = \(enabled : Bool) -> render-extension "BangPatterns"               enabled
          , BinaryLiterals             = \(enabled : Bool) -> render-extension "BinaryLiterals"             enabled
          , CApiFFI                    = \(enabled : Bool) -> render-extension "CApiFFI"                    enabled
          , CPP                        = \(enabled : Bool) -> render-extension "CPP"                        enabled
          , ConstrainedClassMethods    = \(enabled : Bool) -> render-extension "ConstrainedClassMethods"    enabled
          , ConstraintKinds            = \(enabled : Bool) -> render-extension "ConstraintKinds"            enabled
          , DataKinds                  = \(enabled : Bool) -> render-extension "DataKinds"                  enabled
          , DatatypeContexts           = \(enabled : Bool) -> render-extension "DatatypeContexts"           enabled
          , DefaultSignatures          = \(enabled : Bool) -> render-extension "DefaultSignatures"          enabled
          , DeriveAnyClass             = \(enabled : Bool) -> render-extension "DeriveAnyClass"             enabled
          , DeriveDataTypeable         = \(enabled : Bool) -> render-extension "DeriveDataTypeable"         enabled
          , DeriveFoldable             = \(enabled : Bool) -> render-extension "DeriveFoldable"             enabled
          , DeriveFunctor              = \(enabled : Bool) -> render-extension "DeriveFunctor"              enabled
          , DeriveGeneric              = \(enabled : Bool) -> render-extension "DeriveGeneric"              enabled
          , DeriveLift                 = \(enabled : Bool) -> render-extension "DeriveLift"                 enabled
          , DeriveTraversable          = \(enabled : Bool) -> render-extension "DeriveTraversable"          enabled
          , DerivingStrategies         = \(enabled : Bool) -> render-extension "DerivingStrategies"         enabled
          , DisambiguateRecordFields   = \(enabled : Bool) -> render-extension "DisambiguateRecordFields"   enabled
          , DoAndIfThenElse            = \(enabled : Bool) -> render-extension "DoAndIfThenElse"            enabled
          , DoRec                      = \(enabled : Bool) -> render-extension "DoRec"                      enabled
          , DuplicateRecordFields      = \(enabled : Bool) -> render-extension "DuplicateRecordFields"      enabled
          , EmptyCase                  = \(enabled : Bool) -> render-extension "EmptyCase"                  enabled
          , EmptyDataDecls             = \(enabled : Bool) -> render-extension "EmptyDataDecls"             enabled
          , ExistentialQuantification  = \(enabled : Bool) -> render-extension "ExistentialQuantification"  enabled
          , ExplicitForAll             = \(enabled : Bool) -> render-extension "ExplicitForAll"             enabled
          , ExplicitNamespaces         = \(enabled : Bool) -> render-extension "ExplicitNamespaces"         enabled
          , ExtendedDefaultRules       = \(enabled : Bool) -> render-extension "ExtendedDefaultRules"       enabled
          , ExtensibleRecords          = \(enabled : Bool) -> render-extension "ExtensibleRecords"          enabled
          , FlexibleContexts           = \(enabled : Bool) -> render-extension "FlexibleContexts"           enabled
          , FlexibleInstances          = \(enabled : Bool) -> render-extension "FlexibleInstances"          enabled
          , ForeignFunctionInterface   = \(enabled : Bool) -> render-extension "ForeignFunctionInterface"   enabled
          , FunctionalDependencies     = \(enabled : Bool) -> render-extension "FunctionalDependencies"     enabled
          , GADTSyntax                 = \(enabled : Bool) -> render-extension "GADTSyntax"                 enabled
          , GADTs                      = \(enabled : Bool) -> render-extension "GADTs"                      enabled
          , GHCForeignImportPrim       = \(enabled : Bool) -> render-extension "GHCForeignImportPrim"       enabled
          , GeneralizedNewtypeDeriving = \(enabled : Bool) -> render-extension "GeneralizedNewtypeDeriving" enabled
          , Generics                   = \(enabled : Bool) -> render-extension "Generics"                   enabled
          , HereDocuments              = \(enabled : Bool) -> render-extension "HereDocuments"              enabled
          , HexFloatLiterals           = \(enabled : Bool) -> render-extension "HexFloatLiterals"           enabled
          , ImplicitParams             = \(enabled : Bool) -> render-extension "ImplicitParams"             enabled
          , ImplicitPrelude            = \(enabled : Bool) -> render-extension "ImplicitPrelude"            enabled
          , ImpredicativeTypes         = \(enabled : Bool) -> render-extension "ImpredicativeTypes"         enabled
          , IncoherentInstances        = \(enabled : Bool) -> render-extension "IncoherentInstances"        enabled
          , InstanceSigs               = \(enabled : Bool) -> render-extension "InstanceSigs"               enabled
          , InterruptibleFFI           = \(enabled : Bool) -> render-extension "InterruptibleFFI"           enabled
          , JavaScriptFFI              = \(enabled : Bool) -> render-extension "JavaScriptFFI"              enabled
          , KindSignatures             = \(enabled : Bool) -> render-extension "KindSignatures"             enabled
          , LambdaCase                 = \(enabled : Bool) -> render-extension "LambdaCase"                 enabled
          , LiberalTypeSynonyms        = \(enabled : Bool) -> render-extension "LiberalTypeSynonyms"        enabled
          , MagicHash                  = \(enabled : Bool) -> render-extension "MagicHash"                  enabled
          , MonadComprehensions        = \(enabled : Bool) -> render-extension "MonadComprehensions"        enabled
          , MonadFailDesugaring        = \(enabled : Bool) -> render-extension "MonadFailDesugaring"        enabled
          , MonoLocalBinds             = \(enabled : Bool) -> render-extension "MonoLocalBinds"             enabled
          , MonoPatBinds               = \(enabled : Bool) -> render-extension "MonoPatBinds"               enabled
          , MonomorphismRestriction    = \(enabled : Bool) -> render-extension "MonomorphismRestriction"    enabled
          , MultiParamTypeClasses      = \(enabled : Bool) -> render-extension "MultiParamTypeClasses"      enabled
          , MultiWayIf                 = \(enabled : Bool) -> render-extension "MultiWayIf"                 enabled
          , NPlusKPatterns             = \(enabled : Bool) -> render-extension "NPlusKPatterns"             enabled
          , NamedFieldPuns             = \(enabled : Bool) -> render-extension "NamedFieldPuns"             enabled
          , NamedWildCards             = \(enabled : Bool) -> render-extension "NamedWildCards"             enabled
          , NegativeLiterals           = \(enabled : Bool) -> render-extension "NegativeLiterals"           enabled
          , NewQualifiedOperators      = \(enabled : Bool) -> render-extension "NewQualifiedOperators"      enabled
          , NondecreasingIndentation   = \(enabled : Bool) -> render-extension "NondecreasingIndentation"   enabled
          , NullaryTypeClasses         = \(enabled : Bool) -> render-extension "NullaryTypeClasses"         enabled
          , NumDecimals                = \(enabled : Bool) -> render-extension "NumDecimals"                enabled
          , OverlappingInstances       = \(enabled : Bool) -> render-extension "OverlappingInstances"       enabled
          , OverloadedLabels           = \(enabled : Bool) -> render-extension "OverloadedLabels"           enabled
          , OverloadedLists            = \(enabled : Bool) -> render-extension "OverloadedLists"            enabled
          , OverloadedStrings          = \(enabled : Bool) -> render-extension "OverloadedStrings"          enabled
          , PackageImports             = \(enabled : Bool) -> render-extension "PackageImports"             enabled
          , ParallelArrays             = \(enabled : Bool) -> render-extension "ParallelArrays"             enabled
          , ParallelListComp           = \(enabled : Bool) -> render-extension "ParallelListComp"           enabled
          , PartialTypeSignatures      = \(enabled : Bool) -> render-extension "PartialTypeSignatures"      enabled
          , PatternGuards              = \(enabled : Bool) -> render-extension "PatternGuards"              enabled
          , PatternSignatures          = \(enabled : Bool) -> render-extension "PatternSignatures"          enabled
          , PatternSynonyms            = \(enabled : Bool) -> render-extension "PatternSynonyms"            enabled
          , PolyKinds                  = \(enabled : Bool) -> render-extension "PolyKinds"                  enabled
          , PolymorphicComponents      = \(enabled : Bool) -> render-extension "PolymorphicComponents"      enabled
          , PostfixOperators           = \(enabled : Bool) -> render-extension "PostfixOperators"           enabled
          , QuasiQuotes                = \(enabled : Bool) -> render-extension "QuasiQuotes"                enabled
          , Rank2Types                 = \(enabled : Bool) -> render-extension "Rank2Types"                 enabled
          , RankNTypes                 = \(enabled : Bool) -> render-extension "RankNTypes"                 enabled
          , RebindableSyntax           = \(enabled : Bool) -> render-extension "RebindableSyntax"           enabled
          , RecordPuns                 = \(enabled : Bool) -> render-extension "RecordPuns"                 enabled
          , RecordWildCards            = \(enabled : Bool) -> render-extension "RecordWildCards"            enabled
          , RecursiveDo                = \(enabled : Bool) -> render-extension "RecursiveDo"                enabled
          , RegularPatterns            = \(enabled : Bool) -> render-extension "RegularPatterns"            enabled
          , RelaxedPolyRec             = \(enabled : Bool) -> render-extension "RelaxedPolyRec"             enabled
          , RestrictedTypeSynonyms     = \(enabled : Bool) -> render-extension "RestrictedTypeSynonyms"     enabled
          , RoleAnnotations            = \(enabled : Bool) -> render-extension "RoleAnnotations"            enabled
          , Safe                       = \(enabled : Bool) -> render-extension "Safe"                       enabled
          , SafeImports                = \(enabled : Bool) -> render-extension "SafeImports"                enabled
          , ScopedTypeVariables        = \(enabled : Bool) -> render-extension "ScopedTypeVariables"        enabled
          , StandaloneDeriving         = \(enabled : Bool) -> render-extension "StandaloneDeriving"         enabled
          , StaticPointers             = \(enabled : Bool) -> render-extension "StaticPointers"             enabled
          , Strict                     = \(enabled : Bool) -> render-extension "Strict"                     enabled
          , StrictData                 = \(enabled : Bool) -> render-extension "StrictData"                 enabled
          , TemplateHaskell            = \(enabled : Bool) -> render-extension "TemplateHaskell"            enabled
          , TemplateHaskellQuotes      = \(enabled : Bool) -> render-extension "TemplateHaskellQuotes"      enabled
          , TraditionalRecordSyntax    = \(enabled : Bool) -> render-extension "TraditionalRecordSyntax"    enabled
          , TransformListComp          = \(enabled : Bool) -> render-extension "TransformListComp"          enabled
          , Trustworthy                = \(enabled : Bool) -> render-extension "Trustworthy"                enabled
          , TupleSections              = \(enabled : Bool) -> render-extension "TupleSections"              enabled
          , TypeApplications           = \(enabled : Bool) -> render-extension "TypeApplications"           enabled
          , TypeFamilies               = \(enabled : Bool) -> render-extension "TypeFamilies"               enabled
          , TypeFamilyDependencies     = \(enabled : Bool) -> render-extension "TypeFamilyDependencies"     enabled
          , TypeInType                 = \(enabled : Bool) -> render-extension "TypeInType"                 enabled
          , TypeOperators              = \(enabled : Bool) -> render-extension "TypeOperators"              enabled
          , TypeSynonymInstances       = \(enabled : Bool) -> render-extension "TypeSynonymInstances"       enabled
          , UnboxedSums                = \(enabled : Bool) -> render-extension "UnboxedSums"                enabled
          , UnboxedTuples              = \(enabled : Bool) -> render-extension "UnboxedTuples"              enabled
          , UndecidableInstances       = \(enabled : Bool) -> render-extension "UndecidableInstances"       enabled
          , UndecidableSuperClasses    = \(enabled : Bool) -> render-extension "UndecidableSuperClasses"    enabled
          , UnicodeSyntax              = \(enabled : Bool) -> render-extension "UnicodeSyntax"              enabled
          , UnliftedFFITypes           = \(enabled : Bool) -> render-extension "UnliftedFFITypes"           enabled
          , Unsafe                     = \(enabled : Bool) -> render-extension "Unsafe"                     enabled
          , ViewPatterns               = \(enabled : Bool) -> render-extension "ViewPatterns"               enabled
          , XmlSyntax                  = \(enabled : Bool) -> render-extension "XmlSyntax"                  enabled
          }
          extension)
        input.language-extensions
  , newline =
      merge
      { crlf = \(_ : {}) -> "crlf"
      , lf = \(_ : {}) -> "lf"
      , native = \(_ : {}) -> "native"
      }
      input.newline
  , steps =
      (./prelude.dhall).`List`.map
        ./Step.dhall
        ./StepOutput.dhall
        (\(step : ./Step.dhall) ->
          merge
          { imports =
              \(imports : ./Imports.dhall) ->
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
              \(language-pragmas : ./LanguagePragmas.dhall) ->
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
              \(simple-align : ./SimpleAlign.dhall) ->
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
                  ((./prelude.dhall).`Optional`.map
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
