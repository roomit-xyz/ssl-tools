#!/bin/bash
# Dwi
# @luneareth


DOMAIN="1rstwap.com";

PARAM=$1



function help(){
          echo "How To Use?"
	  echo "Create New CSR"
	  echo "bash generate-csr.sh create"
	  echo ""
	  echo "Check CSR"
	  echo "bash generate-csr.sh check"
}


if [ -z $PARAM ]
then
    echo ;
fi

case $PARAM in
     check|Check|CHECK) 
          echo "Checking CSR"
          openssl req -in csr/$DOMAIN.csr -noout -text
     ;;
     create|Create|CREATE)
          if [ -d csr ] || [ -f csr/$DOMAIN.csr ] || [ -f csr/$DOMAIN.key ]
          then
             echo "Directory CSR  and File CSR Already Generated Before"
             read -p "Are You Sure For Delete this Directory and Certificate? [Y/n]" hapus
             if [ ${hapus} == "y" ] || [ ${hapus} == "Y" ]
             then
                 rm  csr/$DOMAIN.csr
                 rm  csr/$DOMAIN.key
                 rmdir csr
             else
                 echo "Remove Cancelled"
                 exit 0;
             fi
          else
             echo "Creating CSR"
             mkdir -p csr/
             openssl req -new -config config.conf  -newkey rsa:2048 -nodes -out csr/$DOMAIN.csr -keyout csr/$DOMAIN.key
             echo "Checking CSR"
             openssl req -in csr/$DOMAIN.csr -noout -text
          fi
      ;;
      help|Help|--help|HELP|--HELP|-h|-H)
	  help;
      ;;
      *)
	 help;
      ;;
esac
