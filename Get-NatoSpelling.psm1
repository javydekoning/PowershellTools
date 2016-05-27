Function Get-NATOSpelling ([string]$string) {    
    Write-Output "$string : " -NoNewline
    [string]$output
    for ($i = 0; $i -lt $string.length; $i++)
    {
        switch -casesensitive ($string[$i]) 
        {
            'A'	{$output += 'ALFA, ' -NoNewline}
            'B'	{$output += 'BRAVO, ' -NoNewline}
            'C'	{$output += 'CHARLIE, ' -NoNewline}
            'D'	{$output += 'DELTA, ' -NoNewline}
            'E'	{$output += 'ECHO, ' -NoNewline}
            'F'	{$output += 'FOXTROT, ' -NoNewline}
            'G'	{$output += 'GOLF, ' -NoNewline}
            'H'	{$output += 'HOTEL, ' -NoNewline}
            'I'	{$output += 'INDIA, ' -NoNewline}
            'J'	{$output += 'JULIET, ' -NoNewline}
            'K'	{$output += 'KILO, ' -NoNewline}
            'L'	{$output += 'LIMA, ' -NoNewline}
            'M'	{$output += 'MIKE, ' -NoNewline}
            'N'	{$output += 'NOVEMBER, ' -NoNewline}
            'O'	{$output += 'OSCAR, ' -NoNewline}
            'P'	{$output += 'PAPA, ' -NoNewline}
            'Q'	{$output += 'QUEBEC, ' -NoNewline}
            'R'	{$output += 'ROMEO, ' -NoNewline}
            'S'	{$output += 'SIERRA, ' -NoNewline}
            'T'	{$output += 'TANGO, ' -NoNewline}
            'U'	{$output += 'UNIFORM, ' -NoNewline}
            'V'	{$output += 'VICTOR, ' -NoNewline}
            'W'	{$output += 'WHISKEY, ' -NoNewline}
            'X'	{$output += 'X-RAY, ' -NoNewline}
            'Y'	{$output += 'YANKEE, ' -NoNewline}
            'Z'	{$output += 'ZULU, ' -NoNewline}
            'a'	{$output += 'alfa, ' -NoNewline}
            'b'	{$output += 'bravo, ' -NoNewline}
            'c'	{$output += 'charlie, ' -NoNewline}
            'd'	{$output += 'delta, ' -NoNewline}
            'e'	{$output += 'echo, ' -NoNewline}
            'f'	{$output += 'foxtrot, ' -NoNewline}
            'g'	{$output += 'golf, ' -NoNewline}
            'h'	{$output += 'hotel, ' -NoNewline}
            'i'	{$output += 'india, ' -NoNewline}
            'j'	{$output += 'juliet, ' -NoNewline}
            'k'	{$output += 'kilo, ' -NoNewline}
            'l'	{$output += 'lima, ' -NoNewline}
            'm'	{$output += 'mike, ' -NoNewline}
            'n'	{$output += 'november, ' -NoNewline}
            'o'	{$output += 'oscar, ' -NoNewline}
            'p'	{$output += 'papa, ' -NoNewline}
            'q'	{$output += 'quebec, ' -NoNewline}
            'r'	{$output += 'romeo, ' -NoNewline}
            's'	{$output += 'sierra, ' -NoNewline}
            't'	{$output += 'tango, ' -NoNewline}
            'u'	{$output += 'uniform, ' -NoNewline}
            'v'	{$output += 'victor, ' -NoNewline}
            'w'	{$output += 'whiskey, ' -NoNewline}
            'x'	{$output += 'x-ray, ' -NoNewline}
            'y'	{$output += 'yankee, ' -NoNewline}
            'z'	{$output += 'zulu, ' -NoNewline}
            '0'	{$output += 'Zero, ' -NoNewline}
            '1'	{$output += 'One, ' -NoNewline}
            '2'	{$output += 'Two, ' -NoNewline}
            '3'	{$output += 'Tree, ' -NoNewline}
            '4'	{$output += 'Four, ' -NoNewline}
            '5'	{$output += 'Five, ' -NoNewline}
            '6'	{$output += 'Six, ' -NoNewline}
            '7'	{$output += 'Seven, ' -NoNewline}
            '8'	{$output += 'Eight, ' -NoNewline}
            '9'	{$output += 'Nine, ' -NoNewline}
            '/' {$output += 'Forward-slash, ' -NoNewline}
            '\' {$output += 'Back-slash, ' -NoNewline}
            '$' {$output += 'Dollar-Sign, ' -NoNewline}
            '*' {$output += 'Star-Sign, ' -NoNewline}
            '?' {$output += 'Question-mark, ' -NoNewline}
            '!' {$output += 'Exclamation-point, ' -NoNewline}
            '@' {$output += 'AT-sign, ' -NoNewline}
            '#' {$output += 'Number-sign, ' -NoNewline}
            '&' {$output += 'Ampersand, ' -NoNewline}
            '(' {$output += 'Opening-Parentheses, ' -NoNewline}
            ')' {$output += 'Closing-Parentheses, ' -NoNewline}
            '[' {$output += 'Opening-brackets, ' -NoNewline}
            ']' {$output += 'Closing-brackets, ' -NoNewline}
            '{' {$output += 'Opening-braces, ' -NoNewline}
            '}' {$output += 'Closing-braces, ' -NoNewline}
            ';' {$output += 'Semi-colon, ' -NoNewline}
            ':' {$output += 'Colon, ' -NoNewline}
            '>' {$output += 'Greater-than-sign, ' -NoNewline}
            '<' {$output += 'Lesser-than-sign, ' -NoNewline}
            '-' {$output += 'Dash, ' -NoNewline}
            '_' {$output += 'Underscore, ' -NoNewline}
            '.' {$output += 'Dot, ' -NoNewline}
            ',' {$output += 'Comma, ' -NoNewline}
            '+' {$output += 'Plus-sign, ' -NoNewline}
            '=' {$output += 'Equals-sign, ' -NoNewline}            
        } 
    }
    return $output 
}

Export-ModuleMember Get-*