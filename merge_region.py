import os

chr_lines = {}
with open('ncbi_other.txt', 'r') as f:
    lines = f.readlines()
    for line in lines:
        info = line.split('\t')
        chr_str = info[0]
        if chr_str not in chr_lines:
            chr_lines[chr_str] = []
        chr_lines[chr_str].append(line)

with open('ncbi_all_exon.txt', 'r') as f:
    with open('ncbi_exon.txt', 'w') as o:
        line = f.readline()
        while line:
            info = line.split('\t')
            chr_str = info[0]
            if chr_str in chr_lines:
                for out_line in chr_lines[chr_str]:
                    o.write(out_line)
                del chr_lines[chr_str]
            o.write(line)
            line = f.readline()
        for key in chr_lines.keys():
            for out_line in chr_lines[key]:
                o.write(out_line)

            

