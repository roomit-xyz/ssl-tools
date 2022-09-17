# DONATE

1. Ethereum : <pre>0xB0e6e6c379389bBB30fACD427e02d74d27ec0C78</pre>
2. Near Blockchain : <pre>xoreth.near</pre>
3. Mina Protocol : <pre>B62qiiBBXKN5CdgXv7wPkXxC1prdzQxwfaTMAi3isAeb9F7gCbzi5dU</pre>


# How to Use?

## CHECKER
Just put script to directory 
example :

```
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
```

execution
```
bash ssl-certificate-checker.sh
```


## CSR GENERATOR
How To Use?


Create New CSR
```
bash generate-csr.sh create
```

Check CSR
```
bash generate-csr.sh check
```



## OPNSENSE OPENVPN SSL USER CERTIFICATE CHECKER
Hot To Use?

1. Download Config opnsense *.xml
2. Put into directory BACKUP/*.xml
3. Running Script

```
bash main.sh
```
