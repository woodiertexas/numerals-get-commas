module NumeralsGetCommas.Settings

public enum CommaDelineationFormat {
    Commas = 0,
    Periods = 1,
    Spaces = 2
}

public enum CentsCommaDelineationFormat {
    Commas = 0,
    Periods = 1
}

public class UserSettings {
    @runtimeProperty("ModSettings.mod", "Numerals Get Commas")
    @runtimeProperty("ModSettings.displayName", "Numeral Delineation Format")
    @runtimeProperty("ModSettings.description", "How should numbers be delineated (Given commas or periods depending on your locale)?")
    @runtimeProperty("ModSettings.displayValues.Commas", "Commas")
    @runtimeProperty("ModSettings.displayValues.Periods", "Periods")
    @runtimeProperty("ModSettings.displayValues.Spaces", "Spaces")
    public let delineationFormat: CommaDelineationFormat = CommaDelineationFormat.Commas;

    @runtimeProperty("ModSettings.mod", "Numerals Get Commas")
    @runtimeProperty("ModSettings.displayName", "Display Cents on Money Values")
    @runtimeProperty("ModSettings.description", "Whether or not cents should be displayed on some money values.")
    public let shouldDisplayCents: Bool = false;

    @runtimeProperty("ModSettings.mod", "Numerals Get Commas")
    @runtimeProperty("ModSettings.displayName", "Cents Delineation Format")
    @runtimeProperty("ModSettings.description", "How should numbers in cents be delineated?")
    @runtimeProperty("ModSettings.displayValues.Periods", "Periods")
    @runtimeProperty("ModSettings.displayValues.Commas", "Commas")
    public let centsDelineationFormat: CentsCommaDelineationFormat = CentsCommaDelineationFormat.Periods;

    public static final func Get() -> ref<UserSettings> {
        return new UserSettings();
    }
}
