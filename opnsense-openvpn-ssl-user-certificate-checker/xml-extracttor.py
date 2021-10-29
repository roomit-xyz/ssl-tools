#!/bin/python


from shutil import rmtree
from xml.etree import cElementTree as ET
import os, glob, urllib, base64



rmtree('certificate', ignore_errors=True)
path = 'certificate'
try: 
    os.mkdir(path) 
except OSError as error: 
    print(error)

file_configuration = "config-opnsense.xml"
tree = ET.parse(file_configuration)
root = tree.getroot()
for page in root.findall('cert'):
    name_file = page.find('descr').text
    f = open("certificate/"+name_file+".txt", "a")
    cert = page.find('crt').text
    f.write(base64.b64decode(cert).decode("utf-8"))
    f.close()

