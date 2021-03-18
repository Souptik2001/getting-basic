#!/bin/bash
echo "Building..."
mkdir ./bin

for i in ./challenges/???*
do
	basename "$i"
	f="$(basename -- $i)"
	gcc "$i" -o "./bin/${f%.*}"
done

chmod u+s ./bin/*
echo "Done."