# Read the printers.txt file (post sed)
$printerList = Get-Content "printers.txt"

# Install each printer from list as network printer
# _does not req elevated privileges_
foreach($printerInst in $printerList) {
   add-printer -connectionname $printerInst
}


# $user = Get-Content "test.txt"
# $path = "\\abnas2\abusers\users"
# $path2 = "\\abnas2\abdept\dept\testcopy"
# $Copy = Copy-Item -path $path\$user\ * -Destination $path2\$user

# foreach($username in $user) {
#    Copy-Item -path $path\$username\* -Destination $path2\$username\
# }
