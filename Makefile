CRATE_ROOT=${PWD}
PLEB_RUST_FLAGS="${RUSTFLAGS} -A dead_code -A unused-variables -A unused_imports"

THIS_YEAR=`date +'%Y'`
THIS_DDMM=`date +'%d%m'`

.PHONY: clean all dev test release

all:
	RUSTFLAGS=${PLEB_RUST_FLAGS} cargo build

run:
	RUSTFLAGS=${PLEB_RUST_FLAGS} RUST_BACKTRACE=FULL RUST_LOG=info cargo run -- --show-output

test:
	RUSTFLAGS=${PLEB_RUST_FLAGS} RUST_BACKTRACE=1 RUST_LOG=info cargo test -- --show-output

dev-test:
	RUSTFLAGS=${PLEB_RUST_FLAGS} RUST_BACKTRACE=1 RUST_LOG=info cargo test

release:
	RUSTFLAGS=${PLEB_RUST_FLAGS} cargo build --release

clean:
	cargo clean --quiet --release --offline
	cargo clean --quiet --target debug
	rm -rf log/*
