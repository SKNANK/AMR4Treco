
echo CREATING ROBOT  robot_mir

curl http://130.188.160.84:1026/v2/entities -s -S -H 'Content-Type: application/json' -d @- <<EOF
  {
    "id": "robot_mir",
    "type": "ROBOT",
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
    },
    "robot_description": {
      "type": "mars_agent_physical_robot_msgs.RobotAgentProperties",
      "value": {
        "batt_capacity": {
          "type": "number",
          "value": 1
        },
        "weight": {
          "type": "number",
          "value": 0
        },
        "max_pos_ang_acc": {
          "type": "number",
          "value": 0.5
        },
        "max_neg_x_vel": {
          "type": "number",
          "value": 1.100000024
        },
        "payload": {
          "type": "number",
          "value": 0
        },
        "max_pos_x_vel": {
          "type": "number",
          "value": 1.100000024
        },
        "action_capability": {
          "type": "array",
          "value": [],
          "metadata": {
            "dataType": {
              "type": "dataType",
              "value": "mars_agent_physical_robot_msgs/RobotAction[]"
            }
          }
        },
        "robot_id": {
          "type": "mars_common_msgs.Id",
          "value": {
            "uuid": {
              "type": "array",
              "value": [
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 0
                },
                {
                  "type": "number",
                  "value": 1
                }
              ],
              "metadata": {
                "dataType": {
                  "type": "dataType",
                  "value": "uint8[16]"
                }
              }
            },
            "description": {
              "type": "string",
              "value": ""
            }
          }
        },
        "type": {
          "type": "mars_agent_physical_robot_msgs.VehicleType",
          "value": {
            "vehicle_type": {
              "type": "number",
              "value": 0
            }
          }
        },
        "max_neg_ang_acc": {
          "type": "number",
          "value": 0.5
        },
        "vendor": {
          "type": "string",
          "value": "default"
        },
        "max_pos_y_vel": {
          "type": "number",
          "value": 1.100000024
        },
        "max_height": {
          "type": "number",
          "value": 1
        },
        "velocity_control_sensitivity": {
          "type": "number",
          "value": 1
        },
        "min_height": {
          "type": "number",
          "value": 1
        },
        "max_pos_y_acc": {
          "type": "number",
          "value": 0.5
        },
        "footprint": {
          "type": "geometry_msgs.PolygonStamped",
          "value": {
            "header": {
              "type": "std_msgs.Header",
              "value": {
                "stamp": {
                  "type": "Time",
                  "value": {
                    "secs": {
                      "type": "number",
                      "value": 0
                    },
                    "nsecs": {
                      "type": "number",
                      "value": 0
                    }
                  }
                },
                "frame_id": {
                  "type": "string",
                  "value": ""
                },
                "seq": {
                  "type": "number",
                  "value": 0
                }
              }
            },
            "polygon": {
              "type": "geometry_msgs.Polygon",
              "value": {
                "points": {
                  "type": "array",
                  "value": [
                    {
                      "type": "geometry_msgs.Point32",
                      "value": {
                        "y": {
                          "type": "number",
                          "value": 0.349999994
                        },
                        "x": {
                          "type": "number",
                          "value": 0.270000011
                        },
                        "z": {
                          "type": "number",
                          "value": 0
                        }
                      }
                    },
                    {
                      "type": "geometry_msgs.Point32",
                      "value": {
                        "y": {
                          "type": "number",
                          "value": 0.349999994
                        },
                        "x": {
                          "type": "number",
                          "value": -0.870000005
                        },
                        "z": {
                          "type": "number",
                          "value": 0
                        }
                      }
                    },
                    {
                      "type": "geometry_msgs.Point32",
                      "value": {
                        "y": {
                          "type": "number",
                          "value": -0.349999994
                        },
                        "x": {
                          "type": "number",
                          "value": -0.870000005
                        },
                        "z": {
                          "type": "number",
                          "value": 0
                        }
                      }
                    },
                    {
                      "type": "geometry_msgs.Point32",
                      "value": {
                        "y": {
                          "type": "number",
                          "value": -0.349999994
                        },
                        "x": {
                          "type": "number",
                          "value": 0.270000011
                        },
                        "z": {
                          "type": "number",
                          "value": 0
                        }
                      }
                    }
                  ],
                  "metadata": {
                    "dataType": {
                      "type": "dataType",
                      "value": "geometry_msgs/Point32[]"
                    }
                  }
                }
              }
            }
          }
        },
        "max_pos_ang_vel": {
          "type": "number",
          "value": 0
        },
        "max_neg_y_acc": {
          "type": "number",
          "value": 0.5
        },
        "max_pos_x_acc": {
          "type": "number",
          "value": 0.5
        },
        "max_neg_y_vel": {
          "type": "number",
          "value": 1.100000024
        },
        "max_neg_ang_vel": {
          "type": "number",
          "value": 1.100000024
        },
        "batt_max_voltage": {
          "type": "number",
          "value": 1
        },
        "max_neg_x_acc": {
          "type": "number",
          "value": 0.5
        },
        "min_turning_radius": {
          "type": "number",
          "value": 0
        }
      },
      "metadata": {
        "dataType": {
          "type": "dataType",
          "value": {
            "batt_capacity": "float32",
            "weight": "float32",
            "max_pos_ang_acc": "float32",
            "max_neg_x_vel": "float32",
            "payload": "float32",
            "max_pos_x_vel": "float32",
            "action_capability": "mars_agent_physical_robot_msgs/RobotAction[]",
            "robot_id": {
              "uuid": "uint8[16]",
              "description": "string"
            },
            "type": {
              "vehicle_type": "uint8"
            },
            "max_neg_ang_acc": "float32",
            "vendor": "string",
            "max_pos_y_vel": "float32",
            "max_height": "float32",
            "velocity_control_sensitivity": "float32",
            "min_height": "float32",
            "max_pos_y_acc": "float32",
            "footprint": {
              "header": {
                "stamp": {
                  "secs": "int32",
                  "nsecs": "int32"
                },
                "frame_id": "string",
                "seq": "uint32"
              },
              "polygon": {
                "points": "geometry_msgs/Point32[]"
              }
            },
            "max_pos_ang_vel": "float32",
            "max_neg_y_acc": "float32",
            "max_pos_x_acc": "float32",
            "max_neg_y_vel": "float32",
            "max_neg_ang_vel": "float32",
            "batt_max_voltage": "float32",
            "max_neg_x_acc": "float32",
            "min_turning_radius": "float32"
          }
        }
      }
    }
  }
EOF

