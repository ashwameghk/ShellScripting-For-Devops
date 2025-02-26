<<disclaimer
This is just for infotainemnt purpose
disclaimer


read -p "jetha ne mud ke kise dekha:  " bandi 
read -p "jetha ka pyar % " pyaar

if [[ $bandi == "daya bhabi" ]];
then
	echo "jetha is loyal"
elif [[ $pyaar -ge 70]];	
else
	echo "jetha is not loyal"
fi
