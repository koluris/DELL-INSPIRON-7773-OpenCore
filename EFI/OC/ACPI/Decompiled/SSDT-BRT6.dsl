DefinitionBlock ("", "SSDT", 2, "INSP77", "_BRT6", 0x00000000)
{
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0.XRT6, MethodObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    
    Scope (_SB.PCI0.GFX0)
    {
        Method (BRT6, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((Arg0 == One))
                {
                    Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                    Notify (\_SB.PCI0.LPCB.PS2K, 0x10)
                }
                
                If ((Arg0 & 0x02))
                {
                    Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                    Notify (\_SB.PCI0.LPCB.PS2K, 0x20)
                }
            }
            Else
            {
                \_SB.PCI0.GFX0.XRT6 (Arg0, Arg1)
            }
        }
    }
}
