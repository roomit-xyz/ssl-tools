#!/bin/bash


MINIMUM_TIME_EXPIRED=30
OPENSSL=$(command -v openssl)
SED=$(command -v sed)
DATE=`date +%Y%m%d`
BACKUP="BACKUP"
source env

mkdir -p $BACKUP
if ! [ -f config-opnsense.xml ]
then
    ln -s ${BACKUP}/opnsense-config-${DATE}.xml config-opnsense.xml
fi

python xml-extractor.py
if [ $? -eq 0 ]
then
    echo "Extraction succeed"
else
   echo "Failed Extraction"
fi

if ! [ -d certificate ]
then
    echo "There is no Certificate Extracted"
    exit 1;
fi


for CERT in `ls -1 certificate`
do
USERCERT=`echo ${CERT} | awk -F"/" "{print $2}" |sed 's/\.[^.]*$//'`
CERTDATE=$("${OPENSSL}" x509 -in "certificate/${CERT}" -enddate -noout | "${SED}" 's/notAfter\=//')
DATESECNOW=`date +%s`
CERTDATESEC=`date -d "$CERTDATE" +%s`
DIFFSEC=$((($CERTDATESEC-$DATESECNOW)/86400))
if [ $DIFFSEC -gt ${MINIMUM_TIME_EXPIRED} ]
then
    echo "Opnsense | Openvpn | SSL | $USERCERT have No Expired, Expired Date ${CERTDATE}"
else
   bash $BASE/notify/notif-matrix.sh "OPNSENSE | OPENVPN | Certificate SSL | ${USERCERT} Will Be Expire, Left ${DIFFSEC} Days. Expired Date : ${CERTDATE}"
fi
done

