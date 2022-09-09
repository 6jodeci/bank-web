## BANK_SCHEMA

![Simple bank](https://user-images.githubusercontent.com/65400970/189363274-26487859-16aa-48aa-9f0c-103c17b26a87.png)

Install bank-web with makefile

```bash
  make create: 
      make postgres 
      make createdb  
      make migrateup 
  make remove:
      make migratedown
      make dropdb
  make sqlc code:
      make sqlc
  make code test:
      make test
```