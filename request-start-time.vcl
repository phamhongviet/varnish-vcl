# Use case: New Relic's request queueing time

import std;

sub vcl_recv {
	set req.http.X-Request-Start = std.time2real(now);
}
