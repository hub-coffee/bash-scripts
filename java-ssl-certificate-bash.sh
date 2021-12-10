#!/bin/bash

#CONSTANT DECLARATION: 
CERT_PATH="/Users/huberson"
CERTIF_FILE_NAME="google-cert.crt"
CERTIF_FILE_ALIAS="maven-rep-google-cert"
DOMAIN="dl.google.com"

#Récupération d'un certificat SSL via openSSL:
printf "%s\n%s" "Donwloading SSL CERT." "Please wait..."
echo " "

#command: 
#echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN":443|\ sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > "$CERTIF_FILE_NAME"
SSL_ERROR=$(openssl s_client -connect "$DOMAIN":443 | openssl x509 -out "$CERTIF_FILE_NAME")

if [ "$SSL_ERROR" != "" ] 
then
    printf "%s\n%s" "SSL ERROR." "$SSL_ERROR"
    echo " "
fi

#Ajout du certificat SSL dans le keystore de java8:

#Command en mode dev:
LOG_JSSE_CACERTS_JHOME=$(sudo  "$JAVA_HOME/bin/keytool" -import \
    -alias "$CERTIF_FILE_ALIAS" -file "$CERTIF_FILE_NAME" \
    -keystore "$JAVA_HOME/jre/lib/security/jssecacerts" -storepass "changeit" -noprompt 2>&1)

printf "%s\n%s" "LOG JSSE_CACERTS_HOME:" "$LOG_JSSE_CACERTS_JHOME"
echo " "


#Command en mode prod:
LOG_CACERTS_JHOME=$(sudo  "$JAVA_HOME/bin/keytool" -import \
    -alias "$CERTIF_FILE_ALIAS" -file "$CERTIF_FILE_NAME" \
    -keystore "$JAVA_HOME/jre/lib/security/cacerts" -storepass "changeit" -noprompt 2>&1)

printf "%s\n%s" "LOG CACERTS_JHOME:" "$LOG_CACERTS_JHOME"
echo " "


#Editer ce fichier en y ajoutant le certificat du site web
cd /Applications/Android\ Studio.app/Contents/jre/Contents/Home/ || exit 0; 

LOG_JDK_ANDROID=$(sudo ./bin/keytool -importcert -alias "$CERTIF_FILE_ALIAS" -file "$CERT_PATH/$CERTIF_FILE_NAME" -keystore ./lib/security/cacerts -storepass "changeit" -noprompt 2>&1)

printf "%s\n%s" "LOG JDK_ANDROID:" "$LOG_JDK_ANDROID"
echo " "

echo "================================="
echo "=========== By Huberson ========="
echo "================================="