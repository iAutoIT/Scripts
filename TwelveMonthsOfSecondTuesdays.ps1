#Example function to find the second Tuesday of a month, we will use the specified month function under this one for our work product 
function Get-SecondTuesdayofMonth {
    [CmdletBinding()]
    param (
        
    )
        
    # instantiate an array. To contain up to 2 Tuesdays, found from the start of the month
    $Tuesdays = @()
    $today = Get-Date
    # Starting from the first day of the current dates month, test for the day of the week
    # If the day of the week is Tuesday an the $i variable equals 2, return that date time object
    do {

        for ($i = 1; $i -lt 15; $i++) {
            $Day = $(Get-Date -Month $Today.Month -Day $i)
            $DayOfWeek = $Day.DayOfWeek
                
            If ($DayOfWeek -eq 'Tuesday') { 
                $Tuesdays += $Day 
 
            }
        }


    } until ($Tuesdays.Count -eq 2)   

    $Tuesdays[1]
            
}

function Get-SecondTuesdayofTheSpecifiedMonth {
    [CmdletBinding()]
    param (
        $Month
        
    )
        
    # instantiate an array. To contain up to 2 Tuesdays, found from the start of the month
    $Tuesdays = @()
    
    # Starting from the first day of the current dates month, test for the day of the week
    # If the day of the week is Tuesday an the $i variable equals 2, return that date time object
    do {

        for ($i = 1; $i -lt 15; $i++) {
            $Day = $(Get-Date -Month $Month -Day $i)
            $DayOfWeek = $Day.DayOfWeek
                
            If ($DayOfWeek -eq 'Tuesday') { 
                $Tuesdays += $Day 
 
            }
        }


    } until ($Tuesdays.Count -eq 2)   

    $Tuesdays[1]
            
}

Clear-Host
$TwelveMonthsOfSecondTuesday = @()
$Today = Get-Date
$currentMonth =$Today.Month
for ($i = 1; $i -lt 13; $i++) {

    switch ($currentMonth) {
        12 { $currentMonth = 1 }
        11 { $currentMonth = 12 }
        10 { $currentMonth = 11 }
        9 { $currentMonth = 10 }
        8 { $currentMonth = 9 }
        7 { $currentMonth = 8 }
        6 { $currentMonth = 7 }
        5 { $currentMonth = 6 }
        4 { $currentMonth = 5 }
        3 { $currentMonth = 4 }
        2 { $currentMonth = 3 }
        1 { $currentMonth = 2 }
        Default {$currentMonth = 1}
    }

    $SecondTuesday = Get-SecondTuesdayofTheSpecifiedMonth $currentMonth

    $TwelveMonthsOfSecondTuesday += $SecondTuesday

    
    
}
$TwelveMonthsOfSecondTuesday.ToLongDateString() | Out-GridView 

Write-Host $SecondTuesday.ToLongDateString()







