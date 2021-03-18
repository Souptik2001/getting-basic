#!/bin/bash

# Total execution time 0.5 sec
function execute(){
	xte "str $1"
	sleep 0.5
	xte "key Return"
}

function ctrl(){
	xte "keydown Control_L" "key $1" "keyup Control_L"
}

function alttab(){
	xte "keydown Alt_L" "key Tab" "keyup Alt_L"
}

# Total execution time 1 sec
function toggle_guake_visibility(){
	sleep 0.5
	xte "keydown Shift_L" "key Return" "keyup Shift_L"
	sleep 0.5
}