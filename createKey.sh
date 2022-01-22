openssl genrsa -out user.key 2048
mv user.key ./users


openssl req -new -key user.key -out user.csr -sub "/CN=user/O=ops/O=all"
