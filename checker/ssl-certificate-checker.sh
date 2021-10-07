#!/bin/bash
# Dwiyan 
#
#
#
#
# WORK_DIR
# |
# |-----ssl-certificate-checker.sh
# |
# |-----wajatmaka.com/
# |          |
# |          |---wajatmaka.com.csr
# |          |---wajatmaka.com-int.crt
# |          |---wajatmaka.com.key
# |------other/
# |        |----file_certificate


for i in `ls -1 |grep -v checkup`
do 
   echo ############## $i ################
   for x in `ls -1 $i/*.key`
   do
      echo "CHECK PRIVATE KEY MD5";
      openssl rsa -noout -modulus -in $x | openssl md5
   done

   for y in `ls -1 $i/*.csr`
   do
      echo "CHECK CSR MD5"
      openssl req -noout -modulus -in $y | openssl md5
     
      echo "CHECK Signature Algorithm"
      openssl req -in $y -noout -text | grep "Signature Algorithm"
      
      echo "CHECK Public Key Algoritm"
      openssl req -in $y -noout -text | grep "Public Key Algorithm"
   
      echo "CHECK Information"
      openssl req -in $y -noout -text | grep "Subject:"
   done

done
