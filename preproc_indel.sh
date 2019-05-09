count_num=(0)
for i in ${count_num[@]}; do
	input_name=InDels.tsv.gz
	out_name=index_exon.gz
	echo $input_name
	bgzip -d -c $input_name | awk '{FS=OFS="\t"; if (FNR==1) {print $0} else if (FNR==2){print "#CHROM", "POS", "ID", "REF", "ALT", "QUAL", "FILTER", "INFO"} else {print $1, $2, ".", $3, $4, ".", $5, $6}}' | vcftools --vcf - --bed ncbi_exon_extend_100bp.txt --recode --recode-INFO-all --stdout | awk '{FS=OFS="\t"; if (FNR==1) {print $0} else if (FNR==2){print "#Chrom", "pos", "Ref", "Alt", "RawScore", "PHRED"} else {print $1, $2, $4, $5, $7, $8}}' |  bgzip > $out_name & 
done

wait
echo "All done"
