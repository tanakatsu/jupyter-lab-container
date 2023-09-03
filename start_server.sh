#!/bin/bash

user_id=`id -u $USER`
group_id=`id -g $USER`

USER_ID=${user_id} GROUP_ID=${group_id} docker-compose up
