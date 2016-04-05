
all: lint

lint:
	ci/lint.sh

.PHONY: all lint db test merge
