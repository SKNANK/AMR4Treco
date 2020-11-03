port=1028

if [ $# -eq 0 ]
then
  ip=192.168.0.34
  #Check if needs to be changed, should be ip of where server (this) is running from
  #192.168.0.34
else
  ip=$1
fi

echo $ip

curl -v http://130.188.160.84:1026/v2/subscriptions -s -S -H 'Content-Type: application/json' -d @- <<EOF 2>/dev/null
{
  "description": "button startTaskButton1 subscription",
  "subject": {
    "entities": [
      {
        "id": "startTaskButton1",
        "type": "SensorAgent"
      }
    ],
    "condition": {
      "attrs": [
        "readings"
      ]
    }
  },
  "notification": {
    "http": {
      "url": "http://$ip:$port/read_butt"
    },
    "attrs": [
      "readings"
    ]
  }
}
EOF

