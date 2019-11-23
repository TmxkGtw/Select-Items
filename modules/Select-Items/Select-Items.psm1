function Select-Items{
    <#
    .SYNOPSIS
        This function is a 
    .DESCRIPTION


    .PARAMETER Items

    .PARAMETER Rule

    .PARAMETER Condition

    .PARAMETER DefaultRule

    .INPUTS

    .OUTPUTS

    .EXAMPLE
  
    #>

    [Alias("sli", "%?")]
    [OutputType([Object[]])]
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Object[]] $Items,

        [ValidateNotNullOrEmpty()]
        [ScriptBlock] $Rule = {$_},

        [ValidateNotNullOrEmpty()]
        [ScriptBlock] $Condition = {$true},

        [ValidateNotNullOrEmpty()]
        [ScriptBlock] $DefaultRule = {$_}
    )


    begin{}

    process{
        # TODO: Wrap it into single function
        $Items.ForEach({
            if(& $Condition){
                $(& $Rule)
            }else{
                $(& $DefaultRule)
            }
        })
    }

    end{}

}

Export-ModuleMember -Function *;