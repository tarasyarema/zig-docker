usingnamespace @import("std");

const port: u16 = 8000;

pub fn main() anyerror!void {
    const localhost = try net.Address.parseIp("127.0.0.1", port);

    var server = net.StreamServer.init(net.StreamServer.Options{});
    defer server.deinit();
    
    try server.listen(localhost);
    debug.warn("listening on 8000\n", .{});
}