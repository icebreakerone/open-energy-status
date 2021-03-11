#!python

import json
import os

ckan_result = os.system("poetry run pytest tests/ckan_test.py")
raidiam_result = os.system("poetry run pytest tests/raidiam.py")

result = {
    "apis": ["CKAN", "Raidiam"],
    "timeSlot": ["Now"],
    "timeSlot1": [str(int(not ckan_result)), str(int(not raidiam_result))],
}

# TODO: Fetch previous results
# TODO: Update the results, removing the oldest if necessary

with open("deploy/data.json", "w") as f:
    f.write(json.dumps(result))
