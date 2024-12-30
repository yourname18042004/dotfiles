#!/bin/bash

# Đường dẫn tới thư mục chứa hình ảnh
WALLPAPER_DIR="$HOME/dotfiles/wallpaper"

# Kiểm tra xem thư mục có tồn tại không
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Thư mục không tồn tại: $WALLPAPER_DIR"
    exit 1
fi

# Thời gian giữa các lần thay đổi hình nền (đơn vị: giây)
INTERVAL=300

# Khởi tạo swww daemon nếu chưa chạy
if ! pgrep -x "swww" > /dev/null; then
    swww init
fi

while true; do
    # Chọn ngẫu nhiên một file ảnh từ thư mục ảnh
    IMAGE=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1)
    
    # Kiểm tra xem ảnh có tồn tại không
    if [ -z "$IMAGE" ]; then
        echo "Không tìm thấy hình ảnh trong thư mục."
        exit 1
    fi

    # Đặt hình nền với hiệu ứng mờ dần (fade)
    swww img "$IMAGE" --transition-type grow --transition-duration 2 &&  wal -i "$IMAGE" 

    # Đợi đến lần thay đổi tiếp theo
    sleep $INTERVAL
done
