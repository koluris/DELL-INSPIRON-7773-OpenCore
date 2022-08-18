DefinitionBlock ("", "SSDT", 2, "INSP77", "_DGPU", 0x00000000)
{
    External (_SB_.PCI0.RP01.PEGP._OFF, MethodObj)

    Device (RMD1)
    {
        Name (_HID, "RMD10000")
        Method (_INI, 0, NotSerialized)
        {
            If (CondRefOf (\_SB.PCI0.RP01.PEGP._OFF))
            {
                \_SB.PCI0.RP01.PEGP._OFF ()
            }
        }
    }
}
