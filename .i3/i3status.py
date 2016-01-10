#! /usr/bin/env python3.5

import json
import time
# import sys
import threading


class Widget:
    def __init__(self, text="", background="", color=""):
        self.text = text
        self.background = background
        self.color = color

    def __str__(self, *args, **kwargs):
        return json.dumps(
            {
                "text": self.text,
                "background": self.background,
                "color": self.color,
            }, *args, **kwargs)

    def pretty(self):
        return self.__str__(indent=4, sort_keys=True)


class DateTime(Widget):
    def __init__(self, format):
        super().__init__()
        self.format = format

    def update(self):
        self.text = time.strftime(self.format)


if __name__ == '__main__':
    date_label = Widget("DATE", "#8fa1b3")
    date_widget = DateTime("%A, %b of %d")
