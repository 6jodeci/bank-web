curl --location --request POST 'http://localhost:8080/users' \
--header 'Content-Type: application/json' \
--data-raw '{
    "username":"6jodeci",
    "password":"secret",
    "full_name":"Egor",
    "email":"egorr@mail.com"
}'