#!/bin/bash

# Copyright (C) 2025 Diwas Neupane
# SPDX-License-Identifier: Apache-2.0
# Kernel build script

KERNELDIR=/home/runner/android-kernel
if [[ -z ${KERNELDIR} ]]; then
    echo -e "Please set KERNELDIR"
    exit 1
fi

TOOLCHAINDIR=/home/runner/toolchain
if [[ -z ${TOOLCHAINDIR} ]]; then
    echo -e "Please set TOOLCHAINDIR"
    exit 1
fi

[[ -z ${DEVICE} ]] && DEVICE=dandelion

# These won't change
export SRCDIR="${KERNELDIR}"
export OUTDIR="${KERNELDIR}/${DEVICE}/obj"
export ARCH="arm64"
CCACHE="$(command -v ccache)"
export CLANG_DIR="${TOOLCHAINDIR}/clang-r353983c"
export CLANG_TRIPLE="aarch64-linux-gnu-"
export CC="${CLANG_DIR}/bin/clang"
KBUILD_COMPILER_STRING=$(${CC} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')
export GCC_DIR="${TOOLCHAINDIR}/aarch64-linux-android-4.9"
CROSS_COMPILE="${GCC_DIR}/bin/aarch64-linux-android-"
export CROSS_COMPILE_ARM32="${TOOLCHAINDIR}/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-"
export DEFCONFIG="${DEVICE}_defconfig"
export IMAGE="${OUTDIR}/arch/${ARCH}/boot/Image.gz"
if [[ -z ${JOBS} ]]; then
    JOBS="$(grep -c '^processor' /proc/cpuinfo)"
fi

export DEVICE CCACHE KBUILD_COMPILER_STRING JOBS CROSS_COMPILE

function make_wrapper() {
    time make -j"${JOBS}" \
        O="${OUTDIR}" \
        ARCH="${ARCH}" \
        CC="${CCACHE} ${CC}" \
        CLANG_TRIPLE="${CLANG_TRIPLE}" \
        CROSS_COMPILE="${CROSS_COMPILE}" \
        CROSS_COMPILE_ARM32="${CROSS_COMPILE_ARM32}" \
        "${@}"
}

[ ! -d "${OUTDIR}" ] && mkdir -pv "${OUTDIR}"

cd "${SRCDIR}" || exit
rm -fv "${IMAGE}"

if [[ $* =~ "mrproper" ]]; then
    make_wrapper mrproper
fi

if [[ $* =~ "clean" ]]; then
    make_wrapper clean
fi

make_wrapper $DEFCONFIG || (echo "Failed to build with ${DEFCONFIG}, exiting!" &&
    exit 1)

START=$(date +"%s")
if [[ $* =~ "quiet" ]]; then
    make_wrapper |& ag -ia "error:|warning:"
else
    make_wrapper
fi
END=$(date +"%s")
DIFF=$((END - START))
echo -e "Build took $((DIFF / 60)) minute(s) and $((DIFF % 60)) seconds."

if [[ ! -f ${IMAGE} ]]; then
    echo -e "Build failed :P"
    exit 1
else
    echo -e "Build Succesful!"
fi
