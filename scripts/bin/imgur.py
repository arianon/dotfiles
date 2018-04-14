#!/usr/bin/env python

import base64
import json
import requests
import click

URL = 'https://api.imgur.com/3/image'
AUTHORIZATION = 'Client-ID c9a6efb3d7932fd'


@click.command()
@click.argument('images', type=click.File('rb'), nargs=-1)
def imgur(images):
    session = requests.Session()
    session.headers['Authorization'] = AUTHORIZATION

    for image in images:
        response = session.post(URL, data=image)

        if res.status_code >= 400:
            click.echo('Failed to upload image "%s"' % image, err=True)
            continue

        url = response.json()['data']['link']
        click.echo(url)


if __name__ == '__main__':
    imgur()
