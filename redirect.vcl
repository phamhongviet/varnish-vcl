# Redirect with 301 Moved Permanently
sub vcl_synth {
        if (resp.status == 701) {
                set resp.http.Location = resp.reason;
                set resp.status = 301;
                set resp.reason = "Moved Permanently";
                synthetic("");
                return(deliver);
        }
}

# How to use
# return(synth(701, "http://www.somewhere.net/someplace"));

# Example: redirect to new website at new domain
# sub vcl_recv {
#        if (req.http.host == "www.olddomain.com") {
#                return(synth(701, "http://www.newdomain.com"));
#        }
# }
