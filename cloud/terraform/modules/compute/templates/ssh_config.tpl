%{ for name, instance in instances ~}
Host ${name}
    HostName ${instance.host}
    User ${instance.user}
    IdentityFile ./keys/id_rsa
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

%{ endfor ~} 