#!python

import re
import requests


# Accessing the directory redirects to auth for unauthenticated users
def test_directory_redirects():
    r = requests.get("https://web.directory.energydata.org.uk/", allow_redirects=False)

    assert r.status_code == 302
    assert re.match("https://auth.directory.energydata.org.uk/", r.headers["location"])


# The auth endpoint returns JSON
def test_auth_http_response():
    r = requests.get("https://auth.directory.energydata.org.uk/")

    assert r.status_code == 200
    assert re.match("application/json", r.headers["content-type"])
