#!/usr/bin/env bats

@test "./imagemagick-imslp.sh file.pdf" {
	[ "$TRAVIS" != 'true' ] || skip
	run ./imagemagick-imslp.sh test/scans/scans.pdf
	rm -f imagemagick-imslp_*
}
