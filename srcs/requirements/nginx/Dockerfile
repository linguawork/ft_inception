#the commands can be written in lower case(big letters are for differentiation matters)
#but in VSCode we still have colored fonts for differentiation
From debian:buster
Run apt-get update
Run apt-get install nginx -y procps
Run apt-get install openssl -y &&  apt-get install dialog apt-utils -y && apt-get upgrade

#all the flags are written in the COM file 
# the manual is at  https://www.openssl.org/docs/man3.0/man1/openssl-req.html

# Это открытая (.crt) и приватная (.key) части сертификата SSL. Посмотрите этот вопрос, чтобы получить множество соответствующей информации, например, если вы хотите создать сертификат самостоятельно или купить его.
# req – stands for request for creating a certificate (1-10)
# -x509 command is a multi purpose certificate utility. It can be used to display certificate information, convert certificates to various forms, sign certificate requests like a "mini CA" or edit certificate trust settings.
# -nodes This option is deprecated since OpenSSL 3.0; use -noenc instead.
# -noenc If this option is specified then if a private key is created it will not be encrypted.
# -days n When -x509 is in use this specifies the number of days to certify the certificate for, otherwise it is ignored. n should be a positive integer. The default is 30 days.

# -newkey arg This option implies the -new flag to create a new certificate request or a new certificate in case -x509 is given.
# Опция от -newkey rsa [rsa:]nbits generates an RSA key nbits in size. If nbits is omitted, i.e., -newkey rsa is specified, the default key size specified in the configuration file with the default_bits option is used if present, else 2048.

# keyout [filename] gives the filename to write any private key to that has been newly created or read from -key. If neither the -keyout option nor the -key option are given then the filename specified in the configuration file with the default_keyfile option is used, if present. Thus, if you want to write the private key and the -key option is provided, you should provide the -keyout option explicitly. If a new key is generated and no filename is specified the key is written to standard output.
# out filename specifies the output filename to write to or standard output by default.

# -subj arg Sets subject name for new request or supersedes the subject name when processing a certificate request.
# The arg must be formatted as /type0=value0/type1=value1/type2=.... Special characters may be escaped by \ (backslash), whitespace is retained. Empty values are permitted, but the corresponding type will not be included in the request. Giving a single / will lead to an empty sequence of RDNs (a NULL-DN). Multi-valued RDNs can be formed by placing a + character instead of a / between the AttributeValueAssertions (AVAs) that specify the members of the set. Example:
# /DC=org/DC=OpenSSL/DC=users/UID=123456+CN=John Doe

#copy ssl cert and key
COPY ./nginx.crt /etc/ssl/certs/
COPY ./nginx.key /etc/ssl/private/
Run openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=Linguawork/OU=MandzhievBS/CN=https:\/\/github.com\/linguawork/emailAddress=mixedworldcitizen@gmail.com"

#copy the default config from the root folder inside container folder
COPY ./conf/default etc/nginx/sites-enabled/default

#Nginx uses the daemon off directive to run in the foreground. If it's inconvenient to put this in the configuration file, we can specify it directly on the command line. This makes it easy to run in debug mode (foreground) and directly switch to running in production mode (background) by changing command line args. To run in foreground: nginx -g 'daemon off;' To run in background: nginx  По умолчанию в современным nginx image прописана команда запуск nginх на переднем плане чтобы можно было дебажить
CMD ["nginx", "-g", "daemon off;"]

