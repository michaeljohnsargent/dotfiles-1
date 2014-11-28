module("sunset", package.seeall)

require 'luarocks.loader'
require 'lua-enumerable'
require 'string-extensions'

function managed_domains()
  return {
    'archivalock.com',
    'archivalock.lan'
  }
end

function connect_redis()
  if not client then
    --print('connecting to redis')
    redis = require('redis') 
    client = redis.connect('127.0.0.1', 6379)
  end
end

function redis_get( key )
  print('*** searching redis for key: ' .. key)
  return client:get( key )
end

function interview_response()
  return 0, {{qtype=pdns.A, content="85.17.220.215", ttl=0}}
end

function format_domain( domain )
  if string.end_with( domain, '.' ) then
    return string.sub( domain, 0, string.len( domain )-1 ) 
  else
    return domain
  end
end

function interview_key( remote_ip, domain )
  return string.format( "sunset:interview:%s-%s", 
                        remote_ip, 
                        format_domain( domain ))
end

function managing_domain( domain )
  return table.includes( managed_domains(), format_domain( domain ))
end

function interview_complete( remote_ip, domain )
  connect_redis()
  key = interview_key( remote_ip, domain )
  return redis_get( key ) == "1"
end

function record_interview_complete( remote_ip, domain )
  connect_redis()
  key = interview_key( remote_ip, domain )
  client:set( key, 1 )
  --file_path = string.format( "/usr/local/etc/powerdns/db/interviews/%s", key )
  --file = io.open( file_path, "w" )
  --file:write("Hello World")
  --file:close()
end

function function_names( table )
  names = {}
  fcount = 0
  for i,v in ipairs(table) do
     if type(v) == "function" then
        names[fcount] = v
     end
  end
  --return fcount,names
  return names
end
