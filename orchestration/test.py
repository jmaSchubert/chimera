# Install the Python Requests library:
# `pip install requests`

import requests


def send_request():
    # Get Zones
    # GET https://dns.hetzner.com/api/v1/zones

    try:
        response = requests.get(
            url="https://dns.hetzner.com/api/v1/zones",
            headers={
                "Auth-API-Token": "V7Bdhx0wK2s5fVqLN2ZDpj0sUkaGmerR",
            },
        )
        print('Response HTTP Status Code: {status_code}'.format(
            status_code=response.status_code))
        print('Response HTTP Response Body: {content}'.format(
            content=response.content))
    except requests.exceptions.RequestException:
        print('HTTP Request failed')

if __name__ == "__main__":
    send_request()
