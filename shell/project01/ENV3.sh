#!/bin/bash
############################3
# 1. epel-release 
# 2. boxes, gcc , make 
# 3. ?
###########################
set -e


source /root/shell/functions.sh


echo "[필요 패키지 설치]"
# 1. epel-release 
PKGS="epel-release"
echo "Phase 01 $PKGS 파일 설정" 
PkgInstall $PKGS


# 2. boxes, gcc , make 
PKGS="gcc make boxes"
echo "Phase 01 $PKGS 파일 설정" 
PkgInstall $PKGS