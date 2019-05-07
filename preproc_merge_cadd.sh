count_num=(0 1 2 3 4 5 6 7 8)
#count_num=(0 1) 
input_array=()
for i in ${count_num[@]}; do
	input_array+=("<(bgzip -d -c cadd_whole_genome_0$i.gz)")
done
out_name=cadd_exon.tsv.gz
awk 'BEGIN{FS=OFS="\t"; print "## CADD v1.3 (c) University of Washington and Hudson-Alpha Institute for Biotechnology 2013-2015. All rights reserved."; print "#Chrom", "Pos", "Ref", "Alt", "RawScore", "PHRED"}{FS=OFS="\t"; if (FNR==1 || FNR==2) {} else {print $0}}' <(bgzip -d -c cadd_whole_genome_00.gz) <(bgzip -d -c cadd_whole_genome_01.gz) <(bgzip -d -c cadd_whole_genome_02.gz) <(bgzip -d -c cadd_whole_genome_03.gz) <(bgzip -d -c cadd_whole_genome_04.gz) <(bgzip -d -c cadd_whole_genome_05.gz) <(bgzip -d -c cadd_whole_genome_06.gz) <(bgzip -d -c cadd_whole_genome_07.gz) <(bgzip -d -c cadd_whole_genome_08.gz) | bgzip > $out_name

#awk 'BEGIN{FS=OFS="\t"; print "## CADD v1.3 (c) University of Washington and Hudson-Alpha Institute for Biotechnology 2013-2015. All rights reserved."; print "#Chrom", "Pos", "Ref", "Alt", "RawScore", "PHRED"}{FS=OFS="\t"; if (FNR==1 || FNR==2) {} else {print $0}}' ${input_array[@]} | bgzip > $out_name
#awk 'BEGIN{FS=OFS="\t"; print "## CADD v1.3 (c) University of Washington and Hudson-Alpha Institute for Biotechnology 2013-2015. All rights reserved."; print "#Chrom", "Pos", "Ref", "Alt", "RawScore", "PHRED"}{FS=OFS="\t"; if (FNR==1 || FNR==2) {} else {print $0}}' <(bgzip -d -c test1.gz) <(bgzip -d -c test1.gz) | bgzip > test.gz

echo "All done"
