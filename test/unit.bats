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
	OUTPUT=$(_threshold_series image.png)
	echo "$OUTPUT" | grep threshold-50.
	echo "$OUTPUT" | grep threshold-55.
	echo "$OUTPUT" | grep threshold-60.
	echo "$OUTPUT" | grep threshold-65.
	echo "$OUTPUT" | grep threshold-70.
	echo "$OUTPUT" | grep threshold-75.
}
