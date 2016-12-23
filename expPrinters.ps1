# BAT version
# powershell -command "& {get-WmiObject -class Win32_printer | ft name,systemName,shareName >> printers.txt}"

# powershell script only
get-WmiObject -class Win32_printer | ft name >> printers.txt
