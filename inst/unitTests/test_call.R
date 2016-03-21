rm(list=ls())
# dependents 
setwd("/Users/hongdong/Desktop/tf_grabber")
require(trena)
require(GeneRegulationUtilities)
require(igvR)
source("tfGrabber1.R")

# load the trns
load("demoTRN.Rdata")

# collect all TRNs into a list
trn.list <- list(trn.rtrim_isb_AD_cer, trn.rtrim_isb_AD)

# integrate TRN with footprint data: only 10 genes for demo
genelist=c("MEF2C","CR1","ABCA7","BIN1","BACE1","APP","PSEN1","C4B")
inputTRN=trn.rtrim_isb_AD_cer
trn=tfGrabber1(genelist,inputTRN,label="isb_AD_cer",promoterDist = 1000000)

# display TRN in IGV
igv <- igvR()
connected(igv)
displayBedTable(igv, trn$bed4igv,"test_TRN_track1")


