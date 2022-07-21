# Config Vault-in-pod


## Steps

### Build Your Own Certificate Authority (CA) 

1. login Vault-at-Home or Vault-at-Hardware
2. create a new policy:  vault-in-pod.hcl

```markdwon
# Enable secrets engine
path "sys/mounts/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# List enabled secrets engine
path "sys/mounts" {
  capabilities = [ "read", "list" ]
}

# Work with pki secrets engine
path "pki*" {
  capabilities = [ "create", "read", "update", "delete", "list", "sudo" ]
}
```
3. create a internediate CA that signed by the root CA.


4. generate a CA for the target domain.

