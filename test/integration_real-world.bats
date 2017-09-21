#!/usr/bin/env bats

@test "./imagemagick-imslp.sh file.pdf" {
	[ "$TRAVIS" != 'true' ] || skip
	run ./imagemagick-imslp.sh test/scans/scans.pdf
	rm -f imagemagick-imslp_*
}

@test "./imagemagick-imslp.sh --threshold-series test/scans/small/bach-busoni.jpg" {
	[ "$TRAVIS" != 'true' ] || skip
	run ./imagemagick-imslp.sh --threshold-series test/scans/small/bach-busoni.jpg
	rm -f test/scans/small/bach-busoni_threshold*
}
