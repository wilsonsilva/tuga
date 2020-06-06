# frozen_string_literal: true

require 'ruby2ruby'
require 'ruby_parser'
require 'tuga/ruby_parser_patches'

module Tuga
  # Transpiles Tuga code to Ruby
  class Transpiler
    INITIAL_CODE = "# encoding: utf-8\nrequire \"tuga/core_ext\"\n"

    def initialize
      @ruby_2_ruby = Ruby2Ruby.new
      @ruby_parser = RubyParser.new
    end

    def to_ruby(tuga_code)
      sexp = ruby_parser.process("# encoding: utf-8\n#{tuga_code}")
      ruby_code = ruby_2_ruby.process(sexp)

      "#{INITIAL_CODE}#{ruby_code}"
    end

    private

    attr_reader :ruby_2_ruby, :ruby_parser
  end
end
