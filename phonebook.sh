#usr/bin/bash

viewcontactlist(){
	#if phonebook.txt exist print whats inside it
	if [ -e phonebook.txt ] && [ -s phonebook.txt ]; then
		cat phonebook.txt
		menu	
	#else send a message and go back to menu
	else
		echo "Your contacts list is empty!!"
		menu
	fi

}

searchcontact(){
	#if phonebook.txt exists and isn't empty
if [ -e phonebook.txt ] && [ -s phonebook.txt ]; then
	echo please enter either the firstname, lastname or phone number of the contact that you want to search
	read SEARCH_CONTACT
#if the entered name is in phonebook.txt echo out a message
	if grep -q "$SEARCH_CONTACT" phonebook.txt; then 
		echo " $SEARCH_CONTACT is in your phonebook" 
		menu
	else echo $SEARCH_CONTACT is not in your phonebook.
		menu
	fi
elif [  ! -s phonebook.txt ]; then
	echo Your contact list is empty!!
	menu

	fi




}


delcontact(){

	#if phonebook.txt exists and isn't empty ask for a name to delete
	if [ -e phonebook.txt ] && [ -s phonebook.txt ]; then
		echo Please the enter the first and last name of the contact that you want to delete
		#delete the entered contact
		read DEL_CONTACT
		sed -i "/$DEL_CONTACT/d" phonebook.txt
		echo $DEL_CONTACT has been deleted
		menu

	else echo Your contact list is empty!
		menu

	fi

	



}

addtocontactlist(){
echo Please enter the contacts First name, Last name and phone number with each separated by a single spaces.
read CONTACT_DETAILS
#if phonebook.txt exists add the entered detail into phonebook.txt
if [ -e phonebook.txt ]; then
	echo $CONTACT_DETAILS >> phonebook.txt
else
#if phonebook.txt hasn't been created yet, create it and add the contact to it
	touch phonebook.txt 
	echo $CONTACT_DETAILS >> phonebook.txt
fi
echo you entered: $CONTACT_DETAILS 

menu



}


menu(){
echo Enter 1 to view contacts list, 2 to add to contacts list, 3 to delete from contacts list, 4 to search contacts list or 5 to exit the program.
read ANSWER
if [ $ANSWER = 1 ]; then viewcontactlist
elif [ $ANSWER = 2 ]; then addtocontactlist 
elif [ $ANSWER = 3 ]; then delcontact
elif [ $ANSWER = 4 ]; then searchcontact
elif [ $ANSWER = 5 ]; then exit 
else echo "Invalid number, Please try again!!"
fi
}




menu
