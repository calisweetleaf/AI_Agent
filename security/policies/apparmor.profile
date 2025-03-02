#include <tunables/global>

profile ai_agent {
    #include <abstractions/base>
    #include <abstractions/python>

    /usr/bin/python3 ix,
    /src/** r,
    /models/** r,
    /config/** r,
    /logs/app.log rw,
    
    deny network all,
    allow network tcp,
    
    /tmp/** rw,
    owner /proc/*/fd/ r,
    deny @{PROC}/* w,
}
