# API

## Авторизация
Запрос:
```
curl -X POST \
    -d email="user@example.com" -d password="12345678" \
    http://localhost:3000/authenticate
```
Ответ:
```json
{
  "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.3xruFA5pQ3tlc61STFAyq2FSSx9Frj1uzGFFWtGqcYM",
  "user": {
    "id": 1,
    "email": "user@example.com"
  }
}
```

Для доступа к апи в запросах нужно передавать заголово содержащий полученный токен:
```
"Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.3xruFA5pQ3tlc61STFAyq2FSSx9Frj1uzGFFWtGqcYM"
```

Ошибка авторизации:
```json
{
  "error": "Unsuccessful auth"
}
```
