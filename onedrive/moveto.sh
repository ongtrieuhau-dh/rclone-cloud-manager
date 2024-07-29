#!/bin/bash

# Đặt tên remote cho hai tài khoản Rclone
remotesource=${remotesource}
remotedest=${remotedest}
rclone moveto "$remotesource:" "$remotedest:" -v > ./.artifact/output.txt
echo "Moveto and delete files completed!"
