#!/bin/bash
# makescript.sh toos.sh
# -> /root/scripts/tools.sh
#    #!/bin/bash
# -> chmod 700 /root/scripts/tools.sh

if [ $# -ne 1 ] ; then
    echo "Usage: $0 <scriptfile>"
    exit 1
fi
SCRIPTFILE=$1
SRCIPTBASE=/root/shell

cat << EOF > $SRCIPTBASE/$SCRIPTFILE
#!/bin/bash


EOF
chmod 700 $SRCIPTBASE/$SCRIPTFILE

