openssl genrsa -out user.key 2048
mv user.key ./users


openssl req -new -key user.key -out user.csr -sub "/CN=user/O=ops/O=all"

#ca cert and key located in /etc/kuberentes/pki for kubeadm
openssl x509 -req -CA ca.pem -CAkey ca-key.pem -CAcreateserial -days 730 -in user.csr -out user.crt

#set credentials in cluster
kubectl config set-credentials user-prod --client-sertificate=/home/vagrant/.kube/users/user.crt --client-key=/home/vagrant/.kube/users/user.pem

#set context
k config set-context user-prod --cluster=prod--user=user --namespace=optional
