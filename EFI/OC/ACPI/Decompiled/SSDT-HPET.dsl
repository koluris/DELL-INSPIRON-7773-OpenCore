DefinitionBlock ("", "SSDT", 2, "INSP77", "_HPET", 0x00000000)
{
    External (\_SB.PCI0.LPCB, DeviceObj)
    External (\_SB.PCI0.LPCB.HPET, DeviceObj)
    
    Name (\_SB.PCI0.LPCB.HPET._CRS, ResourceTemplate ()
    {
        IRQNoFlags ()
            {0,8,11}
        Memory32Fixed (ReadWrite,
            0xFED00000,
            0x00000400,
            )
    })
}
