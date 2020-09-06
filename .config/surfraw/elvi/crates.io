#!/bin/sh
# elvis: crates.io
# gabi_250@live.com 20200906
#
# Based on the duckduckgo elvi
. surfraw || exit 1

w3_config_hook () {
    def     SURFRAW_cratesio_results             "$SURFRAW_results"
    def     SURFRAW_cratesio_base_url            "crates.io"
    def     SURFRAW_cratesio_search              search
    defyn   SURFRAW_cratesio_exact_match         0
    defyn   SURFRAW_cratesio_https_arg           0
}

w3_usage_hook () {
    cat <<EOF
Usage: $w3_argv0 [options] [search words]...
Description:
  Surfraw search the web using crates.io
Local options:
    -s,-insecure                disable SSL search
    -e,-exact                   disable SSL search
EOF
    w3_global_usage
}

w3_parse_option_hook () {
    opt="$1"
    optarg="$2"
    case "$opt" in
    -s|-sec*)           setoptyn    SURFRAW_cratesio_https_arg           1 ;;
    -e|-exact*)         setoptyn    SURFRAW_cratesio_exact_match         1 ;;
    *) return 1 ;;
    esac
    return 0
}

w3_config
w3_parse_args "$@"
# w3_args now contains a list of arguments

if [ "${SURFRAW_cratesio_https_arg}" = 0 ] ; then
    SURFRAW_cratesio_base_url="https://${SURFRAW_cratesio_base_url}"
else
    SURFRAW_cratesio_base_url="http://${SURFRAW_cratesio_base_url}"
fi

escaped_args=`w3_url_of_arg $w3_args`

if [ "$SURFRAW_cratesio_exact_match" = 1 ]; then
    w3_browse_url "${SURFRAW_cratesio_base_url}/crates/${escaped_args}"
else
    w3_browse_url "${SURFRAW_cratesio_base_url}/search?q=${escaped_args}"
fi

