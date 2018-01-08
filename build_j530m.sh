#Build script for J530GM/J530YM/J530FM/J530Y With EUR_openmM DTS


#!/bin/bash
DTS=arch/arm64/boot/dts
RDIR=$(pwd)
# UberTC
export CROSS_COMPILE=/home/elite/android/toolchain/ubertc-aarch64-4.9/bin/aarch64-linux-android-
# Cleanup
make clean && make mrproper
# J530F Config
make j5y17lte_01_defconfig
make exynos7870-j5y17lte_eur_openm_00.dtb exynos7870-j5y17lte_eur_openm_01.dtb exynos7870-j5y17lte_eur_openm_02.dtb exynos7870-j5y17lte_eur_openm_03.dtb exynos7870-j5y17lte_eur_openm_05.dtb exynos7870-j5y17lte_eur_openm_07.dtb
# Make zImage
make ARCH=arm64 -j4
./scripts/dtbTool/dtbTool -o ./boot.img-dtb -d $DTS/ -s 2048
# Cleaup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb
# Generate Boot_J530F_G.img
./makeimg_j530f_g.sh

echo J530F_G Kernel Done