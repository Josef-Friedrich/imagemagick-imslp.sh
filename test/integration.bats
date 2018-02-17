#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	mock_path test/bin
}

@test "./imagemagick-imslp.sh" {
	run ./imagemagick-imslp.sh
	[ "$status" -eq 1 ]
	[ "${lines[0]}" = 'Usage: imagemagick-imslp.sh [-bcfhijrSstv] <filename-or-glob-pattern>' ]
}

@test "./imagemagick-imslp.sh file.pdf" {
	run ./imagemagick-imslp.sh file.pdf
	[ "${lines[0]}" = 'Command “pdfimages”: -tiff file.pdf imagemagick-imslp_1505986186' ]
}

@test "./imagemagick-imslp.sh --enlighten-border file.png" {
	run ./imagemagick-imslp.sh --enlighten-border file.png
	[ "${lines[0]}" = 'Convert file.png to file.png' ]
}
