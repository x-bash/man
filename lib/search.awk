BEGIN{ str="___x_cmd_ui_gridselect \"Search: \"";}
{
    gsub("\"", "\\\"", $0)
    gsub("'", "\\'", $0)
    gsub("`", "\\`", $0)
    tmp = substr($0, 1, index($0, " - ")-1)
    tmp_info = substr($0, index($0, " - ")+3)
    gsub(/[ \r\t\b\v\n]+$/, "", tmp)
    str = str  " " "\"" tmp "\""
    arr_info[ ++item ] = tmp_info
}
END{
    str = str " \"---\""
    for (i=1; i<=item; ++i) str = str " " "\"" arr_info[i] "\""
    str = str " \"---\""
    print str
}