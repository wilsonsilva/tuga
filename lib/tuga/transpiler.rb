# frozen_string_literal: true

require 'ruby2ruby'
require 'ruby_parser'
require 'tuga/ruby_parser_patches'

module Tuga
  # Transpiles Tuga code to Ruby
  class Transpiler
    # The encoding used to allow Portuguese characters
    ENCODING = "# encoding: utf-8\n"

    # Aliases common methods from the standard library
    CORE_EXTENSIONS = "require \"tuga/core_ext\"\n"

    # Every transpilled program will be encoded
    INITIAL_CODE = "#{ENCODING}#{CORE_EXTENSIONS}"

    def initialize
      @ruby_2_ruby = Ruby2Ruby.new
      @ruby_parser = RubyParser.new
    end

    # Converts Tuga code to Ruby
    #
    # @param [String] tuga_code The Tuga code to be converted
    # @param [Boolean] require_core_ext Whether Tuga's core extensions should be loaded or not
    #
    # @return [String]
    #
    def to_ruby(tuga_code, require_core_ext: true)
      sexp = ruby_parser.process("# encoding: utf-8\n#{tuga_code}")
      ruby_code = ruby_2_ruby.process(sexp)

      require_core_ext ? "#{INITIAL_CODE}#{ruby_code}" : "#{ENCODING}#{ruby_code}"
    end

    private

    attr_reader :ruby_2_ruby, :ruby_parser
  end
end
