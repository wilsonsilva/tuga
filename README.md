# Tuga

[![Gem Version](https://badge.fury.io/rb/tuga.svg)](https://badge.fury.io/rb/tuga)
[![Build Status](https://travis-ci.org/wilsonsilva/tuga.svg?branch=main)](https://travis-ci.org/wilsonsilva/tuga)
[![Maintainability](https://api.codeclimate.com/v1/badges/7afec90a09db3956b7dc/maintainability)](https://codeclimate.com/github/wilsonsilva/tuga/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/7afec90a09db3956b7dc/test_coverage)](https://codeclimate.com/github/wilsonsilva/tuga/test_coverage)
[![Security](https://hakiri.io/github/wilsonsilva/tuga/main.svg)](https://hakiri.io/github/wilsonsilva/tuga/main)
[![Inline docs](http://inch-ci.org/github/wilsonsilva/tuga.svg?branch=main)](http://inch-ci.org/github/wilsonsilva/tuga)

A Portuguese script programming language meant for educational purposes.

## Requirements

The gem requires version 2.6 of the Ruby programming language.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tuga'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tuga

## Usage

### In the command line
Run the `tuga` command followed by a filename.

```
tuga soure_code.pt
```

### In an application
Require the `Tuga` transpiler and give it Tuga source code.

```ruby
require 'tuga/transpiler'

source_code = <<~BACALHAU
  lista_de_frutas = ['maçã', 'manga', 'goiaba', 'uva']

  por_cada fruta na lista_de_frutas fazer
    escrever fruta.com_letra_maiuscula
  fim
BACALHAU

transpiler = Tuga::Transpiler.new
transpiler.to_ruby(source_code)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies, configure git hooks and create support files.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The health and maintainability of the codebase is ensured through a set of
Rake tasks to test, lint and audit the gem for security vulnerabilities and documentation:

```
rake bundle:audit          # Checks for vulnerable versions of gems
rake qa                    # Test, lint and perform security and documentation audits
rake rubocop               # Lint the codebase with RuboCop
rake rubocop:auto_correct  # Auto-correct RuboCop offenses
rake spec                  # Run RSpec code examples
rake verify_measurements   # Verify that yardstick coverage is at least 100%
rake yard                  # Generate YARD Documentation
rake yard:junk             # Check the junk in your YARD Documentation
rake yardstick_measure     # Measure docs in lib/**/*.rb with yardstick
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wilsonsilva/tuga. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[code of conduct](https://github.com/wilsonsilva/tuga/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tuga project's codebases, issue trackers, chat rooms and mailing lists is expected to
ollow the [code of conduct](https://github.com/wilsonsilva/tuga/blob/main/CODE_OF_CONDUCT.md).
