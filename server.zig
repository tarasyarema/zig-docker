usingnamespace @import("std");

pub fn main() anyerror!void {
    const localhost = try net.Address.parseIp("127.0.0.1", 0);

    var server = net.StreamServer.init(net.StreamServer.Options{});
    defer server.deinit();
    
    try server.listen(localhost);
    debug.warn("listening on {}\n", localhost.getPort());
}