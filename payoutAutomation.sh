#!/bin/bash

function createTmuxSessionAndCallPythonScript {
    tmux \
		new-session 'python print.py >> log.txt' \; \
		detach-client
}

function checkNameOfLatestCsvFile {
    latestCsvFile=`ls -rt *.sh | tail -1`
    echo $latestCsvFile
    renameFileIfNotMatchWithPayoutScript
}

#This will assume the latest csv file will be available and will use it.
function renameFileIfNotMatchWithPayoutScript {
    desiredFileName= "testRename"
	if [ "$latestCsvFile" = "createTmux.sh" ] 
	then 
        echo "**ShellScriptLogs**: The file name is correct" > log.txt
    else
        mv $latestCsvFile $desiredFileName
		echo "**ShellScriptLogs**: The file name was renamed from $latesCsvFile to $desiredFileName" > log.txt
    fi 
}

function callSomePythonScript {
    python print.py > log.txt
}

function checkLogsForErrors {
	linesToConsider=`cat untitled.json | grep exception`
	echo $linesToConsider | wc -l 
	numberOfLines=$linesToConsider | wc -l
	# : '
	# 	if (no errors)
	# 		send completion alert with count
	# 	else
	# 		send the error ids
	# '
}

# checkNameOfLatestCsvFile
# createTmuxSessionAndCallPythonScript
checkLogsForErrors
