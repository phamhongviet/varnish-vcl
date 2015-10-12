# serve a piece of text directly
sub vcl_synth {
        if (resp.status == 700) {
                synthetic(resp.reason);
                set resp.status = 200;
                return(deliver);
        }
}

# How to use
# return(synth(700, "text"));

# Example:
# sub vcl_recv {
#        if (req.url == "/foo") {
#                return(synth(700, "bar"));
#        }
# }
