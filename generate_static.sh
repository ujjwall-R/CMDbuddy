#!/bin/bash

# Fetch machine information
echo "Generating system information"
os=$(uname -s)
host=$(hostname)
kernel=$(uname -r)
uptime=$(uptime -p)
packages=$(if command -v dpkg &> /dev/null; then dpkg -l | grep -c '^ii'; elif command -v rpm &> /dev/null; then rpm -qa | wc -l; else echo "N/A"; fi)
shell=$(echo $SHELL)
resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')
de=$(if command -v gnome-shell &> /dev/null; then gnome-shell --version | awk '{print $3}'; elif command -v xfce4-session &> /dev/null; then xfce4-session --version | awk 'NR==1{print $2}'; else echo "N/A"; fi)
wm=$(if command -v wmctrl &> /dev/null; then wmctrl -m | grep "Name" | awk '{print $2}'; else echo "N/A"; fi)
wm_theme=$(if [ -n "$XDG_CURRENT_DESKTOP" ]; then gsettings get org.gnome.desktop.wm.preferences theme | awk -F "'" '{print $2}'; else echo "N/A"; fi)
theme=$(if [ -n "$XDG_CURRENT_DESKTOP" ]; then gsettings get org.gnome.desktop.interface gtk-theme | awk -F "'" '{print $2}'; else echo "N/A"; fi)
icons=$(if [ -n "$XDG_CURRENT_DESKTOP" ]; then gsettings get org.gnome.desktop.interface icon-theme | awk -F "'" '{print $2}'; else echo "N/A"; fi)
terminal=$(ps -p $$ -o args=)

cpu=$(lscpu | grep "Model name" | awk -F ":" '{print $2}' | sed 's/^[ \t]*//')
gpu=$(lspci | grep -i "VGA" | awk -F ":" '{print $3}' | sed 's/^[ \t]*//')
memory=$(free -m | awk '/Mem/ {print $3"MiB / "$2"MiB"}')
version=$(bash --version | head -n 1 | awk '{print $4}')

# Create JSON output
json_output="{\"doc\":\"infos: \\\"OS\\\":\\\"$os\\\",\\\"Host\\\":\\\"$host\\\",\\\"Kernel\\\":\\\"$kernel\\\",\\\"Uptime\\\":\\\"$uptime\\\",\\\"Packages\\\":\\\"$packages\\\",\\\"Shell\\\":\\\"$shell\\\",\\\"Resolution\\\":\\\"$resolution\\\",\\\"DE\\\":\\\"$de\\\",\\\"WM\\\":\\\"$wm\\\",\\\"WM Theme\\\":\\\"$wm_theme\\\",\\\"Theme\\\":\\\"$theme\\\",\\\"Icons\\\":\\\"$icons\\\",\\\"Terminal\\\":\\\"$terminal\\\",\\\"CPU\\\":\\\"$cpu\\\",\\\"GPU\\\":\\\"$gpu\\\",\\\"Memory\\\":\\\"$memory\\\",\\\"Version\\\":\\\"$version\\\"\"}"

# Write JSON output to file
echo $json_output > examples/data/pathway-docs/machinespecs.jsonl

# Print the JSON output
echo $json_output
