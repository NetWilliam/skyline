
all: lint

lint:
	ci/lint.sh

db:
	ci/init_db.sh

test:
	ci/prepare.sh
	ci/run_tests.sh

merge:
	ci/merge_static.sh

.PHONY: all lint db test merge
