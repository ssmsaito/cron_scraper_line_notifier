curl -s "$URL" | grep -q "$GREP_PATTERN"
GREP_EXIT=$?

# NOTIFY_ON=hit  → ヒットしたとき通知
# NOTIFY_ON=miss → ヒットしなかったとき通知
if { [ "$NOTIFY_ON" = "hit" ] && [ $GREP_EXIT -eq 0 ]; } || \
   { [ "$NOTIFY_ON" = "miss" ] && [ $GREP_EXIT -ne 0 ]; }; then
  curl -X POST https://api.line.me/v2/bot/message/push \
    -H "Authorization: Bearer $LINE_CHANNEL_ACCESS_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{\"to\":\"$LINE_USER_ID\",\"messages\":[{\"type\":\"text\",\"text\":\"$MESSAGE\"}]}"
fi
