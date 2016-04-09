Function Get-NATOSpelling ([string]$string) {    
    Write-Output "$string : " -NoNewline
    for ($i = 0; $i -lt $string.length; $i++)
    {
        switch -casesensitive ($string[$i]) 
        {
            'A'	{write-host 'ALFA, ' -NoNewline}
            'B'	{write-host 'BRAVO, ' -NoNewline}
            'C'	{write-host 'CHARLIE, ' -NoNewline}
            'D'	{write-host 'DELTA, ' -NoNewline}
            'E'	{write-host 'ECHO, ' -NoNewline}
            'F'	{write-host 'FOXTROT, ' -NoNewline}
            'G'	{write-host 'GOLF, ' -NoNewline}
            'H'	{write-host 'HOTEL, ' -NoNewline}
            'I'	{write-host 'INDIA, ' -NoNewline}
            'J'	{write-host 'JULIET, ' -NoNewline}
            'K'	{write-host 'KILO, ' -NoNewline}
            'L'	{write-host 'LIMA, ' -NoNewline}
            'M'	{write-host 'MIKE, ' -NoNewline}
            'N'	{write-host 'NOVEMBER, ' -NoNewline}
            'O'	{write-host 'OSCAR, ' -NoNewline}
            'P'	{write-host 'PAPA, ' -NoNewline}
            'Q'	{write-host 'QUEBEC, ' -NoNewline}
            'R'	{write-host 'ROMEO, ' -NoNewline}
            'S'	{write-host 'SIERRA, ' -NoNewline}
            'T'	{write-host 'TANGO, ' -NoNewline}
            'U'	{write-host 'UNIFORM, ' -NoNewline}
            'V'	{write-host 'VICTOR, ' -NoNewline}
            'W'	{write-host 'WHISKEY, ' -NoNewline}
            'X'	{write-host 'X-RAY, ' -NoNewline}
            'Y'	{write-host 'YANKEE, ' -NoNewline}
            'Z'	{write-host 'ZULU, ' -NoNewline}
            'a'	{write-host 'alfa, ' -NoNewline}
            'b'	{write-host 'bravo, ' -NoNewline}
            'c'	{write-host 'charlie, ' -NoNewline}
            'd'	{write-host 'delta, ' -NoNewline}
            'e'	{write-host 'echo, ' -NoNewline}
            'f'	{write-host 'foxtrot, ' -NoNewline}
            'g'	{write-host 'golf, ' -NoNewline}
            'h'	{write-host 'hotel, ' -NoNewline}
            'i'	{write-host 'india, ' -NoNewline}
            'j'	{write-host 'juliet, ' -NoNewline}
            'k'	{write-host 'kilo, ' -NoNewline}
            'l'	{write-host 'lima, ' -NoNewline}
            'm'	{write-host 'mike, ' -NoNewline}
            'n'	{write-host 'november, ' -NoNewline}
            'o'	{write-host 'oscar, ' -NoNewline}
            'p'	{write-host 'papa, ' -NoNewline}
            'q'	{write-host 'quebec, ' -NoNewline}
            'r'	{write-host 'romeo, ' -NoNewline}
            's'	{write-host 'sierra, ' -NoNewline}
            't'	{write-host 'tango, ' -NoNewline}
            'u'	{write-host 'uniform, ' -NoNewline}
            'v'	{write-host 'victor, ' -NoNewline}
            'w'	{write-host 'whiskey, ' -NoNewline}
            'x'	{write-host 'x-ray, ' -NoNewline}
            'y'	{write-host 'yankee, ' -NoNewline}
            'z'	{write-host 'zulu, ' -NoNewline}
            '0'	{write-host 'Zero, ' -NoNewline}
            '1'	{write-host 'One, ' -NoNewline}
            '2'	{write-host 'Two, ' -NoNewline}
            '3'	{write-host 'Tree, ' -NoNewline}
            '4'	{write-host 'Four, ' -NoNewline}
            '5'	{write-host 'Five, ' -NoNewline}
            '6'	{write-host 'Six, ' -NoNewline}
            '7'	{write-host 'Seven, ' -NoNewline}
            '8'	{write-host 'Eight, ' -NoNewline}
            '9'	{write-host 'Nine, ' -NoNewline}
            '/' {write-host 'Forward-slash, ' -NoNewline}
            '\' {write-host 'Back-slash, ' -NoNewline}
            '$' {write-host 'Dollar-Sign, ' -NoNewline}
            '*' {write-host 'Star-Sign, ' -NoNewline}
            '?' {write-host 'Question-mark, ' -NoNewline}
            '!' {write-host 'Exclamation-point, ' -NoNewline}
            '@' {write-host 'AT-sign, ' -NoNewline}
            '#' {write-host 'Number-sign, ' -NoNewline}
            '&' {write-host 'Ampersand, ' -NoNewline}
            '(' {write-host 'Opening-Parentheses, ' -NoNewline}
            ')' {write-host 'Closing-Parentheses, ' -NoNewline}
            '[' {write-host 'Opening-brackets, ' -NoNewline}
            ']' {write-host 'Closing-brackets, ' -NoNewline}
            '{' {write-host 'Opening-braces, ' -NoNewline}
            '}' {write-host 'Closing-braces, ' -NoNewline}
            ';' {write-host 'Semi-colon, ' -NoNewline}
            ':' {write-host 'Colon, ' -NoNewline}
            '>' {write-host 'Greater-than-sign, ' -NoNewline}
            '<' {write-host 'Lesser-than-sign, ' -NoNewline}
            '-' {write-host 'Dash, ' -NoNewline}
            '_' {write-host 'Underscore, ' -NoNewline}
            '.' {write-host 'Dot, ' -NoNewline}
            ',' {write-host 'Comma, ' -NoNewline}
            '+' {write-host 'Plus-sign, ' -NoNewline}
            '=' {write-host 'Equals-sign, ' -NoNewline}            
        } 
    } 
}

Export-ModuleMember Get-*