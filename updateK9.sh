#!/bin/bash

module_name='k-9Module'
version_regex='^v?([0-9]+(?:\.[0-9]+)*$)'

git submodule update "$module_name"
pushd "$module_name"

latest="$(git tag | pcregrep -o1 $version_regex | tail -n1)"
git checkout "${latest}" -b "${latest}"
popd
