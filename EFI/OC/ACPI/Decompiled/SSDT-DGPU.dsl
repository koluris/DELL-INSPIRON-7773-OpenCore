DefinitionBlock ("", "SSDT", 2, "INSP77", "_DGPU", 0x00000000)
{
    External (_SB_.PCI0.RP01.PEGP._DSM, MethodObj)
    External (_SB_.PCI0.RP01.PEGP._PS3, MethodObj)
    
    Device (NHG1)
    {
        Name (_HID, "NHG10000")
        
        Method (_INI, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((CondRefOf (\_SB.PCI0.RP01.PEGP._DSM) && CondRefOf (\_SB.PCI0.RP01.PEGP._PS3)))
                {
                    \_SB.PCI0.RP01.PEGP._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
                        {
                            0x01, 0x00, 0x00, 0x03                         
                        })
                        
                    \_SB.PCI0.RP01.PEGP._PS3 ()
                }
            }
            Else
            {
            }
        }
        
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}
