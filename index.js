const express = require('express');
const bodyParser = require('body-parser');
const ax = require('axios').default;
const jsonpatch = require('jsonpatch');
const request = require('request');


/// MIDDLEWARE ///
const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));


/// VARIABLES ///
var posx;
var posy;
var check = false;
var count = 0;
var state;
let currentMotionEntity = {
    "current_motion": {
        "type": "mars_agent_physical_robot_msgs.Motion",
        "value": {
            "current_position": {
                "type": "geometry_msgs.PoseStamped",
                "value": {
                    "header": {
                        "type": "std_msgs.Header",
                        "value": {
                            "stamp": {
                                "type": "Time",
                                "value": {
                                    "secs": {
                                        "type": "number",
                                        "value": 560
                                    },
                                    "nsecs": {
                                        "type": "number",
                                        "value": 0
                                    }
                                }
                            },
                            "frame_id": {
                                "type": "string",
                                "value": "/map"
                            },
                            "seq": {
                                "type": "number",
                                "value": 0
                            }
                        }
                    },
                    "pose": {
                        "type": "geometry_msgs.Pose",
                        "value": {
                            "position": {
                                "type": "geometry_msgs.Point",
                                "value": {
                                    "y": {
                                        "type": "number",
                                        "value": 1
                                    },
                                    "x": {
                                        "type": "number",
                                        "value": 1
                                    },
                                    "z": {
                                        "type": "number",
                                        "value": 0
                                    }
                                }
                            },
                            "orientation": {
                                "type": "geometry_msgs.Quaternion",
                                "value": {
                                    "y": {
                                        "type": "number",
                                        "value": 0
                                    },
                                    "x": {
                                        "type": "number",
                                        "value": 0
                                    },
                                    "z": {
                                        "type": "number",
                                        "value": 0
                                    },
                                    "w": {
                                        "type": "number",
                                        "value": 1
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "current_velocity": {
                "type": "geometry_msgs.Twist",
                "value": {
                    "linear": {
                        "type": "geometry_msgs.Vector3",
                        "value": {
                            "y": {
                                "type": "number",
                                "value": 0
                            },
                            "x": {
                                "type": "number",
                                "value": 0
                            },
                            "z": {
                                "type": "number",
                                "value": 0
                            }
                        }
                    },
                    "angular": {
                        "type": "geometry_msgs.Vector3",
                        "value": {
                            "y": {
                                "type": "number",
                                "value": 0
                            },
                            "x": {
                                "type": "number",
                                "value": 0
                            },
                            "z": {
                                "type": "number",
                                "value": 0
                            }
                        }
                    }
                }
            }
        },
        "metadata": {
            "dataType": {
                "type": "dataType",
                "value": {
                    "current_position": {
                        "header": {
                            "stamp": {
                                "secs": "int32",
                                "nsecs": "int32"
                            },
                            "frame_id": "string",
                            "seq": "uint32"
                        },
                        "pose": {
                            "position": {
                                "y": "float64",
                                "x": "float64",
                                "z": "float64"
                            },
                            "orientation": {
                                "y": "float64",
                                "x": "float64",
                                "z": "float64",
                                "w": "float64"
                            }
                        }
                    },
                    "current_velocity": {
                        "linear": {
                            "y": "float64",
                            "x": "float64",
                            "z": "float64"
                        },
                        "angular": {
                            "y": "float64",
                            "x": "float64",
                            "z": "float64"
                        }
                    }
                }
            }
        }
    }
};
 
//METHOD Get position of robot via api and send to patchCurrentPosition()
const getPos = () => {
    ax.get("http://mir.com/api/v2.0.0/status", {}, {
        headers: {
            authorization: 'Basic RGlzdHJpYnV0b3I6NjJGMkYwRjFFRkYxMEQzMTUyQzk1RjZGMDU5NjU3NkU0ODJCQjhFNDQ4MDY0MzNGNENGOTI5NzkyODM0QjAxNA=='
        }
    }).then(function (response) {
        var pos = response.data.position;
        posx = pos.x - 66;
        posy = pos.y - 21;
        console.log(pos.x, pos.y, ", MIR")
        console.log(posx, posy, ", OPIL")
    })
    setTimeout(() => {
        let v = getPos()
        v
    }, 1000);
    patchCurrentPosition(posx, posy);
}

getPos();

//METHOD Replaces coords within JSON of current_motion, will patch to OPIL server via OCB
function patchCurrentPosition(x, y) {

    var thepatch = [
        {
            op: "replace",
            path: "/current_motion/value/current_position/value/pose/value/position/value/y/value",
            value: y
        }, {
            op: "replace",
            path: "/current_motion/value/current_position/value/pose/value/position/value/x/value",
            value: x
        }
    ];

    let newCurrentMotionEntity = jsonpatch.apply_patch(currentMotionEntity, thepatch);
    let newCMEntityStr = JSON.stringify(newCurrentMotionEntity);

    var options = {
        url: "http://130.188.160.84:1026/v2/entities/robot_mir/attrs/",
        headers: {
            'Content-Type': 'application/json',
            'Content-Length': newCMEntityStr.length
        },
        body: newCMEntityStr
    }

    request.patch(options, function (err, res, body) {
        if ((err === null) && (res.statusCode === 200) || (res.statusCode === 204)) { // fPrint("patchCurrentPosition: SUCCESS");
        } else {
            console.log("patchCurrentPosition: FAILED err=" + err + " res=" + JSON.stringify(res) + " body=" + JSON.stringify(body));
            return;
        }
    });
   
}

//METHOD Queuing Mission for grinder, stage 1
function f_processg1(req, res) {
    let buttPress = null;
    buttPress = req.body.data[0].readings.value[0].value.reading.value; //value of button push, true/false
    if (! check && buttPress) {
        check = true;
        console.log("trying");
        count++;
        console.log(count);

        ax.post("http://mir.com/api/v2.0.0/mission_queue", {
            mission_id: "b46962d1-151b-11eb-84e2-94c691a73574"
        }, {
            headers: {
                authorization: 'Basic RGlzdHJpYnV0b3I6NjJGMkYwRjFFRkYxMEQzMTUyQzk1RjZGMDU5NjU3NkU0ODJCQjhFNDQ4MDY0MzNGNENGOTI5NzkyODM0QjAxNA=='
            }
        }).catch(function (error) {
            console.log(error)
        }); // 22305a67-0ebc-11eb-b125-94c691a73574


    } else if (check && ! buttPress) {
        check = false;
    }
    console.log("check" + check);


    // res.send('test');
    res.end();
}

//SERVER, opening port
let server = app.listen(1028, function () {
    console.log("listening on port 1028");
});

/// ROUTES ///
app.post('/read_butt', f_processg1);

app.get('/count', (req, res) => {
    const message = {
        count: count
    };
    return res.end(message)
});
