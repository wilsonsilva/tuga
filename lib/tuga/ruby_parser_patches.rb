# frozen_string_literal: true

module RubyParserStuff
  # Language patches to Ruby Parser
  class Keyword
    keywords = [
      ['fim',                  %i[kEND kEND],                   :expr_end],
      ['definir',              %i[kDEF kDEF],                   :expr_fname],
      ['resgatar',             %i[kRESCUE kRESCUE_MOD],         :expr_mid],
      ['produzir',             %i[kYIELD kYIELD],               :expr_arg],
      ['sujeito',              %i[kSELF kSELF],                 :expr_end],
      ['falso',                %i[kFALSE kFALSE],               :expr_end],
      ['tentar_novamente',     %i[kRETRY kRETRY],               :expr_end],
      ['retornar',             %i[kRETURN kRETURN],             :expr_mid],
      ['verdadeiro',           %i[kTRUE kTRUE],                 :expr_end],
      ['definido?',            %i[kDEFINED kDEFINED],           :expr_arg],
      ['indefinir',            %i[kUNDEF kUNDEF],               :expr_fname],
      ['quebrar',              %i[kBREAK kBREAK],               :expr_mid],
      ['nulo',                 %i[kNIL kNIL],                   :expr_end],
      ['seguinte',             %i[kNEXT kNEXT],                 :expr_mid],
      ['refazer',              %i[kREDO kREDO],                 :expr_end],
      ['classe',               %i[kCLASS kCLASS],               :expr_class],
      ['alias',                %i[kALIAS kALIAS],               :expr_fname],
      ['garantir',             %i[kENSURE kENSURE],             :expr_beg],
      ['senão',                %i[kELSE kELSE],                 :expr_beg],
      ['então',                %i[kTHEN kTHEN],                 :expr_beg],
      ['fazer',                %i[kDO kDO],                     :expr_beg],
      ['início',               %i[kBEGIN kBEGIN],               :expr_beg]
    ]

    expression_keywords = [
      ['e',                    %i[kAND kAND],                   :expr_beg],
      ['várias_opções',        %i[kCASE kCASE],                 :expr_beg],
      ['senão_se',             %i[kELSIF kELSIF],               :expr_beg],
      ['por_cada',             %i[kFOR kFOR],                   :expr_beg],
      ['se',                   %i[kIF kIF_MOD],                 :expr_beg],
      ['na',                   %i[kIN kIN],                     :expr_beg],
      ['em',                   %i[kIN kIN],                     :expr_beg],
      ['módulo',               %i[kMODULE kMODULE],             :expr_beg],
      ['grupo',                %i[kMODULE kMODULE],             :expr_beg],
      ['ou',                   %i[kOR kOR],                     :expr_beg],
      ['excepto_se',           %i[kUNLESS kUNLESS_MOD],         :expr_beg],
      ['até_que',              %i[kUNTIL kUNTIL_MOD],           :expr_beg],
      ['quando',               %i[kWHEN kWHEN],                 :expr_beg],
      ['enquanto',             %i[kWHILE kWHILE_MOD],           :expr_beg]
    ]

    internal_keywords = [
      ['END',                  %i[klEND klEND],                 :expr_end],
      ['BEGIN',                %i[klBEGIN klBEGIN],             :expr_end],
      ['super',                %i[kSUPER kSUPER],               :expr_arg],
      ['__FILE__',             %i[k__FILE__ k__FILE__],         :expr_end],
      ['__LINE__',             %i[k__LINE__ k__LINE__],         :expr_end],
      ['__ENCODING__',         %i[k__ENCODING__ k__ENCODING__], :expr_end]
    ]

    argument_keywords = [
      ['não', %i[kNOT kNOT], :expr_beg]
    ]

    original_verbosity = $VERBOSE
    $VERBOSE = nil

    all_keywords = [
      keywords,
      expression_keywords,
      internal_keywords,
      argument_keywords
    ].flatten(1).map { |args| KWtable.new(*args) }

    WORDLIST18 = Hash[*all_keywords.map { |o| [o.name, o] }.flatten]
    WORDLIST19 = Hash[*all_keywords.map { |o| [o.name, o] }.flatten]

    $VERBOSE = original_verbosity

    WORDLIST18.delete '__ENCODING__'

    expression_keywords.each do |k|
      WORDLIST19[k[0]] = WORDLIST19[k[0]].dup
      WORDLIST19[k[0]].state = :expr_value
    end

    argument_keywords.each do |k|
      WORDLIST19[k[0]] = WORDLIST19[k[0]].dup
      WORDLIST19[k[0]].state = :expr_arg
    end
  end
end
