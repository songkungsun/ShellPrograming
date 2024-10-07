#!/bin/bash

# Fnction definition
WHO() {
    who | boxes -d santa
}
DATE() {
    date |boxes -d bear
}
EXIT() {
    echo "[FIAL] 잘못된 만남"
    exit 2
}

cat << EOF
====================================================
  (1). who      (2). date     (3). pwd              
====================================================
EOF

echo -n "Enter Your Choice(1-3)? : "  
read NUMBER

case $NUMBER in                          
    1) WHO  ;;
    2) DATE ;;
    3) pwd  ;;
    *) EXIT ;;
esac
