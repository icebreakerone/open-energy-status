#!python

import re
import requests


def test_http_response():
    r = requests.get("https://dukeofyork.netlify.app/")

    assert r.status_code == 200

    expected_text = "UP"
    assert re.search("\\b%s\\b" % expected_text, r.text) is not None
