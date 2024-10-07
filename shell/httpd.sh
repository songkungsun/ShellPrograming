#!/bin/bash

set -e # 중간에 오류가 발생하면 스크립트 정지


################################################################
# 1) 패키지 설치 -httpd,mod_ssl
# 2) 웹서비스 설정 - /var;www;html/index.html
# 3) 웹서비스 기동 - httpd.service
# 4) 방화벽에 등록 - http, https
################################################################

# The file(funtions.sh) load
source /root/shell/functions.sh

#
# Main function
#
# 1) 패키지 설치 -httpd,mod_ssl
echo
echo "[Phases: 01] 패키지 설치"
PkgInstall "httpd mod_ssl"

# 2) 웹서비스 설정 - /var;www;html/index.html
echo
echo "[Phases: 02] 웹서비스 설정"
RandomeIndex "/var/www/html/index.html" "My HTTPS Web Server"
echo "[ OK ] well maid"
# 3) 웹서비스 기동 - httpd.service
echo
echo "[Phases: 03]  웹서비스 기동"
ServiceStart httpd.service

# 4) 방화벽에 등록 - http, https
echo
echo "[Phases: 04] 방화벽 등록"
FWRule http https


