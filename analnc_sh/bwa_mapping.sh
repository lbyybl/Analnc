#!/usr/bin/bash

## this script is to treat the fastq file (in /rd1/home/liby/test/Results/HITS_CLIP_trimmomatic) with bwa, and trans it into sam files;
##2018/1/19
##Boyuan-Li


WorkDir=/rd1/home/liby/test/Results/HITS_CLIP_trimmomatic
INDEX_DIR=/rd1/home/liby/genome/index_hg38_by_bwa_2
INPUT_DIR=$WorkDir
OUT_DIR=/rd1/home/liby/test/Results/BWA_alin_result
#PAR_CLIP_File=$WorkDir/PAR_CLIP
#Reads_count=$WorkDir/reads_count
#mkdir -p $Reads_count 

for i in `ls $INPUT_DIR`;do
bwa aln -n 1 -i 0 -t 20 $INDEX_DIR/index_hg38_by_bwa $INPUT_DIR/$i > $OUT_DIR/${i%.*}.sai 2> $OUT_DIR/${i%.*}_sai.log; \
bwa samse $INDEX_DIR/index_hg38_by_bwa $OUT_DIR/${i%.*}.sai $INPUT_DIR/$i > $OUT_DIR/${i%.*}.sam 2> $OUT_DIR/${i%.*}_sam.log; \
rm $OUT_DIR/${i%.*}.sai

#counts=`grep '@SRR' $INPUT_DIR/$i | wc -l`
#echo -e "${i%.*}\t$counts" >> $Reads_count/primary_reads_count.txt
done

#done


