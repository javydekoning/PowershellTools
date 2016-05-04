Function Get-NATOSpelling  {
     param
     (
         [string] $string,
         [switch] $Speak
     )
    
    $Voice = New-Object –ComObject SAPI.SPVoice

    Write-Output "$string : "
    for ($i = 0; $i -lt $string.length; $i++)
    {
        switch -CaseSensitive ($string[$i]) 
        {
            'A'	{Write-Host -NoNewline -Object 'ALFA, '               
                 $null = $Voice.Speak('ALFA')                                                     }
            'B'	{Write-Host -NoNewline -Object 'BRAVO, '                              
                 $null = $Voice.Speak('BRAVO')                                                    }
            'C'	{Write-Host -NoNewline -Object 'CHARLIE, '                            
                 $null = $Voice.Speak('CHARLIE')                                                  }
            'D'	{Write-Host -NoNewline -Object 'DELTA, '                              
                 $null = $Voice.Speak('DELTA')                                                    }
            'E'	{Write-Host -NoNewline -Object 'ECHO, '                               
                 $null = $Voice.Speak('ECHO')                                                     }
            'F'	{Write-Host -NoNewline -Object 'FOXTROT, '                            
                 $null = $Voice.Speak('FOXTROT')                                                  }
            'G'	{Write-Host -NoNewline -Object 'GOLF, '                               
                 $null = $Voice.Speak('GOLF')                                                     }
            'H'	{Write-Host -NoNewline -Object 'HOTEL, '                              
                 $null = $Voice.Speak('HOTEL')                                                    }
            'I'	{Write-Host -NoNewline -Object 'INDIA, '                              
                 $null = $Voice.Speak('INDIA')                                                    }
            'J'	{Write-Host -NoNewline -Object 'JULIET, '                             
                 $null = $Voice.Speak('JULIET')                                                   }
            'K'	{Write-Host -NoNewline -Object 'KILO, '                               
                 $null = $Voice.Speak('KILO')                                                     }
            'L'	{Write-Host -NoNewline -Object 'LIMA, '                               
                 $null = $Voice.Speak('LIMA')                                                     }
            'M'	{Write-Host -NoNewline -Object 'MIKE, '               
                 $null = $Voice.Speak('MIKE')                                                     }
            'N'	{Write-Host -NoNewline -Object 'NOVEMBER, '                              
                 $null = $Voice.Speak('NOVEMBER')                                                 }
            'O'	{Write-Host -NoNewline -Object 'OSCAR, '                                 
                 $null = $Voice.Speak('OSCAR')                                                    }
            'P'	{Write-Host -NoNewline -Object 'PAPA, '                                  
                 $null = $Voice.Speak('PAPA')                                                     }
            'Q'	{Write-Host -NoNewline -Object 'QUEBEC, '                                
                 $null = $Voice.Speak('QUEBEC')                                                   }
            'R'	{Write-Host -NoNewline -Object 'ROMEO, '                                 
                 $null = $Voice.Speak('ROMEO')                                                    }
            'S'	{Write-Host -NoNewline -Object 'SIERRA, '                                
                 $null = $Voice.Speak('SIERRA')                                                   }
            'T'	{Write-Host -NoNewline -Object 'TANGO, '                                 
                 $null = $Voice.Speak('TANGO')                                                    }
            'U'	{Write-Host -NoNewline -Object 'UNIFORM, '                               
                 $null = $Voice.Speak('UNIFORM')                                                  }
            'V'	{Write-Host -NoNewline -Object 'VICTOR, '                                
                 $null = $Voice.Speak('VICTOR')                                                   }
            'W'	{Write-Host -NoNewline -Object 'WHISKEY, '                               
                 $null = $Voice.Speak('WHISKEY')                                                  }
            'X'	{Write-Host -NoNewline -Object 'X-RAY, '                                 
                 $null = $Voice.Speak('X-RAY')                                                    }
            'Y'	{Write-Host -NoNewline -Object 'YANKEE, '                                
                 $null = $Voice.Speak('YANKEE')                                                   }
            'Z'	{Write-Host -NoNewline -Object 'ZULU, '                                  
                 $null = $Voice.Speak('ZULU')                                                     }
            'a'	{Write-Host -NoNewline -Object 'alfa, '               
                 $null = $Voice.Speak('alfa')                                                     }
            'b'	{Write-Host -NoNewline -Object 'bravo, '                                  
                 $null = $Voice.Speak('bravo')                                                    }
            'c'	{Write-Host -NoNewline -Object 'charlie, '                                
                 $null = $Voice.Speak('charlie')                                                  }
            'd'	{Write-Host -NoNewline -Object 'delta, '                                  
                 $null = $Voice.Speak('delta')                                                    }
            'e'	{Write-Host -NoNewline -Object 'echo, '                                   
                 $null = $Voice.Speak('echo')                                                     }
            'f'	{Write-Host -NoNewline -Object 'foxtrot, '                                
                 $null = $Voice.Speak('foxtrot')                                                  }
            'g'	{Write-Host -NoNewline -Object 'golf, '                                   
                 $null = $Voice.Speak('golf')                                                     }
            'h'	{Write-Host -NoNewline -Object 'hotel, '                                  
                 $null = $Voice.Speak('hotel')                                                    }
            'i'	{Write-Host -NoNewline -Object 'india, '                                  
                 $null = $Voice.Speak('india')                                                    }
            'j'	{Write-Host -NoNewline -Object 'juliet, '                                 
                 $null = $Voice.Speak('juliet')                                                   }
            'k'	{Write-Host -NoNewline -Object 'kilo, '                                   
                 $null = $Voice.Speak('kilo')                                                     }
            'l'	{Write-Host -NoNewline -Object 'lima, '                                   
                 $null = $Voice.Speak('lima')                                                     }
            'm'	{Write-Host -NoNewline -Object 'mike, '               
                 $null = $Voice.Speak('mike')                                                     }
            'n'	{Write-Host -NoNewline -Object 'november, '                        
                 $null = $Voice.Speak('november')                                                 }
            'o'	{Write-Host -NoNewline -Object 'oscar, '                           
                 $null = $Voice.Speak('oscar')                                                    }
            'p'	{Write-Host -NoNewline -Object 'papa, '                                 
                 $null = $Voice.Speak('papa')                                                     }
            'q'	{Write-Host -NoNewline -Object 'quebec, '                          
                 $null = $Voice.Speak('quebec')                                                   }
            'r'	{Write-Host -NoNewline -Object 'romeo, '                           
                 $null = $Voice.Speak('romeo')                                                    }
            's'	{Write-Host -NoNewline -Object 'sierra, '                          
                 $null = $Voice.Speak('sierra')                                                   }
            't'	{Write-Host -NoNewline -Object 'tango, '                           
                 $null = $Voice.Speak('tango')                                                    }
            'u'	{Write-Host -NoNewline -Object 'uniform, '                         
                 $null = $Voice.Speak('uniform')                                                  }
            'v'	{Write-Host -NoNewline -Object 'victor, '                          
                 $null = $Voice.Speak('victor')                                                   }
            'w'	{Write-Host -NoNewline -Object 'whiskey, '                         
                 $null = $Voice.Speak('whiskey')                                                  }
            'x'	{Write-Host -NoNewline -Object 'x-ray, '                           
                 $null = $Voice.Speak('x-ray')                                                    }
            'y'	{Write-Host -NoNewline -Object 'yankee, '                          
                 $null = $Voice.Speak('yankee')                                                   }
            'z'	{Write-Host -NoNewline -Object 'zulu, '               
                 $null = $Voice.Speak('zulu')                                                     }
            '0'	{Write-Host -NoNewline -Object 'Zero, '                                 
                 $null = $Voice.Speak('Zero')                                                     }
            '1'	{Write-Host -NoNewline -Object 'One, '                                   
                 $null = $Voice.Speak('One')                                                      }
            '2'	{Write-Host -NoNewline -Object 'Two, '                                   
                 $null = $Voice.Speak('Two')                                                      }
            '3'	{Write-Host -NoNewline -Object 'Tree, '                                  
                 $null = $Voice.Speak('Tree')                                                     }
            '4'	{Write-Host -NoNewline -Object 'Four, '                                 
                 $null = $Voice.Speak('Four')                                                     }
            '5'	{Write-Host -NoNewline -Object 'Five, '                                 
                 $null = $Voice.Speak('Five')                                                     }
            '6'	{Write-Host -NoNewline -Object 'Six, '                                   
                 $null = $Voice.Speak('Six')                                                      }
            '7'	{Write-Host -NoNewline -Object 'Seven, '              
                 $null = $Voice.Speak('Seven')                                                    }
            '8'	{Write-Host -NoNewline -Object 'Eight, '              
                 $null = $Voice.Speak('Eight')                                                    }
            '9'	{Write-Host -NoNewline -Object 'Nine, '               
                 $null = $Voice.Speak('Nine')                                                     }
            '/' {Write-Host -NoNewline -Object 'Forward-slash, '                
                 $null = $Voice.Speak('Forward-slash')                                            }
            '\' {Write-Host -NoNewline -Object 'Back-slash, '                   
                 $null = $Voice.Speak('Back-slash')                                               }
            '$' {Write-Host -NoNewline -Object 'Dollar-Sign, '                  
                 $null = $Voice.Speak('Dollar-Sign')                                              }
            '*' {Write-Host -NoNewline -Object 'Star-Sign, '                    
                 $null = $Voice.Speak('Star-Sign')                                                }
            '?' {Write-Host -NoNewline -Object 'Question-mark, '                
                 $null = $Voice.Speak('Question-mark')                                            }
            '!' {Write-Host -NoNewline -Object 'Exclamation-point, '            
                 $null = $Voice.Speak('Exclamation-point')                                        }
            '@' {Write-Host -NoNewline -Object 'AT-sign, '                      
                 $null = $Voice.Speak('AT-sign')                                                  }
            '#' {Write-Host -NoNewline -Object 'Number-sign, '        
                 $null = $Voice.Speak('Number-sign')                                              }
            '&' {Write-Host -NoNewline -Object 'Ampersand, '          
                 $null = $Voice.Speak('Ampersand')                                                }
            '(' {Write-Host -NoNewline -Object 'Opening-Parentheses, '
                 $null = $Voice.Speak('Opening-Parentheses')                                      }
            ')' {Write-Host -NoNewline -Object 'Closing-Parentheses, '
                 $null = $Voice.Speak('Closing-Parentheses')                                      }
            '[' {Write-Host -NoNewline -Object 'Opening-brackets, '   
                 $null = $Voice.Speak('Opening-brackets')                                         }
            ']' {Write-Host -NoNewline -Object 'Closing-brackets, '                      
                 $null = $Voice.Speak('Closing-brackets')                                         }
            '{' {Write-Host -NoNewline -Object 'Opening-braces, '     
                 $null = $Voice.Speak('Opening-braces')                                           }
            '}' {Write-Host -NoNewline -Object 'Closing-braces, '                         
                 $null = $Voice.Speak('Closing-braces')                                           }
            ';' {Write-Host -NoNewline -Object 'Semi-colon, '         
                 $null = $Voice.Speak('Semi-colon')                                               }
            ':' {Write-Host -NoNewline -Object 'Colon, '              
                 $null = $Voice.Speak('Colon')                                                    }
            '>' {Write-Host -NoNewline -Object 'Greater-than-sign, '  
                 $null = $Voice.Speak('Greater-than-sign')                                        }
            '<' {Write-Host -NoNewline -Object 'Lesser-than-sign, '   
                 $null = $Voice.Speak('Lesser-than-sign')                                         }
            '-' {Write-Host -NoNewline -Object 'Dash, '               
                 $null = $Voice.Speak('Dash')                                                     }
            '_' {Write-Host -NoNewline -Object 'Underscore, '         
                 $null = $Voice.Speak('Underscore')                                               }
            '.' {Write-Host -NoNewline -Object 'Dot, '                 
                 $null = $Voice.Speak('Dot')                                                      }
            ',' {Write-Host -NoNewline -Object 'Comma, '              
                 $null = $Voice.Speak('Comma')                                                    }
            '+' {Write-Host -NoNewline -Object 'Plus-sign, '          
                 $null = $Voice.Speak('Plus-sign')                                                }
            '=' {Write-Host -NoNewline -Object 'Equals-sign, '        
                 $null = $Voice.Speak('Equals-sign')                                              }
        } 
    } 
}

Export-ModuleMember Get-*