IFS=', ' read -ra BATTERY <<< $(acpi)
BATTERY_PERCENTAGE="${BATTERY[3]}"
BATTERY_CHARGING="${BATTERY[2]}"

CHARGE_SIGN=' '
if [ $BATTERY_CHARGING == "Charging" ]; then
  CHARGE_SIGN='🔌'
fi

BACKLIGHT_PERCENTAGE=$(light | awk -F '.' '{print $1 }')

IWCONFIG=$(iwconfig wlp3s0)
NETWORK_NAME=$(grep ESSID <<< $IWCONFIG | grep -o '".*' | tr -d '"')
LINK_QUALITY=($(iwconfig wlp3s0 | grep "Link Quality" | rg -o '(\d{2}/\d{2})' | tr '/' ' '))
LINK_QUALITY_PERCENTAGE=$(awk -v link1="${LINK_QUALITY[0]}" -v link2="${LINK_QUALITY[1]}" 'BEGIN {printf "%.2d", link1 * 100 / link2}')

DATE=$(date +'%H:%M')

# Mixer volume | muted
MASTER_VOLUME=$(amixer get Master | grep "Front Left: " | rg -o "\d{1,2}%")

CPU_USAGE=$(top -b -n 1 | perl -lane '/PID/ and $x=1; $x and print' | awk '{totuse = totuse + $9} END {printf("%.2d", totuse)}')

MEMORY_USED=$(free -m | grep Mem: | awk '{ printf("%.2d", ($2-$7)*100/$2) }')

BLUETOOTH=$(vars=($(rfkill | grep bluetooth)); if [ ${vars[3]} = "unblocked" ]; then echo 🅱; fi)

echo 🔋$BATTERY_PERCENTAGE $CHARGE_SIGN 🔈$MASTER_VOLUME 🔆$BACKLIGHT_PERCENTAGE% $BLUETOOTH 📶$NETWORK_NAME $LINK_QUALITY_PERCENTAGE% 💻 $CPU_USAGE% 💾 $MEMORY_USED% $DATE
