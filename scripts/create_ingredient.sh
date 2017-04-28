API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ingredients"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "ingredient": {
      "name": "'"${INGRED}"'",
      "amount": "'"${AMT}"'"
    }
  }'
