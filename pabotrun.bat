
cd C:\Users\JPP\Documents\Testing\Robot
pabot --processes 4 --testlevelsplit --variable browser:ie --output original.xml --include UPG SFDC*.robot 	
pabot --processes 4 --variable browser:gc --rerunfailed original.xml --output rerun.xml SFDC*.robot
rebot --merge output.xml rerun.xml


pause