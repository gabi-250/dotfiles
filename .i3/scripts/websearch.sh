#!/bin/bash

# dmenu colors
SEARCH_SB='#F6E60E'
SEARCH_SF='#000000'

ELVI=('duckduckgo' 'docsrs')
ELVI_STR=$(printf '\\n%s' "${ELVI[@]}")
ELVI_STR=${ELVI_STR:2}

if [ "$#" -lt 1 ]; then
    engine=$(printf ${ELVI_STR[@]} | dmenu -sb red)
else
    engine=$1
fi

if [ ! "$engine" ]; then
    exit
fi

search_message="SEARCH -- $engine --"
query=$(echo -n "" | dmenu -sb ${SEARCH_SB} -sf ${SEARCH_SF} -p "$search_message")

if [ ! "$query" ]; then
    exit
fi

sr_args=''
if [[ "$engine" == "docsrs" && "${query:0:1}" == '!' ]]; then
    sr_args+='-exact'
    query=${query:1}
fi

sr $sr_args $engine $query
