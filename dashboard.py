#!python

import os

ckan_result = os.system("poetry run pytest tests/ckan_test.py")
raidiam_result = os.system("poetry run pytest tests/raidiam.py")

result_text = "Results are {} and {}\n".format(ckan_result, raidiam_result)

# TODO: Fetch previous results
# TODO: Update the results, removing the oldest if necessary
# TODO: Output the results as JSON for D3 to read

with open("deploy/index.html", "w") as f:
    f.write(result_text)
