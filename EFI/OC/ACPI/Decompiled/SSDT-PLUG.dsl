DefinitionBlock ("", "SSDT", 2, "INSP77", "_PLUG", 0x00003000)
{
    External (\_PR.PR00, ProcessorObj)
    
    Scope (\_PR.PR00)
    {
        If (_OSI ("Darwin"))
        {
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
