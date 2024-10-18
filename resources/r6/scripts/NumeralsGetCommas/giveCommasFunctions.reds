module NumeralsGetCommas.Functions

import NumeralsGetCommas.Settings.*

private func SetDelineationFormat() -> String {
    let settings = UserSettingsSS.GetSS();
    let chosenFormat: String;

    switch(settings.delineationFormat) {
        case CommaDelineationFormat.Commas:
            chosenFormat = ",";
            break;
        case CommaDelineationFormat.Periods:
            chosenFormat = ".";
            break;
        case CommaDelineationFormat.Spaces:
            chosenFormat = " ";
            break;
    }

    return chosenFormat;
}

public func AddCents() -> String {
    let settings = UserSettingsSS.GetSS();
    if (!settings.shouldDisplayCents) { return ""; }

    let chosenFormat: String;
    switch(settings.centsDelineationFormat) {
        case CommaDelineationFormat.Commas:
            chosenFormat = ",";
            break;
        case CommaDelineationFormat.Periods:
            chosenFormat = ".";
            break;
    }

    return chosenFormat + "00";
}

// Adapted from Demon9ne's comma formatting code
public static func CommaDelineateString(text: String) -> String {
    let settings = UserSettingsSS.GetSS();
    if (!settings.modEnabled) { return text; }

    let isNegative: Bool = StrContains(text, "-");
    if isNegative {
        text = StrReplace(text, "-", "");
    };

    let int: Int32 = 3;
    let length: Int32 = StrLen(text);
    while int < length {
        text = StrLeft(text, length - int) + SetDelineationFormat() + StrRight(text, int);
        length += 1;
        int += 4;
    };

    return isNegative ? "-" + text : text;
}

public static func CommaDelineateUint64(value: Uint64) -> String {
    return CommaDelineateString(ToString(value));
}

public static func CommaDelineateUint32(value: Uint32) -> String {
    return CommaDelineateString(ToString(value));
}

public static func CommaDelineateInt64(value: Int64) -> String {
    let isNegative: Bool = value < 0l;
    let str: String = CommaDelineateUint64(Cast<Uint64>(isNegative ? -value : value));
    return isNegative ? "-" + str : str;
}

public static func CommaDelineateInt32(value: Int32) -> String {
    let isNegative: Bool = value < 0;
    let str: String = CommaDelineateUint64(Cast<Uint64>(isNegative ? -value : value));
    return isNegative ? "-" + str : str;
}
