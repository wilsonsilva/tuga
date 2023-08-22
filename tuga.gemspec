require_relative 'lib/tuga/version'

Gem::Specification.new do |spec|
  spec.name          = 'tuga'
  spec.version       = Tuga::VERSION
  spec.authors       = ['Wilson Silva']
  spec.email         = ['me@wilsonsilva.net']

  spec.summary       = 'A Portuguese script programming language.'
  spec.description   = 'A Portuguese script programming language meant for educational purposes.'
  spec.homepage      = 'https://github.com/wilsonsilva/tuga'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('~> 3.2.0')

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/wilsonsilva/tuga'
  spec.metadata['changelog_uri']   = 'https://github.com/wilsonsilva/tuga/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # These versions of the parsers and transpilers are compatible with Ruby 3.2
  spec.add_dependency 'ruby2ruby', '~> 2.5'
  spec.add_dependency 'ruby_parser', '~> 3.20'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'bundler-audit', '~> 0.9'
  spec.add_development_dependency 'guard', '~> 2.18'
  spec.add_development_dependency 'guard-bundler', '~> 3.0'
  spec.add_development_dependency 'guard-bundler-audit', '~> 0.1'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'guard-rubocop', '~> 1.5'
  spec.add_development_dependency 'overcommit', '~> 0.60'
  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.56.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.23'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_development_dependency 'simplecov-console', '~> 0.9'
  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'yard-junk', '~> 0.0.9'
  spec.add_development_dependency 'yardstick', '~> 0.9'
end
