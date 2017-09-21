#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	mock_path test/bin
}

@test "./imagemagick-imslp.sh file.pdf" {
	run ./imagemagick-imslp.sh file.pdf
	[ "${lines[0]}" = 'Command “pdfimages”: -tiff file.pdf imagemagick-imslp_1505986186' ]
}
