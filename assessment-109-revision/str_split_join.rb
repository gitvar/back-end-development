sentence = "Humpty Dumpty sat on a wall."

p str = sentence.split(/\W/).reverse!.join(' ').capitalize + '.'