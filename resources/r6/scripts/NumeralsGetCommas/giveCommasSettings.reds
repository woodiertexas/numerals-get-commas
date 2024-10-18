module NumeralsGetCommas.Settings

@if(ModuleExists("ModSettingsModule"))
import ModSettingsModule.*

public enum CommaDelineationFormat {
    Commas = 0,
    Periods = 1,
    Spaces = 2
}

public enum CentsCommaDelineationFormat {
    Commas = 0,
    Periods = 1
}

public class UserSettingsSS extends ScriptableSystem {
    // General mod options.
	@runtimeProperty("ModSettings.mod", "COMMAS_Settings_ModTitle")
	@runtimeProperty("ModSettings.category", "")
	@runtimeProperty("ModSettings.category.order", "0")
	@runtimeProperty("ModSettings.displayName", "COMMAS_Settings_Enabled")
	@runtimeProperty("ModSettings.description", "COMMAS_Settings_EnabledDescription")
	public let modEnabled: Bool = true;

    @runtimeProperty("ModSettings.mod", "COMMAS_Settings_ModTitle")
	@runtimeProperty("ModSettings.category", "COMMAS_Settings_GeneralSettings")
	@runtimeProperty("ModSettings.category.order", "1")
    @runtimeProperty("ModSettings.displayName", "COMMAS_Settings_NumberCommaFormatName")
    @runtimeProperty("ModSettings.description", "COMMAS_Settings_NumberCommaFormatDescription")
    @runtimeProperty("ModSettings.displayValues.Commas", "COMMAS_Settings_Commas")
    @runtimeProperty("ModSettings.displayValues.Periods", "COMMAS_Settings_Periods")
    @runtimeProperty("ModSettings.displayValues.Spaces", "COMMAS_Settings_Spaces")
	@runtimeProperty("ModSettings.dependency", "modEnabled")
    public let delineationFormat: CommaDelineationFormat = CommaDelineationFormat.Commas;

    @runtimeProperty("ModSettings.mod", "COMMAS_Settings_ModTitle")
	@runtimeProperty("ModSettings.category", "COMMAS_Settings_GeneralSettings")
	@runtimeProperty("ModSettings.category.order", "1")
    @runtimeProperty("ModSettings.displayName", "COMMAS_Settings_CentsDisplayName")
    @runtimeProperty("ModSettings.description", "COMMAS_Settings_CentsDisplayDescription")
	@runtimeProperty("ModSettings.dependency", "modEnabled")
    public let shouldDisplayCents: Bool = false;

    @runtimeProperty("ModSettings.mod", "COMMAS_Settings_ModTitle")
	@runtimeProperty("ModSettings.category", "COMMAS_Settings_GeneralSettings")
	@runtimeProperty("ModSettings.category.order", "1")
    @runtimeProperty("ModSettings.displayName", "COMMAS_Settings_CentsNumberCommaFormatName")
    @runtimeProperty("ModSettings.description", "COMMAS_Settings_CentsNumberCommaFormatDescription")
    @runtimeProperty("ModSettings.displayValues.Periods", "COMMAS_Settings_Periods")
    @runtimeProperty("ModSettings.displayValues.Commas", "COMMAS_Settings_Commas")
    @runtimeProperty("ModSettings.dependency", "shouldDisplayCents")
    @runtimeProperty("ModSettings.dependency", "modEnabled")
    public let centsDelineationFormat: CentsCommaDelineationFormat = CentsCommaDelineationFormat.Periods;

    // Options for giving commas to various UI elements.
    @runtimeProperty("ModSettings.mod", "COMMAS_Settings_ModTitle")
    @runtimeProperty("ModSettings.category", "COMMAS_Settings_UiOptions")
    @runtimeProperty("ModSettings.category.order", "2")
    @runtimeProperty("ModSettings.displayName", "COMMAS_Settings_AmmoCounterCommaFormatName")
    @runtimeProperty("ModSettings.description", "COMMAS_Settings_AmmoCounterCommaFormatDescription")
    @runtimeProperty("ModSettings.dependency", "modEnabled")
    public let shouldCommaDelineateAmmoCounter: Bool = true;

    @runtimeProperty("ModSettings.mod", "COMMAS_Settings_ModTitle")
    @runtimeProperty("ModSettings.category", "COMMAS_Settings_UiOptions")
    @runtimeProperty("ModSettings.category.order", "2")
    @runtimeProperty("ModSettings.displayName", "COMMAS_Settings_DamageNumbersCommaFormatName")
    @runtimeProperty("ModSettings.description", "COMMAS_Settings_DamageNumbersCommaFormatDescription")
    @runtimeProperty("ModSettings.dependency", "modEnabled")
    public let shouldCommaDelineateDamageNumbers: Bool = true;

    @runtimeProperty("ModSettings.mod", "COMMAS_Settings_ModTitle")
    @runtimeProperty("ModSettings.category", "COMMAS_Settings_UiOptions")
    @runtimeProperty("ModSettings.category.order", "2")
    @runtimeProperty("ModSettings.displayName", "COMMAS_Settings_LootItemQuantitiesCommaFormatName")
    @runtimeProperty("ModSettings.description", "COMMAS_Settings_DamageNumbersCommaFormatDescription")
    @runtimeProperty("ModSettings.dependency", "modEnabled")
    public let shouldCommaDelineateLootItemQuantities: Bool = true;

	public static func GetSS() -> ref<UserSettingsSS> {
		return GameInstance.GetScriptableSystemsContainer(GetGameInstance()).Get(n"NumeralsGetCommas.Settings.UserSettingsSS") as UserSettingsSS;
	}

	@if(ModuleExists("ModSettingsModule"))
	private func OnAttach() -> Void {
		ModSettings.RegisterListenerToClass(this);
	}

	@if(ModuleExists("ModSettingsModule"))
	private func OnDetach() -> Void {
		ModSettings.UnregisterListenerToClass(this);
	}

}
