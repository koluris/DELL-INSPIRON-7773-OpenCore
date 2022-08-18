DefinitionBlock ("", "SSDT", 2, "INSP77", "_GPI0", 0x00000000)
{
    External (GPEN, FieldUnitObj)
    External (SDM0, FieldUnitObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPEN = One
            SDM0 = Zero
        }
    }
}
