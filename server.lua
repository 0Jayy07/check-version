CreateThread( function()
    local version = GetResourceMetadata(GetCurrentResourceName(), 'version')
    Citizen.Wait(5000)
    PerformHttpRequest('https://raw.githubusercontent.com/0Jayy07/check-version/main/version.json', function(code, res, headers)
        if code == 200 then
            local response = json.decode(res)
            if response.version ~= version then
              print(([[^1-------------------------------------------------------
 ^2Update!^7 ^4Version: %s^7

 ^2Changlog:^7 ^6%s^7
 -------------------------------------------------------^0]]):format(response.version, response.changelog))
           end
       else
           print('[^1ERROR^7] >> Failed to get version information. ^1ERROR: %s^7'):format(code))
       end
   end, 'GET')
 end
