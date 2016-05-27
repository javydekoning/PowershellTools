Function Get-NATOSpelling ([string]$string) {    
    Write-Output "$string : "
    [string]$output
    for ($i = 0; $i -lt $string.length; $i++)
    {
        switch -casesensitive ($string[$i]) 
        {
            'A'	{$output += 'ALFA, '}
            'B'	{$output += 'BRAVO, '}
            'C'	{$output += 'CHARLIE, '}
            'D'	{$output += 'DELTA, '}
            'E'	{$output += 'ECHO, '}
            'F'	{$output += 'FOXTROT, '}
            'G'	{$output += 'GOLF, '}
            'H'	{$output += 'HOTEL, '}
            'I'	{$output += 'INDIA, '}
            'J'	{$output += 'JULIET, '}
            'K'	{$output += 'KILO, '}
            'L'	{$output += 'LIMA, '}
            'M'	{$output += 'MIKE, '}
            'N'	{$output += 'NOVEMBER, '}
            'O'	{$output += 'OSCAR, '}
            'P'	{$output += 'PAPA, '}
            'Q'	{$output += 'QUEBEC, '}
            'R'	{$output += 'ROMEO, '}
            'S'	{$output += 'SIERRA, '}
            'T'	{$output += 'TANGO, '}
            'U'	{$output += 'UNIFORM, '}
            'V'	{$output += 'VICTOR, '}
            'W'	{$output += 'WHISKEY, '}
            'X'	{$output += 'X-RAY, '}
            'Y'	{$output += 'YANKEE, '}
            'Z'	{$output += 'ZULU, '}
            'a'	{$output += 'alfa, '}
            'b'	{$output += 'bravo, '}
            'c'	{$output += 'charlie, '}
            'd'	{$output += 'delta, '}
            'e'	{$output += 'echo, '}
            'f'	{$output += 'foxtrot, '}
            'g'	{$output += 'golf, '}
            'h'	{$output += 'hotel, '}
            'i'	{$output += 'india, '}
            'j'	{$output += 'juliet, '}
            'k'	{$output += 'kilo, '}
            'l'	{$output += 'lima, '}
            'm'	{$output += 'mike, '}
            'n'	{$output += 'november, '}
            'o'	{$output += 'oscar, '}
            'p'	{$output += 'papa, '}
            'q'	{$output += 'quebec, '}
            'r'	{$output += 'romeo, '}
            's'	{$output += 'sierra, '}
            't'	{$output += 'tango, '}
            'u'	{$output += 'uniform, '}
            'v'	{$output += 'victor, '}
            'w'	{$output += 'whiskey, '}
            'x'	{$output += 'x-ray, '}
            'y'	{$output += 'yankee, '}
            'z'	{$output += 'zulu, '}
            '0'	{$output += 'Zero, '}
            '1'	{$output += 'One, '}
            '2'	{$output += 'Two, '}
            '3'	{$output += 'Tree, '}
            '4'	{$output += 'Four, '}
            '5'	{$output += 'Five, '}
            '6'	{$output += 'Six, '}
            '7'	{$output += 'Seven, '}
            '8'	{$output += 'Eight, '}
            '9'	{$output += 'Nine, '}
            '/' {$output += 'Forward-slash, '}
            '\' {$output += 'Back-slash, '}
            '$' {$output += 'Dollar-Sign, '}
            '*' {$output += 'Star-Sign, '}
            '?' {$output += 'Question-mark, '}
            '!' {$output += 'Exclamation-point, '}
            '@' {$output += 'AT-sign, '}
            '#' {$output += 'Number-sign, '}
            '&' {$output += 'Ampersand, '}
            '(' {$output += 'Opening-Parentheses, '}
            ')' {$output += 'Closing-Parentheses, '}
            '[' {$output += 'Opening-brackets, '}
            ']' {$output += 'Closing-brackets, '}
            '{' {$output += 'Opening-braces, '}
            '}' {$output += 'Closing-braces, '}
            ';' {$output += 'Semi-colon, '}
            ':' {$output += 'Colon, '}
            '>' {$output += 'Greater-than-sign, '}
            '<' {$output += 'Lesser-than-sign, '}
            '-' {$output += 'Dash, '}
            '_' {$output += 'Underscore, '}
            '.' {$output += 'Dot, '}
            ',' {$output += 'Comma, '}
            '+' {$output += 'Plus-sign, '}
            '=' {$output += 'Equals-sign, '}            
        } 
    }
    return $output 
}

Export-ModuleMember Get-*