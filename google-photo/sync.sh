# #!/bin/bash

# # Đặt tên remote cho hai tài khoản Google Photos
# REMOTE1="googlephoto-ongtrieuhau861.s24ultra@gmail.com"
# REMOTE2="googlephoto-ongtrieuhau861.s24ultra.001@gmail.com"

# # Liệt kê tất cả các album trong tài khoản Google Photos thứ nhất
# rclone lsjson $REMOTE1:album --dirs-only > albums.json

# # Đồng bộ và xóa từng album từ tài khoản thứ nhất sang tài khoản thứ hai
# albums=$(jq -r '.[].Path' albums.json)
# for album in $albums; do
#     album=$(echo $album | tr -d '"')
#     echo "Syncing album: $album"
#     # rclone sync googlephotos:album/"$album" /path/to/local/albums/"$album"
# done

# echo "Sync and delete files completed!"



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

echo "Sync and delete files completed!"
