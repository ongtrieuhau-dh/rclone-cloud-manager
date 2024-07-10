#!/bin/bash

# Đặt tên remote cho hai tài khoản Google Photos
REMOTE1="googlephoto-ongtrieuhau861.s24ultra@gmail.com"
REMOTE2="googlephoto-ongtrieuhau861.s24ultra.001@gmail.com"

# Liệt kê tất cả các album trong tài khoản Google Photos thứ nhất
rclone lsjson $REMOTE1:album --dirs-only | jq -r '.[].Path' > albums.txt

# Đồng bộ và xóa từng album từ tài khoản thứ nhất sang tài khoản thứ hai
while IFS= read -r album; do
    echo "Syncing album: $album"
    # Thực hiện đồng bộ hóa từ tài khoản thứ nhất sang tài khoản thứ hai
    # rclone sync "$REMOTE1:album/$album" "$REMOTE2:album/$album"
done < albums.txt

echo "Syncing album: LogoAI"
rclone sync "$REMOTE1:album/LogoAI" "$REMOTE2:album/LogoAI"

echo "Sync and delete files completed!"
