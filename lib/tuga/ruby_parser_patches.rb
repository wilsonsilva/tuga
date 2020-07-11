# frozen_string_literal: true

module RubyParserStuff
  # Language patches to Ruby Parser
  class Keyword
    expr_woot = EXPR_FNAME|EXPR_FITEM

    wordlist = [
      ["alias",            [:kALIAS,    :kALIAS      ], expr_woot  ],
      ["e",                [:kAND,      :kAND        ], EXPR_BEG   ],
      ["inicio",           [:kBEGIN,    :kBEGIN      ], EXPR_BEG   ],
      ["início",           [:kBEGIN,    :kBEGIN      ], EXPR_BEG   ],
      ["quebrar",          [:kBREAK,    :kBREAK      ], EXPR_MID   ],
      ["várias_opções",    [:kCASE,     :kCASE       ], EXPR_BEG   ],
      ["varias_opcoes",    [:kCASE,    :kCASE        ], EXPR_BEG   ],
      ["classe",           [:kCLASS,    :kCLASS      ], EXPR_CLASS ],
      ["def",              [:kDEF,      :kDEF        ], EXPR_FNAME ],
      ["definir",          [:kDEF,      :kDEF        ], EXPR_FNAME ],
      ["definido?",        [:kDEFINED,  :kDEFINED    ], EXPR_ARG   ],
      ["fazer",            [:kDO,       :kDO         ], EXPR_BEG   ],
      ["senão",            [:kELSE,     :kELSE       ], EXPR_BEG   ],
      ["senao",            [:kELSE,     :kELSE       ], EXPR_BEG   ],
      ["senão_se",         [:kELSIF,    :kELSIF      ], EXPR_BEG   ],
      ["senao_se",         [:kELSIF,    :kELSIF      ], EXPR_BEG   ],
      ["fim",              [:kEND,      :kEND        ], EXPR_END   ],
      ["garantir",         [:kENSURE,   :kENSURE     ], EXPR_BEG   ],
      ["falso",            [:kFALSE,    :kFALSE      ], EXPR_END   ],
      ["por_cada",         [:kFOR,      :kFOR        ], EXPR_BEG   ],
      ["se",               [:kIF,       :kIF_MOD     ], EXPR_BEG   ],
      ["em",               [:kIN,       :kIN         ], EXPR_BEG   ],
      ["modulo",           [:kMODULE,   :kMODULE     ], EXPR_BEG   ],
      ["grupo",            [:kMODULE,   :kMODULE     ], EXPR_BEG   ],
      ["seguinte",         [:kNEXT,     :kNEXT       ], EXPR_MID   ],
      ["nulo",             [:kNIL,      :kNIL        ], EXPR_END   ],
      ["não",              [:kNOT,      :kNOT        ], EXPR_ARG   ],
      ["nao",              [:kNOT,      :kNOT        ], EXPR_ARG   ],
      ["ou",               [:kOR,       :kOR         ], EXPR_BEG   ],
      ["refazer",          [:kREDO,     :kREDO       ], EXPR_END   ],
      ["resgatar",         [:kRESCUE,   :kRESCUE_MOD ], EXPR_MID   ],
      ["tentar_novamente", [:kRETRY,    :kRETRY      ], EXPR_END   ],
      ["retornar",         [:kRETURN,   :kRETURN     ], EXPR_MID   ],
      ["sujeito",          [:kSELF,     :kSELF       ], EXPR_END   ],
      ["super",            [:kSUPER,    :kSUPER      ], EXPR_ARG   ],
      ["então",            [:kTHEN,     :kTHEN       ], EXPR_BEG   ],
      ["entao",            [:kTHEN,     :kTHEN       ], EXPR_BEG   ],
      ["verdadeiro",       [:kTRUE,     :kTRUE       ], EXPR_END   ],
      ["indefinir",        [:kUNDEF,    :kUNDEF      ], expr_woot  ],
      ["excepto_se",       [:kUNLESS,   :kUNLESS_MOD ], EXPR_BEG   ],
      ["até_que",          [:kUNTIL,    :kUNTIL_MOD  ], EXPR_BEG   ],
      ["ate_que",          [:kUNTIL,    :kUNTIL_MOD  ], EXPR_BEG   ],
      ["quando",           [:kWHEN,     :kWHEN       ], EXPR_BEG   ],
      ["enquanto",         [:kWHILE,    :kWHILE_MOD  ], EXPR_BEG   ],
      ["produzir",         [:kYIELD,    :kYIELD      ], EXPR_ARG   ],
      ["BEGIN",            [:klBEGIN,   :klBEGIN     ], EXPR_END   ],
      ["END",              [:klEND,     :klEND       ], EXPR_END   ],
      ["__FILE__",         [:k__FILE__, :k__FILE__   ], EXPR_END   ],
      ["__LINE__",         [:k__LINE__, :k__LINE__   ], EXPR_END   ],
      ["__ENCODING__",     [:k__ENCODING__, :k__ENCODING__], EXPR_END],
    ].map { |args|
      KWtable.new(*args)
    }

    # :startdoc:

    WORDLIST = Hash[*wordlist.map { |o| [o.name, o] }.flatten]
  end
end
