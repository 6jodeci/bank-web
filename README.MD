readme:
    make create: 
        make postgres 
        make createdb  
        make migrateup 
    make remove:
        make migratedown
        make dropdb
    make sqlc code:
        make sqlc