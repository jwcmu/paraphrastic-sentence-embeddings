rm -Rf $1
mkdir $1
cp *py $1
cd $1
python -u download_data.py $1
python -u extract_data.py $1
python -u preprocess_data.py $1