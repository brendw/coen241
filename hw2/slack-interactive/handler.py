import json
import urllib

def handle(req):
    urlstring = urllib.unquote(req).decode('utf8').strip('payload=')
    response = json.loads(urlstring)
    data = {
        "attachments": [
            {"replace_original": True,
                "response_type": "ephemeral",
                "fallback": "This is a summary.",
                "color": "#36a64f",
                "pretext": "Ahh yeah! Great choice, coen241 is absolutely amazing!",
                "author_name": "",
                "author_link": "https://github.com/brendw/coen241",
                "author_icon": "",
                "title": "coen241",
                "title_link": "https://www.scu.edu",
                "text": "Head over to coen241",
                "image_url": "https://www.scu.edu/media/school-of-engineering/pdfs/graphics/SoE-Grad-Calendard-Headliner-Graphic-2022-2023-1160x294.jpg",
                "thumb_url": "https://www.scu.edu/media/school-of-engineering/photos/computer-engineering-photos/Sushma-760x505.jpg",
                "footer": "Slack Apps built on OpenFaas",
                "footer_icon": "https://a.slack-edge.com/45901/marketing/img/_rebrand/meta/slack_hash_256.png",
                "ts": 123456789
            }
        ]
    }
    return json.dumps(data)

