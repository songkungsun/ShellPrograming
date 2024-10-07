#!/bin/bash
############################3
# 1. telnet 
# 2. vsftpd
# 3. ?
###########################
set -e


source /root/shell/functions.sh

##############################################3
# 1. telnet
echo "[TELNET 서비스]"
# 1) 패키지 설치  telnet-server,telnet
PKGS="telnet-server telnet"
echo "Phase 01 패키지 설치" 
PkgInstall $PKGS
echo
# 2) 서비스 기동 telnet,socket
SVCS="telnet.socket"
echo "Phase 02 $SVCS 서비스 기동"
ServiceStart $SVCS
# 3) 방화벽 등록
RULES="telnet"
echo "Phase 03 $RULES 방화벽 등록"
FWRule $RULES
##################################################3

####################################################
# 2. vsftpd
echo "[FTP 서비스]"
# 1) 패키지 설치  vsftpd,ftp
PKGS="vsftpd ftp"
echo "Phase 01 패키지 설치" 
PkgInstall $PKGS
echo
# 2) 서비스 설정 /etc/vsftpd/{ftpusers,user_list}
FTPUSERS=/etc/vsftpd/ftpusers
USER_LIST=/etc/vsftpd/user_list
echo "Phase 2 유저 설정"
for i in $FTPUSERS $USER_LIST
do
    sed -i 's/^root/#root/' $i
done
echo "[OK] root 사용자 허용 설정 완료"


# 3) 서비스 기동 vsft[d.service]
SVCS="vsftpd.service"
echo "Phase 03 $SVCS 서비스 기동"
ServiceStart $SVCS
# 4) 방화벽 등록 ftp
RULES="ftp"
echo "Phase 04 $RULES 방화벽 등록"
FWRule $RULES
#################################3

