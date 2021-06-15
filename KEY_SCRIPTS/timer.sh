# INTRODUCE
matUtils summary -i public-2021-06-09.all.masked.nextclade.pangolin.pb -s sample_parsimony.txt
grep "Spain" sample_parsimony.txt | awk '{print $1"\tSpain"}' > spanish_samples.txt
grep "AUS" sample_parsimony.txt | awk '{print $1"\tAUS"}' > aus_samples.txt
grep "Wales" sample_parsimony.txt | awk '{print $1"\tWales"}' > welsh_samples.txt
grep "USA" sample_parsimony.txt | awk '{print $1"\tUSA"}' > usa_samples.txt
grep "England" sample_parsimony.txt | awk '{print $1"\tEngland"}' > british_samples.txt
/usr/bin/time -o introduce1.time -f "%E %M" matUtils introduce -i public-2021-06-09.all.masked.nextclade.pangolin.pb -s spanish_samples.txt -o spanish_introductions.txt #294
/usr/bin/time -o introduce2.time -f "%E %M" matUtils introduce -i public-2021-06-09.all.masked.nextclade.pangolin.pb -s aus_samples.txt -o aus_introductions.txt #13301
/usr/bin/time -o introduce3.time -f "%E %M" matUtils introduce -i public-2021-06-09.all.masked.nextclade.pangolin.pb -s welsh_samples.txt -o wales_introductions.txt #13301
/usr/bin/time -o introduce4.time -f "%E %M" matUtils introduce -i public-2021-06-09.all.masked.nextclade.pangolin.pb -s usa_samples.txt -o usa_introductions.txt #267690
/usr/bin/time -o introduce5.time -f "%E %M" matUtils introduce -i public-2021-06-09.all.masked.nextclade.pangolin.pb -s british_samples.txt -o british_introductions.txt #382626

# UNCERTAINTY
bash runMatUncertainty.sh

# MATUTILS SPECIFIC COMMANDS:
/usr/bin/time -o extract_vcf.time -f "%E %M" matUtils extract -i public-2021-06-09.all.masked.nextclade.pangolin.pb -v public-2021-06-09.all.masked.nextclade.pangolin.vcf
rm public-2021-06-09.all.masked.nextclade.pangolin.vcf
/usr/bin/time -o extract_newick.time -f "%E %M" matUtils extract -i public-2021-06-09.all.masked.nextclade.pangolin.pb -t public-2021-06-09.all.masked.nextclade.pangolin.nwk

# RESOLVE POLYTOMIES: ape and matUtils
/usr/bin/time -o ape_resolve.txt -f "%E %M" Rscript apeResolve.R
/usr/bin/time -o resolve_polytomies.time -f "%E %M" matUtils extract -i public-2021-06-09.all.masked.nextclade.pangolin.pb -R -t public-2021-06-09.all.masked.nextclade.pangolin.resolved.nwk

# SUMMARY: matUtils and nwutils
/usr/bin/time -o summary1.time -f "%E %M" matUtils summary -i public-2021-06-09.all.masked.nextclade.pangolin.pb
/usr/bin/time -o summary2.time -f "%E %M" matUtils extract -i public-2021-06-09.all.masked.nextclade.pangolin.pb -S sample-paths.txt
/usr/bin/time -o summary3.time -f "%E %M" matUtils summary -i public-2021-06-09.all.masked.nextclade.pangolin.pb -A
/usr/bin/time -o nw_stats.time -f "%E %M" nw_stats public-2021-06-09.all.masked.nextclade.pangolin.nwk


# EXTRACT/PRUNE
bash runMatPrune.sh
bash runBCFPrune.sh
bash runTDPrune.sh
bash runNWUPrune.sh
bash runApePrune.sh

# ANNOTATE
bash runMatAnnotate.sh
bash runTDLabel.sh

# GET SUBTREE
bash runMatExtractClade.sh
bash runBCFClade.sh