#!/usr/bin/bash

## clean the adapters of Non-AGO datasets ##
## 2017.10.11 ##
## lifj ##

WorkDir=/rd1/home/lifj/annolnc/data/CLIP_seq/GEO/Non_AGO/HITS_CLIP
HITS_CLIP_Dir=$WorkDir
#PAR_CLIP_Dir=$WorkDir/PAR_CLIP
HITS_OutputDir=/rd1/home/liby/Analnc/CLIP-Seq/HITS-CLIP/Non-AGO/trim_fq
#PAR_OutputDir=$WorkDir/Results/PAR_CLIP
mkdir -p $HITS_OutputDir 

for i in `ls $HITS_CLIP_Dir`;do {
if [ ${i%.*} == "SRR567525" ] || [ ${i%.*} == "SRR567526" ]; then
echo "fastx_clipper $i ..."
fastx_clipper -Q33 -a ATCTCGTATGCCGTCTTCTGCTTG -l 15 -v -i $HITS_CLIP_Dir/$i -o $HITS_OutputDir/${i%.*}_remove_adapter.fastq
else
echo "fastx_clipper $i ..."
fastx_clipper -Q33 -a TCGTATGCCGTCTTCTGCTTG -l 15 -v -i $HITS_CLIP_Dir/$i -o $HITS_OutputDir/${i%.*}_remove_adapter.fastq
fi
} & done
wait


#for j in `ls $PAR_CLIP_Dir`;do
#echo "fastx_clipper $j ..."
#fastx_clipper -Q33 -a TCGTATGCCGTCTTCTGCTTG -l 15 -v -i $PAR_CLIP_Dir/$j -o $PAR_OutputDir/${j%.*}_remove_adapter.fastq
#done



