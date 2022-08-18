DefinitionBlock ("", "SSDT", 2, "INSP77", "_TPD0", 0x00000000)
{
    External (_SB_.PCI0.I2C0.TPD0, DeviceObj)

    Scope (_SB.PCI0.I2C0.TPD0)
    {
        If (_OSI ("Darwin"))
        {
            Name (OSYS, 0x07DC)
        }
    }
}
