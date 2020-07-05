# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2020-07-05
### Added
- Added an ability to transpile Tuga code without requiring the core extensions to the standard library

## [0.2.0] - 2020-06-07
### Added
- Added the keywords `senao`, `entao`, `inicio`, `varias_opcoes`, `senao_se`, `modulo`, `ate_que` and `nao`. These
keywords contain only ASCII characters which makes them much easier to type and parse.

### Changed
- Improved the usage documentation

### Fixed
- Fixed a security vulnerability in Rake [(CVE-2020-8130)](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-8130)
by updating it from `~ 10.0` to `~ 12.3`.

## [0.1.0] - 2020-06-06
### Added
- Initial core functionality
- Codebase maintenance tools

[0.3.0]: https://github.com/wilsonsilva/tuga/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/wilsonsilva/tuga/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/wilsonsilva/tuga/compare/ba17557...v0.1.0
