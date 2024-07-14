#!/bin/bash

# Đặt tên remote cho hai tài khoản Google Photos từ biến môi trường
remotesource=${remotesource}
remotedest=${remotedest}
rclone sync "$remotesource:media/all" "$remotedest:upload"
echo "Sync and delete files completed!"
