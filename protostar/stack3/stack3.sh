if [[ "$(python -V)" =~ "Python 2" ]];then
    echo "The key is stored in stack3_key.txt file. Provide the contents of the file as input to the challenge file like ./stack3 < ./stack3_key"
    python stack3.py > ./stack3_key
else
    echo "Error : Python 2 is not installed! Please install python 2 and try again."
fi