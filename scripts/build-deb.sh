#!/bin/bash
set -eu

PACKAGE_NAME="bsignage"
PACKAGE_ROOT="$(mktemp -d)"
OUTPUT_DIR="${1:-dist}"
VERSION="$(sed -n 's/^Version: //p' DEBIAN/control)"

cleanup() {
    rm -rf "${PACKAGE_ROOT}"
}

trap cleanup EXIT

mkdir -p "${PACKAGE_ROOT}/DEBIAN" "${PACKAGE_ROOT}/etc" "${PACKAGE_ROOT}/usr" "${OUTPUT_DIR}"

cp -a DEBIAN/. "${PACKAGE_ROOT}/DEBIAN/"
cp -a etc/. "${PACKAGE_ROOT}/etc/"
cp -a usr/. "${PACKAGE_ROOT}/usr/"

chmod 0755 \
    "${PACKAGE_ROOT}/DEBIAN/postinst" \
    "${PACKAGE_ROOT}/DEBIAN/prerm" \
    "${PACKAGE_ROOT}/usr/sbin/bsignage" \
    "${PACKAGE_ROOT}/usr/share/bsignage/openbox-autostart"

dpkg-deb --build "${PACKAGE_ROOT}" "${OUTPUT_DIR}/${PACKAGE_NAME}_${VERSION}_all.deb"

echo "Built ${OUTPUT_DIR}/${PACKAGE_NAME}_${VERSION}_all.deb"
