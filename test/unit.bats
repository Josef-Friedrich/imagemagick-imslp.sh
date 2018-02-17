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
	[ "$THRESHOLD_SERIES" = "50 55 60 65 70 75" ]
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

@test "unittest: _check_for_executable unkown" {
	run _check_for_executable e763978f71116cbe0301d7007d06b2f73cc511b25f58dfc77a496d10830ae186
	[ "$status" -eq 2 ]
	[ "${lines[0]}" = 'Missing binary “e763978f71116cbe0301d7007d06b2f73cc511b25f58dfc77a496d10830ae186”!' ]
}

@test "unittest: _check_for_executable known" {
	run _check_for_executable echo
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = '' ]
}

@test "unittest: _options_enlighten_border" {
	run _options_enlighten_border test/scans/originals/bach-busoni.png
	echo ${lines[0]} > $HOME/debug
	[ "$status" -eq 0 ]
}
