#!/bin/bash

# Đặt tên remote cho hai tài khoản Google Photos
REMOTE1="googlephoto-ongtrieuhau861.s24ultra@gmail.com"
REMOTE2="googlephoto-ongtrieuhau861.s24ultra.001@gmail.com"

# Liệt kê tất cả các album trong tài khoản Google Photos thứ nhất
albums=$(rclone lsd $REMOTE1:album | awk '{print $5}')

# Đồng bộ và xóa từng album từ tài khoản thứ nhất sang tài khoản thứ hai
for album in $albums; do
    echo "Syncing album: $album"
    # rclone sync $REMOTE1:album/$album $REMOTE2:album/$album
done

echo "Sync and delete files completed!"