-- Toggle redshift when viewing videos with mpv
-- When pausing redshift is reenabled (and disabled again when continuing)


-- If running
if os.execute("pgrep -x wlsunset >/dev/null") ~= 0 then
    rs_enabled = true
else
    rs_enabled = false
end

function rs_disable()
    if rs_enabled then
        os.execute("killall wlsunset &")
        rs_enabled = false
        mp.msg.log("info", "Disabling redshift")
    end
end

function rs_enable()
    if not rs_enabled then
        if os.execute("pgrep -x wlsunset >/dev/null") ~= 0 then
            os.execute("wlsunset -l 47.5 -L 7.5 -g 0.9 &")
        end
        rs_enabled = true
        mp.msg.log("info", "Reenabling redshift")
    end
end

function rs_handler()
    if mp.get_property("video") ~= "no" then
        rs_disable()
    else
        rs_enable()
    end
end


function on_pause_change(name, value)
    if value then  --pause started
        rs_enable()
    else
        rs_disable()
    end
end

rs_enable()

mp.register_event("file-loaded", rs_handler)
mp.register_event("shutdown", rs_enable)
mp.observe_property("pause", "bool", on_pause_change)
