const std = @import("std");
const Set = std.bit_set.IntegerBitSet(26);

pub fn isIsogram(str: []const u8) bool {
    var seen = Set.initEmpty();
    for (str) |char| {
        const lowerChar = std.ascii.toLower(char);
        if (!std.ascii.isAlphabetic(lowerChar))
            continue;
        if (seen.isSet(lowerChar - 'a')) {
            return false;
        }
        seen.set(lowerChar - 'a');
    }
    return true;
}
