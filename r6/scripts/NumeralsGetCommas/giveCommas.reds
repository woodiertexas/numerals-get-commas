import NumeralsGetCommas.Settings.*
import NumeralsGetCommas.Functions.*

// Vendor screens
@wrapMethod(FullscreenVendorGameController)
private final func UpdateVendorMoney() -> Void {
    wrappedMethod();

    let vendorMoney: Int32 = MarketSystem.GetVendorMoney(this.m_VendorDataManager.GetVendorInstance());
    inkTextRef.SetText(this.m_vendorMoney, CommaDelineateInt32(vendorMoney) + AddCents());
}

@wrapMethod(FullscreenVendorGameController)
private final func UpdatePlayerMoney() -> Void {
    wrappedMethod();

    let playerMoneyAmount = VendorDataManager.GetLocalPlayerCurrencyAmount(VendorDataManager.GetLocalPlayer(this.m_player.GetGame()));
    inkTextRef.SetText(this.m_playerMoney, CommaDelineateInt32(playerMoneyAmount) + AddCents());
}

@wrapMethod(MoneyLabelController)
protected cb func OnMainAnimationOver(e: ref<inkAnimProxy>) -> Bool {
    wrappedMethod(e);

    let moneyText = this.GetRootWidget() as inkText;
    moneyText.SetText(CommaDelineateString(moneyText.GetText()) + AddCents());
}

// Pause Menu with inventory
@wrapMethod(SubMenuPanelLogicController)
public func HandleCharacterCurrencyUpdated(value: Int32) -> Void {
    wrappedMethod(value);

    if (value > 999) {
        inkTextRef.SetText(this.m_currencyValue, CommaDelineateInt32(value) + AddCents());
    }
}

// The "Eurodollars Transfer" notification widget
@wrapMethod(CurrencyNotification)
private final func UpdateData() -> Void {
    wrappedMethod();

    let startingValue: Int32 = Cast<Int32>(this.m_currencyData.total) - this.m_currencyData.diff;
    inkTextRef.SetText(this.m_CurrencyDiff, CommaDelineateInt32(this.m_currencyData.diff));
    inkTextRef.SetText(this.m_CurrencyTotal, CommaDelineateInt32(startingValue));
}

@wrapMethod(CurrencyNotification)
protected cb func OnMainAnimationOver(e: ref<inkAnimProxy>) -> Bool {
    wrappedMethod(e);

    inkTextRef.SetText(this.m_CurrencyTotal, CommaDelineateUint32(this.m_currencyData.total));
}

// The item quantity value shown when looting
@wrapMethod(LootingListItemController)
protected func UpdateQuantity() -> Void {
    wrappedMethod();

    let quantityText: String = this.m_lootingData.quantity > 9999 ? CommaDelineateString("9999+") : IntToString(this.m_lootingData.quantity);
    inkTextRef.SetText(this.m_itemQuantity, CommaDelineateString(quantityText));
}

// The ammo counters shown in the lower right portion of the screen
@wrapMethod(WeaponRosterGameController)
private final func SetRosterSlotData() -> Void {
    wrappedMethod();

    let weaponTotalAmmo: Int32 = RPGManager.GetAmmoCountValue(this.m_player, this.m_activeWeapon.weaponID) - this.m_activeWeapon.ammoCurrent;
    if (this.m_activeWeapon.ammoCurrent > 999) {
        inkTextRef.SetText(this.m_weaponCurrentAmmo, CommaDelineateString(this.GetAmmoText(this.m_activeWeapon.ammoCurrent, 3)));
    }

    if (weaponTotalAmmo > 999) {
        inkTextRef.SetText(this.m_weaponTotalAmmo, CommaDelineateString(this.GetAmmoText(weaponTotalAmmo, 4)));
    }
}

// Damage numbers
@wrapMethod(AccumulatedDamageDigitLogicController)
public final func Show(const damageInfo: script_ref<DamageInfo>, showingBothDigits: Bool, oneInstance: Bool, forceStickToTarget: Bool) -> Void {
    wrappedMethod(damageInfo, showingBothDigits, oneInstance, forceStickToTarget);

    let damageValue: Int32 = Cast<Int32>(this.m_damageAccumulated);
    this.m_textWidget.SetText(CommaDelineateInt32(damageValue)); 
}
