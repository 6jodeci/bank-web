## BANK_SCHEMA

![bank_schema](https://user-images.githubusercontent.com/65400970/177134376-40007e53-318e-464f-8d98-40bf8eb7f930.png)

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