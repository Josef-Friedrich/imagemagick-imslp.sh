#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec imagemagick-imslp.sh
}

@test "_get_extension filename.pdf" {
	run _get_extension filename.pdf
	[ "${lines[0]}" = pdf ]
	[ "${lines[1]}" = '' ]
}

@test "_get_extension filename-pdf.pdf" {
	run _get_extension filename.pdf.pdf
	[ "${lines[0]}" = pdf ]
	[ "${lines[1]}" = '' ]
}
