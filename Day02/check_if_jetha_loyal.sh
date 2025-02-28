<<disclaimer
This is just for infotainemnt purpose
disclaimer

# This function defination
function is_loyal() {
read -p "$1 ne mud ke kise dekha:  " bandi 
read -p "$1 ka pyar % " pyaar

if [[ $bandi == "daya bhabi" ]];
then
	echo "$1 is loyal"
elif [[ $pyaar -ge 70 ]];	
then
	echo "$1 is  loyal"
else 
	echo "$1 is not loyal" 
fi
}

#This is function call
is_loyal "tom"

