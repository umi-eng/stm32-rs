#!/usr/bin/env bash

set -euo pipefail

FORM_VERSION="${FORM_VERSION:-v0.10.0}"
SVDTOOLS_VERSION="${SVDTOOLS_VERSION:-v0.2.7}"
SVD2RUST_VERSION="${SVD2RUST_VERSION:-v0.28.0}"

case "${1:-}" in
    form)
        form="${2:-$FORM_VERSION}"
        ;;
    svdtools)
        svdtools="${2:-$SVDTOOLS_VERSION}"
        ;;
    svd2rust)
        svd2rust="${2:-$SVD2RUST_VERSION}"
        ;;
    *)
        form=$FORM_VERSION
        svdtools=$SVDTOOLS_VERSION
        svd2rust=$SVD2RUST_VERSION
        echo "Install default versions"
        ;;
esac

if [ "${form:-}" ]; then
    echo "form = ${form}"
    curl -sSfL https://github.com/djmcgill/form/releases/download/$form/form-x86_64-unknown-linux-gnu.gz | gzip -d - > ~/.cargo/bin/form
    chmod +x ~/.cargo/bin/form
fi

if [ "${svdtools:-}" ]; then
    echo "svdtools = ${svdtools}"
    curl -sSfL https://github.com/stm32-rs/svdtools/releases/download/$svdtools/svdtools-x86_64-unknown-linux-gnu.gz | gzip -d - > ~/.cargo/bin/svdtools
    chmod +x ~/.cargo/bin/svdtools
fi

if [ "${svd2rust:-}" ]; then
    echo "svd2rust = ${svd2rust}"
    curl -sSfL https://github.com/rust-embedded/svd2rust/releases/download/$svd2rust/svd2rust-x86_64-unknown-linux-gnu.gz | gzip -d - > ~/.cargo/bin/svd2rust
    chmod +x ~/.cargo/bin/svd2rust
fi
