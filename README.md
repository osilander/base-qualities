# base-qualities

## Compile datasets

### Illumina NovaSeq 6000
- ZymoBIOMICS Microbial Community Standard biological replicate 3 SRR12324251
  - Illumina PE Illuminas Nextera kit NovaSeq 6000
- WGS_NA12878_it3 (SRR25735656) Illumina NovaSeq 6000
- SRX10076835 SRR13687501: Zymo Mock (new) shotgun metagenome
1 ILLUMINA (Illumina NovaSeq 6000) run: 57.6M spots, 17.4G bases, 4.9Gb downloads
  
### BGI
- SRX7630722 SRR10965089: Genomic pair-end reads of NA12878 (MGI)

### PacBio RSII

### PacBio Revio

### ONT 9.4
- **SRR23513621** NA12878 DNA sequencing from nanopore WSG consortium 
  - basecalled sequences (Guppy 6.1.3 super accuracy)
- **SRX22703621**: WGS of HG001 using Oxford Nanopore SQK-LSK109 (PromethION) 
- **ERX3306008**: MinION sequencing
- **SRX24079301**: Nanopore Sequencing of ZymoBIOMICS SRR28476579

### ONT 10.4
**Guppy 6.3.7**
**SRX19163176** SRR23215363<br>
Nanopore WGS of HG002

**Guppy 6.1.5 high accuracy**
**SRX19163175**<br> SRR23215364
Nanopore WGS of HG002

**Dorado XX**

```
ml datasets
ml sratoolkit/3.0.2
prefetch SRR12324251
fasterq-dump SRR12324251

```

Results first in a `dir` with the name of rhe SRA 

### Details

**SRX7630722**: Genomic pair-end reads of NA12878 (MGI)
1 BGISEQ (BGISEQ-500) run: 752.4M spots, 112.9G bases, 70.1Gb downloads
Design: Library preparation for the NA12878 sample was performed with the MGIEasy DNA LibraryPrep Kit V1.1 (MGI, 940-200022-00) following the manufacturers instructions. 1g of genomic DNA at a concentration of 12.5ng/L was fragmented with an E220 Covaris program optimized to yield fragments of 450bp average length. The DNB library was loaded in a single lane and sequenced on a MGISEQ-2000 instrument with a paired-end modus and read length of 150bp with the MGISEQ-2000RS High-throughput Sequencing Set PE150 (MGI, 1000003981) accord- ing to (DNBs) manufacturers instructions.

**SRX7630723**: Genomic pair-end reads of NA12878 (Illumina)
1 ILLUMINA (Illumina NovaSeq 6000) run: 548.3M spots, 165.6G bases, 52Gb downloads
Design: Library was prepared using the TruSeq DNA PCR-Free Library Prep kit (Illumina, FC-121-3001) following the TruSeq DNA PCR-free reference guide (Illumina, 1000000039279v00). 1g of genomic DNA was used for fragmentation on an E220 Covaris to yield insert sizes of 350bp. A S2 flow cell was loaded with 2.2nM on a NovaSeq6000 instrument to generate 2x151 paired-end reads.

**SRX7630724**: Genomic long reads of NA12878 (Nanopore)
1 OXFORD_NANOPORE (PromethION) run: 17.6M spots, 116.3G bases, 93.5Gb downloads
Design: Three flow cells were run with the sample NA12878. One flow cell was loaded with a library prepared from unsheared genomic DNA. For the additional two sequencing runs, 14g of NA12878 genomic DNA was mechanically sheared with Megaruptor 3 (Diagenode) with the manufacturers recommended speed to get sheared DNA with an average fragment length of 30Kb.

**ERX3306008**: MinION sequencing
1 OXFORD_NANOPORE (MinION) run: 867,351 spots, 5.8G bases, 4.8Gb downloads
Submitted by: WELLCOME CENTRE FOR HUMAN GENETICS, UNIVERSITY OF OXFORD (WELLCOME CENTRE FOR HUMAN GENETICS, UNIVERSITY OF )
Study: We evaluate the potential for routine WGS using ONT by sequencing the well-characterised reference sample NA12878 and the genome of an individual with ataxia-pancytopenia syndrome accompanied by severe immune dysregulation.

**SRX19163176**: Nanopore WGS of HG002 - basecalled sequences (Guppy 6.3.7 super accuracy)
1 OXFORD_NANOPORE (PromethION) run: 14.3M spots, 104.9G bases, 85.9Gb downloads
Design: Sheared DNA libraries (~17Kb) were prepared using the ONT LSK114 ligation library prep and a R10.4.1 flow cell was used to generate ~30X genome coverage. Guppy 6.3.7 with dna_r10.4.1_e8.2_sup@v3.5.1 model was used for basecalling and these are the reads that passed the qscore filter for threshold 9.

**SRX19163175**: Nanopore WGS of HG002 - basecalled sequences (Guppy 6.1.5 high accuracy)
1 OXFORD_NANOPORE (PromethION) run: 15.3M spots, 102.2G bases, 86.6Gb downloads
Design: Sheared DNA libraries (~17Kb) were prepared using the ONT LSK114 ligation library prep and a R10.4.1 flow cell was used to generate ~30X genome coverage. Guppy 6.1.5 with dna_r10.4.1_e8.2_hac@v3.5.1 model was used for live basecalling and these are the reads that passed the default qscore filter.

**SRX24079301**: Nanopore Sequencing of ZymoBIOMICS Microbial Community Standard
1 OXFORD_NANOPORE (MinION) run: 123,223 spots, 334.9M bases, 288.1Mb downloads
Design: All samples consisted of previously extracted genome provided by the respective manufacturer (American Tissue Culture Collection (ATCC) Virginia, USA and Zymo Research California, USA). Sequencing libraries were prepared using Oxford Nanopore Rapid Sequencing gDNA kit (SQK-RAD004) according to the manufacturers specifications. Sequencing was performed on a MinION MK1C device using a R9.4.1 version flow cell. Sequences were collected for 1 hour.

ERX3181443: GridION sequencing
1 OXFORD_NANOPORE (GridION) run: 3.7M spots, 16.5G bases, 13.7Gb downloads. Guppy v2.2.2 GPU

ERX11797827: PromethION sequencing
1 OXFORD_NANOPORE (PromethION) run: 7.4M spots, 20.3G bases, 16.1Gb downloads
Submitted by: Aalborg University
Study: Zymo HMW Nanopore R10.4.1 5khz High Duplex. ERR12421469

SRX20655544: zymo hmw mock 5khz-sup
1 OXFORD_NANOPORE (GridION) run: 2.5M spots, 16.3G bases, 12.9Gb downloads
Design: LSK114
Submitted by: Aalborg University
Study: Nanopore_R10.4.1_zymo_hmw_mock SRR24893244