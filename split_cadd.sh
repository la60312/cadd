gzip -dc whole_genome_SNVs.tsv.gz | split -l 1000000000 -d - cadd_exon_pre_ --filter='gzip > $FILE.gz'
