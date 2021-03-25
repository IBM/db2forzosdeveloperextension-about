# Code signature validation

This zip file contains IBM® Db2® for z/OS® Developer Extension 1.1.2 and code signing signatures to verify the binary of Db2 Developer Extension.

## How to verify the code signing signatures

The db2forzosdeveloperextension-1.1.2.zip file contains .vsix, .sig and .pem files, which are used to verify the binary files.

After you extract the files from the zip file, you can verify the code signing signatures for the .vsix file by completing the following instructions.

1. If you have not already done so, install [OpenSSL](https://www.openssl.org/).

2. Check the certificate validity.

    a. To view the certificate details, issue the following command:
    ~~~~
    $ openssl x509 -text -in certificate.pem -noout
    ~~~~
    b. To view the public key details, issue the following command:
    ~~~~
    $ openssl rsa -noout -text -inform PEM -in public.pem -pubin
    ~~~~
    c. Compare the exponent of the public key and the certificate to ensure that the public key is the one within the certificate. You can also use any other certificate viewer, such as Mac OS Preview.

    d. To check the validity of IBM public certificate, issue the following command:
    ~~~~
    $ openssl ocsp -no_nonce -issuer chain0.pem -cert certificate.pem -VAfile chain0.pem -text -url http://ocsp.digicert.com -respout ocsptest
    ~~~~
    If the certificate is valid, the following line will be displayed near the bottom of the output:
    ~~~~
    Response verify OK
    ~~~~
3. Verify the downloaded binary file of Db2 Developer Extension 1.1.2.

    To verify the file by using the signature and public key files, issue the following command:
    ~~~~
    $ openssl dgst -sha256 -verify public.pem -signature db2forzosdeveloperextension-1.1.2.vsix.sig db2forzosdeveloperextension-1.1.2.vsix
    ~~~~
    If the binary verification is successful, the output is:
    ~~~~
    Verified OK
    ~~~~
