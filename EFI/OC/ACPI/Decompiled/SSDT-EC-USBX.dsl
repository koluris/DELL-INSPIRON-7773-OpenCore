DefinitionBlock ("", "SSDT", 2, "INSP77", "_USBX", 0x00001000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)
    
    Scope (\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)
            
            Method (_DSM, 4, NotSerialized)
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03
                    })
                }
                
                Return (Package (0x04)
                {
                    "kUSBSleepPortCurrentLimit", 
                    0x0BB8, 
                    "kUSBWakePortCurrentLimit", 
                    0x0BB8
                })
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
    
    Scope (\_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")
            
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
}
