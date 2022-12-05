DefinitionBlock ("", "SSDT", 2, "INSP77", "_DELL", 0x00000000)
{
    External (_SB_.ACOS, IntObj)
    External (_SB_.ACSE, IntObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.ACOS = 0x80
            \_SB.ACSE = Zero
        }
    }
}
