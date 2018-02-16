#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec imagemagick-imslp.sh
}

# -b, --backup
@test "_getopts -b" {
	_getopts -b
	[ "$OPT_BACKUP" -eq 1 ]
}

@test "_getopts --backup" {
	_getopts --backup
	[ "$OPT_BACKUP" -eq 1 ]
}

@test "_getopts --backup=123" {
	run _getopts --backup=123
	[ "$status" -eq 4 ]
}
# -c, --compression

@test "_getopts -c" {
	_getopts -c
	[ "$OPT_COMPRESSION" -eq 1 ]
}

@test "_getopts --compression" {
	_getopts --compression
	[ "$OPT_COMPRESSION" -eq 1 ]
}

@test "_getopts -compression-=123" {
	run _getopts --compression=123
	[ "$status" -eq 4 ]
}

# -f, --force

@test "_getopts -f" {
	_getopts -f
	[ "$OPT_FORCE" -eq 1 ]
}

@test "_getopts --force" {
	_getopts --force
	[ "$OPT_FORCE" -eq 1 ]
}

@test "_getopts --force=123" {
	run _getopts --force=123
	[ "$status" -eq 4 ]
}

# -h, --help

@test "_getopts -h" {
	run _getopts -h
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Usage: imagemagick-imslp.sh [-bcfhijrSstv] <filename-or-glob-pattern>" ]
}

@test "_getopts --help" {
	run _getopts --help
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Usage: imagemagick-imslp.sh [-bcfhijrSstv] <filename-or-glob-pattern>" ]
}

@test "_getopts --help=123" {
	run _getopts --help=123
	[ "$status" -eq 4 ]
}

# -i, --imslp

@test "_getopts -i" {
	_getopts -i
	[ "$OPT_COMPRESSION" -eq 1 ]
	[ "$OPT_JOIN" -eq 1 ]
	[ "$OPT_RESIZE" -eq 1 ]
}

@test "_getopts --imslp" {
	_getopts --imslp
	[ "$OPT_COMPRESSION" -eq 1 ]
	[ "$OPT_JOIN" -eq 1 ]
	[ "$OPT_RESIZE" -eq 1 ]
}

@test "_getopts --imslp=123" {
	run _getopts --imslp=123
	[ "$status" -eq 4 ]
}

# -j, --join

@test "_getopts -j" {
	_getopts -j
	[ "$OPT_JOIN" -eq 1 ]
}

@test "_getopts --join" {
	_getopts --join
	[ "$OPT_JOIN" -eq 1 ]
}

@test "_getopts --join=123" {
	run _getopts --join=123
	[ "$status" -eq 4 ]
}

# -r, --resize

@test "_getopts -r" {
	_getopts -r
	[ "$OPT_RESIZE" -eq 1 ]
}

@test "_getopts --resize" {
	_getopts --resize
	[ "$OPT_RESIZE" -eq 1 ]
}

@test "_getopts --resize=123" {
	run _getopts --resize=123
	[ "$status" -eq 4 ]
}

# -S, --threshold-series

@test "_getopts -S" {
	_getopts -S
	[ "$OPT_SERIES" -eq 1 ]
}

@test "_getopts --threshold-series" {
	_getopts --threshold-series
	[ "$OPT_SERIES" -eq 1 ]
}

@test "_getopts --threshold-series=123" {
	run _getopts --threshold-series=123
	[ "$status" -eq 4 ]
}

# -s, --short-description

@test "_getopts -s" {
	run _getopts -s
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "A wrapper script for imagemagick to process image \
files suitable for imslp.org (International Music Score Library Project)" ]
}

@test "_getopts --short-description" {
	run _getopts --short-description
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "A wrapper script for imagemagick to process image \
files suitable for imslp.org (International Music Score Library Project)" ]
}

@test "_getopts --short-description=123" {
	run _getopts --short-description=123
	[ "$status" -eq 4 ]
}

# -t, --threshold

@test "_getopts -t 123" {
	_getopts -t 123
	[ "$OPT_THRESHOLD" -eq 123 ]
}

@test "_getopts -t" {
	run _getopts -t
	[ "$status" -eq 3 ]
}

@test "_getopts --threshold=123" {
	_getopts --threshold=123
	[ "$OPT_THRESHOLD" -eq 123 ]
}

@test "_getopts --threshold" {
	run _getopts --threshold
	[ "$status" -eq 3 ]
}

# -v, --version

@test "_getopts -v" {
	run _getopts -v
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "$VERSION" ]
}

@test "_getopts --version" {
	run _getopts --version
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "$VERSION" ]
}

@test "_getopts --version=123" {
	run _getopts --version=123
	[ "$status" -eq 4 ]
}
