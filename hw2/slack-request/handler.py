import json

def handle(req):
    data = {
        "text": "Serverless Message",
        "attachments": [{
            "title": "The Awesome world of cloud computing introduces: coen241!",
            "fields": [{
                "title": "Amazing Level",
                "value": "10",
                #"short": True
            },
            {
                "title": "Stars",
                "value": "100" 
                #"short": True
            }],
            "author_name": "https://github.com/brendw/coen241",
            "author_icon": "",
            "image_url": "https://media.istockphoto.com/id/497530513/vector/vector-of-fruit-carambola-icon.jpg?s=612x612&w=0&k=20&c=j_s5maSTnHzZwgbombeMtADWCbSrccux_kFp_LYNa5c="
        },
        {
            "title": "About coen241",
            "text": "coen241 is a cloud computing course."
        },
        {
            "fallback": "Would you recommend coen241 to your friends?",
            "title": "Would you recommend coen241 to your friends?",
            "callback_id": "response123",
            "color": "#3AA3E3",
            "attachment_type": "default",
            "actions": [
                {
                    "name": "recommend",
                    "text": "Ofcourse!",
                    "type": "button",
                    "value": "recommend"
                },
                {
                    "name": "no",
                    "text": "Most Definitely Not!",
                    "type": "button",
                    "value": "no"
                }
            ]
        }]
    }
    return json.dumps(data)
