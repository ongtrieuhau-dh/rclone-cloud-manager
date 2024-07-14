#!/bin/bash

# Đặt tên remote cho hai tài khoản Google Photos từ biến môi trường
remotesource=${remotesource}
remotedest=${remotedest}

# Liệt kê tất cả các album trong tài khoản Google Photos thứ nhất
rclone lsjson "$remotesource:album" --dirs-only | jq -r '.[].Path' > albums.txt

# Đồng bộ và xóa từng album từ tài khoản thứ nhất sang tài khoản thứ hai
while IFS= read -r album; do
    echo "Syncing album: $album"
    # Thực hiện đồng bộ hóa từ tài khoản thứ nhất sang tài khoản thứ hai
    rclone sync "$remotesource:album/$album" "$remotedest:album/$album"
done < albums.txt

echo "Sync and delete files completed!"
