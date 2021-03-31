rm -Rf $1
mkdir $1
cp *py $1

if [ ! -d "mosesdecoder" ]
then
    git clone https://github.com/moses-smt/mosesdecoder.git
fi

cd $1
python -u download_data.py $1
python -u extract_data.py $1

langs=$(echo $1 | tr "-" "\n")

for l in $langs
do
    python -u preprocess_data.py --lang $l --dir en-$l
    python -u ../../text2HDF5.py train-$l-en-all-tok-lc.txt 2
done

rm -Rf en-*
