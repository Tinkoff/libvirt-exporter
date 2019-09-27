# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2019-10-27
### Added
- Add CHANGELOG.md

### Changed
- Fix stuck when collecting metrics from paused domains with lock on resources. It's better to use CONNECT_GET_ALL_DOMAINS_STATS_NOWAIT, but it only works with modern libvirt versions. Just collect metrics for active and shutoff vm's. By [@clickfreak](https://github.com/clickfreak).
- Use standart recomended base units and rename metric names by [@clickfreak](https://github.com/clickfreak).
- Refactor of buildindocker.sh and Dockerbuildimage.

