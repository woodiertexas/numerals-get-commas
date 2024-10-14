// Adapted from Demon9ne's comma formatting code
public static func formatNumeralWithCommas(text: String) -> String {
    let int: Int32 = 3;
    let length: Int32 = StrLen(text);

    while int < length {
        text = StrLeft(text, length - int) + "," + StrRight(text, int);
        length += 1;
        int += 4;
    };

    return text;
}

public static func formatNumeralWithCommas(value: Uint64) -> String {
    let string: String = ToString(value);
    let int: Int32 = 3;
    let length: Int32 = StrLen(string);

    while int < length {
        string = StrLeft(string, length - int) + "," + StrRight(string, int);
        length += 1;
        int += 4;
    };

    return string;
}

public static func formatNumeralWithCommas(value: Int64) -> String {
    return formatNumeralWithCommas(Cast<Uint64>(value));
}

public static func formatNumeralWithCommas(value: Uint32) -> String {
    return formatNumeralWithCommas(Cast<Uint64>(value));
}

public static func formatNumeralWithCommas(value: Int32) -> String {
    return formatNumeralWithCommas(Cast<Uint64>(value));
}

// Vendor screens
@wrapMethod(FullscreenVendorGameController)
private final func UpdateVendorMoney() -> Void {
    wrappedMethod();

    let vendorMoney: Int32 = MarketSystem.GetVendorMoney(this.m_VendorDataManager.GetVendorInstance());
    inkTextRef.SetText(this.m_vendorMoney, formatNumeralWithCommas(vendorMoney));
}

@wrapMethod(FullscreenVendorGameController)
private final func UpdatePlayerMoney() -> Void {
    wrappedMethod();

    let playerMoneyAmount = VendorDataManager.GetLocalPlayerCurrencyAmount(VendorDataManager.GetLocalPlayer(this.m_player.GetGame()));
    inkTextRef.SetText(this.m_playerMoney, formatNumeralWithCommas(playerMoneyAmount));
}

@wrapMethod(MoneyLabelController)
protected cb func OnMainAnimationOver(e: ref<inkAnimProxy>) -> Bool {
    wrappedMethod(e);

    let test = this.GetRootWidget() as inkText;
    test.SetText(formatNumeralWithCommas(test.GetText()));
}

// Pause Menu with inventory
@wrapMethod(SubMenuPanelLogicController)
public func HandleCharacterCurrencyUpdated(value: Int32) -> Void {
    wrappedMethod(value);

    if (value > 999) {
        inkTextRef.SetText(this.m_currencyValue, formatNumeralWithCommas(value));
    }
}

// The "Eurodollars Transfer" notification widget
@wrapMethod(CurrencyNotification)
private final func UpdateData() -> Void {
    wrappedMethod();

    let baseValue: Int32 = Cast<Int32>(this.m_currencyData.total) - this.m_currencyData.diff;
    inkTextRef.SetText(this.m_CurrencyDiff, formatNumeralWithCommas(this.m_currencyData.diff));
    inkTextRef.SetText(this.m_CurrencyTotal, formatNumeralWithCommas(baseValue));
}

@wrapMethod(CurrencyNotification)
protected cb func OnMainAnimationOver(e: ref<inkAnimProxy>) -> Bool {
    wrappedMethod(e);

    inkTextRef.SetText(this.m_CurrencyTotal, formatNumeralWithCommas(this.m_currencyData.total));
}

// The item quantity value shown when looting
@wrapMethod(LootingListItemController)
protected func UpdateQuantity() -> Void {
    wrappedMethod();

    let quantityText: String = this.m_lootingData.quantity > 9999 ? "9999+" : IntToString(this.m_lootingData.quantity);
    inkTextRef.SetText(this.m_itemQuantity, formatNumeralWithCommas(quantityText));
}

// The ammo counters shown in the lower right portion of the screen
@wrapMethod(WeaponRosterGameController)
private final func SetRosterSlotData() -> Void {
    wrappedMethod();

    let weaponTotalAmmo: Int32 = RPGManager.GetAmmoCountValue(this.m_player, this.m_activeWeapon.weaponID) - this.m_activeWeapon.ammoCurrent;
    if (this.m_activeWeapon.ammoCurrent > 999) {
        inkTextRef.SetText(this.m_weaponCurrentAmmo, formatNumeralWithCommas(this.GetAmmoText(this.m_activeWeapon.ammoCurrent, 3)));
    }

    if (weaponTotalAmmo > 999) {
        inkTextRef.SetText(this.m_weaponTotalAmmo, formatNumeralWithCommas(this.GetAmmoText(weaponTotalAmmo, 4)));
    }
}

// Damage numbers
@wrapMethod(AccumulatedDamageDigitLogicController)
public final func Show(const damageInfo: script_ref<DamageInfo>, showingBothDigits: Bool, oneInstance: Bool, forceStickToTarget: Bool) -> Void {
    wrappedMethod(damageInfo, showingBothDigits, oneInstance, forceStickToTarget);

    let damageValue: Int32 = Cast<Int32>(this.m_damageAccumulated);
    this.m_textWidget.SetText(formatNumeralWithCommas(damageValue)); 
}
