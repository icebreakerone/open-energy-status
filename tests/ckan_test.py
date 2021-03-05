#!python

import re
import requests
import sys


def test_http_response():
    r = requests.get("http://search.energydata.org.uk/dataset")

    assert r.status_code == 200

    expected_text = "Energy Data Search"
    assert re.search("\\b%s\\b" % expected_text, r.text) is not None
