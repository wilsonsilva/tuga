# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Tuga::Transpiler do
  let(:transpiler) { described_class.new }

  describe '#to_ruby' do
    it 'transpiles an empty Tuga program' do
      ruby_code = transpiler.to_ruby('')
      expect(ruby_code).to eq(Tuga::Transpiler::INITIAL_CODE + '')
    end

    it 'transpiles integers' do
      ruby_code = transpiler.to_ruby('1')
      expect(ruby_code).to eq(Tuga::Transpiler::INITIAL_CODE + '1')
    end

    it 'transpiles decimals' do
      ruby_code = transpiler.to_ruby('1.2')
      expect(ruby_code).to eq(Tuga::Transpiler::INITIAL_CODE + '1.2')
    end

    it 'transpiles arrays of numbers' do
      ruby_code = transpiler.to_ruby('[1.2, 3]')
      expect(ruby_code).to eq(Tuga::Transpiler::INITIAL_CODE + '[1.2, 3]')
    end

    it 'transpiles the keyword verdadeiro to true' do
      ruby_code = transpiler.to_ruby('verdadeiro')
      expect(ruby_code).to eq(Tuga::Transpiler::INITIAL_CODE + 'true')
    end

    it 'transpiles the keyword falso to false' do
      ruby_code = transpiler.to_ruby('falso')
      expect(ruby_code).to eq(Tuga::Transpiler::INITIAL_CODE + 'false')
    end

    it 'transpiles the keyword não to not' do
      ruby_code = transpiler.to_ruby('não verdadeiro')
      expect(ruby_code).to eq(Tuga::Transpiler::INITIAL_CODE + '(not true)')
    end

    it 'transpiles the keywords se / então / senão_se / senão / fim' do
      ruby_code = transpiler.to_ruby('
        se 1 então
          2
        senão_se 3
          4
        senão
          5
        fim')

      expect(ruby_code).to be_like(Tuga::Transpiler::INITIAL_CODE + '1 ? (2) : (3 ? (4) : (5))')
    end

    it 'transpiles the keywords várias_opções / quando / então / senão / fim' do
      ruby_code = transpiler.to_ruby("
        várias_opções 1
        quando 1 então 1
        quando 2
          2
        senão
          3
        fim")

      expect(ruby_code).to be_like(Tuga::Transpiler::INITIAL_CODE +
       'case 1
        when 1 then
          1
        when 2 then
          2
        else
          3
        end')
    end

    it 'transpiles the keywords início / resgatar / provocar / garantir / fim' do
      ruby_code = transpiler.to_ruby('
        início
          1 / 0
        resgatar => erro
          tentar_novamente
          provocar erro
        garantir
          escrever "final"
        fim')

      expect(ruby_code).to be_like(Tuga::Transpiler::INITIAL_CODE +
        'begin
          (1 / 0)
        rescue => erro
          retry
          provocar(erro)
        ensure
          escrever("final")
        end')
    end
  end
end
