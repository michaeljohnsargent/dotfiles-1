package.path = package.path .. ';/usr/local/etc/powerdns/?.lua'
require "sunset"

function preresolve( remote_ip, domain, qtype )
  print( "preresolve handler called for: ", remote_ip, getlocaladdress(), domain, qtype )
  --print( "****" .. sunset.get_value())
	--if domain == "archivalock.com." then
	if sunset.managing_domain( domain ) then
    print( '*** handling managed domain: ' .. domain )
    if sunset.interview_complete( remote_ip, domain ) then
      print( '*** interview complete, allowing query' )
      return -1, {}
    else
      print( '*** interview pending, answering with interview IP' )
      return sunset.interview_response()
    end
  else
    print( '*** unmanaged domain: ' .. domain )
    return sunset.interview_response()
  end
  --sunset.record_interview_success( remote_ip, domain )
  --print( pdns.A )
  --for key,value in pairs(pdns) do
    --print(key,value)
  --end
  --return -1, {}
end

--function nxdomain( remote_ip, domain, qtype )
  --print( "nxhandler called for: ", remote_ip, getlocaladdress(), domain, qtype )
  --return 0, ret
--end

--function nodata( remote_ip, domain, qtype, records )
	--print( "nodata called for: ", remote_ip, getlocaladdress(), domain, qtype )
  --return 0, ret
--end

--function postresolve ( remote_ip, domain, qtype, records, origrcode )
	--print( "postresolve called for: ", remote_ip, getlocaladdress(), domain, qtype, origrcode )
  ----return 0, ret
  --return -1, {}
--end

--function prequery( dnspacket )
  --print( "prequery called for ".. tostring(dnspacket))
  --return true
--end

--function axfrfilter(remote_ip, zone, qname, qtype, ttl, priority, content)
--end
