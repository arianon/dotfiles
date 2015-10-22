#! /usr/bin/env python3

import json
import time
import sys

widget_layout = {
    "full_text": "",
    "background": "",
    "color": ""
}

def print_time():
    time_widget = widget_layout
    time_widget["full_text"] = time.strftime("%A, %d of %b - %H:%M:%S")
    time_widget["background"] = "#707e8c"

    return time_widget

print(json.dumps({"version": 1}))
# Begin the endless array.
print("[[],")
while True:
    print(json.dumps([print_time()]) + ",\n", flush=True)
    time.sleep(1)
