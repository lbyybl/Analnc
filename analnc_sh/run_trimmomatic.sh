#!bin/bash

## this script is used to fiter the low quality reads  ##
## 2018.1.31 ##

## liby ##
Tools=/rd1/home/lifj/software/Trimmomatic-0.36
WorkDir=/rd1/home/liby/Analnc/CLIP-Seq/HITS-CLIP/Non-AGO/trim_fq
HITS_CLIP_Dir=$WorkDir
#PAR_CLIP_Dir=$WorkDir/PAR_CLIP
HITS_OutputDir=/rd1/home/liby/Analnc/CLIP-Seq/HITS-CLIP/Non-AGO/cutadaptor_filter_lowquality
#PAR_OutputDir=$WorkDir/Results/PAR_CLIP
mkdir -p $HITS_OutputDir 

#for i in `ls $HITS_CLIP_Dir`;do
for i in `ls $HITS_CLIP_Dir`;do
echo "fastx_clipper $i ..."
java -jar $Tools/trimmomatic-0.36.jar SE -threads 50 -phred33 $HITS_CLIP_Dir/$i $HITS_OutputDir/${i%.*}.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:15
done
#if [ ${i%.*} == "SRR1024120" ] || [ ${i%.*} == "SRR1024128" ] || [  ${i%.*} == "SRR1024129" ] || [ ${i%.*} == "SRR1024130" ] || [ ${i%.*} == "SRR1024133" ]; then
#fastx_clipper -Q33 -a GTTACGCTCGCCGTAGAGG -l 15 -v -i $HITS_CLIP_Dir/$i -o $HITS_OutputDir/${i%.*}_remove_adapter.fastq
#else
#echo "fastx_clipper $i ..."
#fastx_clipper -Q33 -a TCGTATGCCGTCTTCTGCTTG -l 15 -v -i $HITS_CLIP_Dir/$i -o $HITS_OutputDir/${i%.*}_remove_adapter.fastq
#fi
#done


#for j in `ls $PAR_CLIP_Dir`;do
#echo "fastx_clipper $j ..."
#java -jar $Tools/trimmomatic-0.36.jar SE -phred33 $PAR_CLIP_Dir/$j $PAR_OutputDir/${j%.*}.trimmed.again.fq ILLUMINACLIP:/rd1/home/lifj/annolnc/data/CLIP_seq/GEO/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:15
##fastx_clipper -Q33 -a TCGTATGCCGTCTTCTGCTTG -l 15 -v -i $PAR_CLIP_Dir/$j -o $PAR_OutputDir/${j%.*}_remove_adapter.fastq
#done

