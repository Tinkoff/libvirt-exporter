# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Fix potential domain leak.
- Add per-vcpu stats: cpu number, time running and state.
- Fix `libvirt_domain_interface_meta` if ther's no bridge or virtual interface. Just don't collect it.

## [1.0.0] - 2020-03-16
### Changed
- Fix README: updated metric names
- Fix wrong CPU seconds metric.

## [0.3.1] - 2019-10-02
### Changed
- Fix seconds calculation. It was wrong since 0.3.0.

## [0.3.0] - 2019-09-27
### Added
- Add CHANGELOG.md

### Changed
- Fix stuck when collecting metrics from paused domains with lock on resources. It's better to use CONNECT_GET_ALL_DOMAINS_STATS_NOWAIT, but it only works with modern libvirt versions. Just collect metrics for active and shutoff vm's. By [@clickfreak](https://github.com/clickfreak).
- Use standart recomended base units and rename metric names by [@clickfreak](https://github.com/clickfreak).
- Refactor of buildindocker.sh and Dockerbuildimage.

