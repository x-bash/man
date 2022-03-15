BEGIN{
    printf("%s", "___x_cmd_ui_gridselect \"Search: \"")
}

{
    gsub("['\"`]", "\\&", $0)
    tmp         = substr( $0, 1, index($0, " - ")-1 )
    tmp_info    = substr( $0, index($0, " - ")+3 )
    gsub(/[ \r\t\b\v\n]+$/, "", tmp)
    printf( " \"%s\"", tmp )
    arr_info[ ++item ] = tmp_info
}

END{
    printf( " %s" "\"---\"")
    for (i=1; i<=item; ++i)  printf( " %s", "\"" arr_info[i] "\"" )
    printf( " %s", "\"---\"" )
}
