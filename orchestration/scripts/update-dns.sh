#!/bin/sh
set -e

# Hole aktuelle ngrok URL
NGROK_URL="https://unmuddy-jerilyn-defamingly.ngrok-free.app/" # $(curl -s http://ngrok:4040/api/tunnels | grep -o '"public_url":"https:[^"]*' | head -n1 | sed 's/"public_url":"//')

if [ -z "$NGROK_URL" ]; then
  echo "❌ Keine ngrok URL gefunden"
  exit 1
fi

echo "✅ Gefundene ngrok URL: $NGROK_URL"

# Update Hetzner DNS
curl -s -X POST "https://dns.hetzner.com/api/v1/records" \
  -H "Auth-API-Token: $HETZNER_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{
        \"value\": \"$NGROK_URL\",
        \"ttl\": 60,
        \"type\": \"CNAME\",
        \"name\": \"$SUBDOMAIN\",
        \"zone_id\": \"$HETZNER_ZONE_ID\"
      }"

echo "🌍 Hetzner DNS für $SUBDOMAIN.$DOMAIN → $NGROK_URL aktualisiert"
