#!/bin/bash

# Variable definiations
PASSWD=/etc/passwd

# Function
Menu() {
    cat << EOF

############################################    
(관리 목록)
###########################################
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
############################################   
EOF
}

UserAdd(){
    echo
    echo "사용자 추가"
    echo -n "추가할 사용자 이름 : "
    read UNAME

    useradd $UNAME
    [ $? -eq 0 ] \
        && echo "OK GOOD ADD" \
        || echo "FAIL NOWAY "
        echo $UNAME | passwd --stdin $UNAME > /dev/null 2>&1
}
UserVerify() {
    cat << EOF


(사용자 확인)
------------------------------------
$(awk -F : '$3 >= 1000 && $3 <=600000 {print $1}' /etc/passwd | nl)
------------------------------------
EOF
}
UserDel() {
    echo
    echo "사용자 삭제"
    echo -n "삭제할 사용자 이름 : "
    read UNAME

    userdel -r $UNAME
    [ $? -eq 0 ] \
        && echo "OK GOOD REMOVE" \
        || echo "FAIL NOWAY"
}


# Main
while true
do
    Menu
    echo -n "num (1|2|3|4)  : "
    read NUM

    case $NUM in 
        1)      UserAdd                     ;;
        2)      UserVerify                  ;;
        3)      UserDel                     ;;
        4)      break                       ;;
        *)      echo "[WARN] WRONG NUMBER"  ;;
    esac
done

