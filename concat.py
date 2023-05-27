# List of files to concatenate
file_list = ['main.sql', 'relations.sql', 'multivalue.sql', 'inserciones.sql']  # replace with your actual file names
output_name = './final.sql'

def concatenate_files(file_list, output_file):
    with open(output_file, 'w') as outfile:
        for fname in file_list:
            with open('./sql/' + fname) as infile:
                for line in infile:
                    outfile.write(line)
                outfile.write('\n')  # write a newline between files

concatenate_files(file_list, output_name)

