curl --location --request POST 'http://localhost:8080/accounts?page_id=1&page_size=10' \
--header 'Authorization: Bearer v2.local.ugKCgUQLU_Vu8dJKQkxFghcsZzQU2mw8qhm_0WZ57yXMEORGiriFPB6Y1gkAxtnbvM7DjFTo-gD40OdKDjXlZD3azG__IFKjqrnjMNc3QCNUazOsaDHLEATYlqHMOE9HTw3sNR2_e5XLlARxZC3k78Yidz-V-70OEIf5ytrVOw17n684nzo8nzDLPEQNgdnIz22B7Ur7ZeeiaR5s3GbK0RbAUD0-tTwJRiGomD4Mm7ZnVPQskTO9NZPtnFzRHFpLmOGm-DQB76xdn5VEosUe-g.bnVsbA' \
--header 'Content-Type: application/json' \
--data-raw '{
    "id": 2,
    "owner": "6jodeci",
    "currency": "EUR",
    "balance": "100"
}'