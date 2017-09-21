#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec imagemagick-imslp.sh
}


@test "variables" {
	mock_path test/bin
	source_exec imagemagick-imslp.sh
	[ "$JOB_IDENTIFIER" = imagemagick-imslp_1505986186 ]
	[ "$OUT_EXT" = png ]
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

@test "_threshold_series image.png" {
	mock_path test/bin
	OPT_SERIES=1
	run _threshold_series image.png
	echo $lines > $HOME/debug
}
