curl -s "$URL" | grep -q "$GREP_PATTERN" || curl -X POST https://api.line.me/v2/bot/message/push \
  -H "Authorization: Bearer $LINE_CHANNEL_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"to\":\"$LINE_USER_ID\",\"messages\":[{\"type\":\"text\",\"text\":\"$MESSAGE\"}]}"
