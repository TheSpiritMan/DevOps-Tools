cat<<EOF >> ~/.bashrc
alias k='kubectl'
alias kd='kubectl describe'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
EOF
cd
source ~/.bashrc