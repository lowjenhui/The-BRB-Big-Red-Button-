
function playWAV ($soundLoc)
{
    $sound = new-Object System.Media.SoundPlayer
    $sound.SoundLocation=$soundLoc
    $sound.Play()
}

function playAlert
{
    $continue = $true
    while($continue)
    {
        if ([console]::KeyAvailable)
        {
            $x = [System.Console]::ReadKey() 

            switch ($x.key)
            {
                ESC { $continue = $false }
            }
        } 
        else
        {
            write-host "`a"
        }    
    }
}

function closeChrome 
{
    $chrome = Get-Process chrome -ErrorAction SilentlyContinue
    if ($chrome)
    {
        $chrome.CloseMainWindow()
        Sleep 5
    if (!$chrome.HasExited)
        {
            $chrome | Stop-Process -Force
        }
    }
    Remove-Variable firefox
}

function lockcomputer
{
    Set objShell = CreateObject(“Wscript.Shell”)
    objShell.Run “%windir%\System32\rundll32.exe user32.dll,LockWorkStation”
}


function openWebPage ($URL)
{
    $IE=new-object -com internetexplorer.application
    $IE.navigate2("$URL")
    $IE.visible=$true
}

function printToConsole($message) 
{
    Clear-Host
    echo $message
}

function moveMouse
{
    [Windows.Forms.Cursor]::Position = "$($screen.Width),$($screen.Height)"
}

function mainloop ($comport)
{
    $continue = $true
    $port= new-Object System.IO.Ports.SerialPort COM$comport,9600,None,8,one
    $port.Open();
    while($continue)
    {        
        if ([console]::KeyAvailable)
        {
            $x = [System.Console]::ReadKey() 

            switch ($x.key)
            {
                q { $continue = $false }
            }
        } 
        else
        {
            $command = $port.ReadLine();
            [int]$cmdInt = 0
            [bool]$result = [int]::TryParse($command, [ref]$cmdInt)

            echo $cmdInt

            switch ($cmdInt)
            {
                # USEFUL
                1 { openWebPage("https://www.youtube.com/watch?v=5-sfG8BV8wU") } # just do it
                2 { openWebPage("http://inspirationalshit.com/quotes") } # quotes
                3 { openWebPage("http://random.cat/") } # random cat
                4 { playWAV(.\fuckT.wav) }

                # NORMAL
                5 { openWebPage("https://www.youtube.com/watch?v=ZZ5LpwO-An4") } # he man
                6 { openWebPage("http://www.gifff.in/centered/") } # random gif
                7 { openWebPage("https://www.youtube.com/watch?v=dQw4w9WgXcQ") } # rick
                8 { openWebPage("https://i.ytimg.com/vi/pvBxEdJ4_gY/maxresdefault.jpg"); $continue = $false } # quit
                9 { playWAV(.\scream.wav) }
                10 { playWAV(.\laugh.wav) }

				
                # ASSHOLE
                11 { closeChrome } # close chrome
                12 { lockComputer } # lock pc
                13 { playAlert } # loud noise
                14 { moveMouse } # move mouse
            }
        }
    }
    $port.Close();
}

mainloop(3)

