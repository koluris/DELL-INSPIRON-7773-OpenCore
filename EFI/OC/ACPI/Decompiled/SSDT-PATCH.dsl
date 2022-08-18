DefinitionBlock ("", "SSDT", 2, "INSP77", "_PATCH", 0x00000000)
{
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_PR_.PR00, ProcessorObj)

    If (_OSI ("Darwin"))
    {
        // Scope: \_SB

        Scope (_SB)
        {
            // USBX

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
                    Return (0x0F)
                }
            }
        }

        // Scope: \_SB.PCI0.GFX0

        Scope (_SB.PCI0.GFX0)
        {
            // PNLF

            Device (PNLF)
            {
                Name (_HID, EisaId ("APP0002"))
                Name (_CID, "backlight")
                Name (_UID, 0x10)
                Name (_STA, 0x0B)
            }
        }

        // Scope: \_SB.PCI0.LPCB

        Scope (_SB.PCI0.LPCB)
        {
            // EC

            Device (EC)
            {
                Name (_HID, "EC000000")
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }
            }
        }

        // Scope: \_PR.PR00

        Scope (_PR.PR00)
        {
            // _DSM

            Method (_DSM, 4, NotSerialized)
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                        0x03
                    })
                }
                
                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }
}