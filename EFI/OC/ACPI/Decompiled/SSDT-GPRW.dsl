DefinitionBlock ("", "SSDT", 2, "INSP77", "_GPRW", 0x00000000)
{
    External (XPRW, MethodObj)
    
    Method (GPRW, 2, NotSerialized)
    {
        While (One)
        {
            If ((0x6D == Arg0))
            {
                Return (Package (0x02)
                {
                    0x6D, 
                    Zero
                })
            }
            
            If ((0x0D == Arg0))
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }

            Break
        }

        Return (XPRW (Arg0, Arg1))
    }
}
