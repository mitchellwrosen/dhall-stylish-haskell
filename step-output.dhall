< imports :
    { imports :
        { align            : Text
        , empty_list_align : Text
        , list_align       : Text
        , list_padding     : ./list-padding.dhall
        , long_list_align  : Text
        , pad_module_names : Bool
        , separate_lists   : Bool
        , space_surround   : Bool
        }
    }
| language_pragmas :
    { language_pragmas :
        { align            : Bool
        , remove_redundant : Bool
        , style            : Text
        }
    }
| simple_align :
    { simple_align :
        { cases              : Bool
        , records            : Bool
        , top_level_patterns : Bool
        }
    }
| squash :
    Optional
      { squash :
          {}
      }
| tabs :
    Optional
      { tabs :
        { spaces : Natural }
      }
| trailing_whitespace :
    Optional
      { trailing_whitespace :
        {}
      }
>
