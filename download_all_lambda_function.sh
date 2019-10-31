	#/usr/bin/env bash

	mkdir code
	aws lambda list-functions --region sa-east-1  | \
	grep FunctionName | \
	cut -d '"' -f4 | \
	while read -r name; do
		echo '=------------'
		if [[ $name == *"delCache"* ]]; then
	    aws lambda get-function --region sa-east-1 --function-name $name | jq -r '.Code.Location' | xargs wget -O ./code/$name.zip
	    fi
	    echo '=------------'
	done

	#| tail -n 3 | egrep -o 'https?://[^ ]+' | sed 's/"//' | xargs wget -O ./code/$name.zip


	   
	    

