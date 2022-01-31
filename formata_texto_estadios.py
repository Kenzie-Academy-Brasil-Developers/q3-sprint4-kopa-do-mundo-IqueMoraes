

with open("snippet_tabela_estadios.txt", "r") as text:
    for index, line in enumerate(text):
        if index < 4:
            continue

        f_line = line.split(',')
        for i, word in enumerate(f_line):
            if i != 4:
                f_line[i] = f"'{word}'"
            else:
                f_line[i] = word[0:-1]


        formated_line = ', '.join(f_line)
        formated_line = f"({formated_line}),\n"
        with open("dados_estadios.txt", "a") as new_text:
            new_text.write(formated_line)
    
