
function string.start_with( str, start_str )
  return string.sub( str, 1, string.len( start_str )) == start_str
end

function string.end_with( str, end_str )
  return end_str=='' or string.sub( str, -string.len( end_str )) == end_str
end

