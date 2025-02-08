#!/usr/bin/env python3

import subprocess
import json


def get_workspaces():
    """Lấy thông tin các workspace từ Hyprland."""
    output = subprocess.check_output(["hyprctl", "workspaces", "-j"])
    return json.loads(output.decode("utf-8"))

def get_activeworkspace():
    """Lấy thông tin workspace đang hoạt động từ Hyprland."""
    output = subprocess.check_output(["hyprctl", "activeworkspace", "-j"])
    return json.loads(output.decode("utf-8"))

def generate_workspace_data() -> dict:
    """Tạo dữ liệu workspace theo monitor."""
    data = {}
    spaces = get_workspaces()
    activespace = get_activeworkspace()
    for wsp in spaces:
        monitor = wsp["monitor"]
        if monitor not in data:
            data[monitor] = []

        # Kiểm tra nếu workspace đang hoạt động
        if wsp["name"] == activespace["name"]:
            workspace_data = {
                "name": wsp["name"],
                "monitor": monitor,
                "class": "focused",
                "icon": "󰋑",
                "title": wsp.get('lastwindowtitle', 'N/A')
            }
        else:
            workspace_data = {
                "name": wsp["name"],
                "monitor": monitor,
                "class": "visible",
                "icon": "",
                "title": wsp.get('lastwindowtitle', 'N/A')
            }

        data[monitor].append(workspace_data)
    
    # Sắp xếp workspace theo tên
    for monitor in data:
        data[monitor].sort(key=lambda x: x["name"])

    return data

def main():
    """Chạy và lắng nghe sự kiện từ Hyprland."""
    # Đăng ký sự kiện của Hyprland
    process = subprocess.Popen(
        ["hyprctl", "subscribe", "workspaces"],
        stdout=subprocess.PIPE,
    )
    if process.stdout is None:
        print("Error: could not subscribe to Hyprland events")
        exit(1)

    # Lấy dữ liệu ban đầu
    current_data = generate_workspace_data()
    print(json.dumps(current_data), flush=True)

    # Lắng nghe sự kiện
    while True:
        line = process.stdout.readline().decode("utf-8").strip()

        # Mỗi khi có sự kiện, cập nhật dữ liệu workspace
        new_data = generate_workspace_data()
        if new_data != current_data:
            current_data = new_data
            print(json.dumps(current_data), flush=True)


if __name__ == "__main__":
    main()

