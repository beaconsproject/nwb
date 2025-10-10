# This scripts creates the downloads.Rmd script
# PV 2017-07-26

library(tidyverse)
library(knitr)

ecoregions <- c('3','12','13','14','15','17','18','21','22','23a','23b','24','25','27','28','29','31','32','169','170','171','174','175','176','177','178','179','180','181','182','183')
fo <- file("_docs/downloads.csv", "w")
cat("Ecoregion,Product,Type,Updated,Download\n", file=fo)

for (eco in ecoregions) {

	if (eco %in% c('12','17','28')) {
		cat(eco,",Climate change - ranks,table,13-Oct-2017,[ZIP](downloads/climate_change/eco",eco,"_cc.zip)\n", sep="", file=fo)
		cat(eco,",Focal species - ranks,table,13-Oct-2017,[ZIP](downloads/focal_species/eco",eco,"_fs.zip)\n", sep="", file=fo)
		cat(eco,",Benchmark networks,shapefile,13-Oct-2017,[ZIP](downloads/benchmark_networks/eco",eco,"_benchmark_networks.zip)\n", sep="", file=fo)
	} else {
		cat(eco,",Benchmarks analysis,report,13-Dec-2017,[PDF](downloads/eco_report/eco",eco,"_results_final.pdf)\n", sep="", file=fo)
		cat(eco,",Benchmark properties - ranks,table,13-Oct-2017,[ZIP](downloads/benchmark_properties/eco",eco,"_bp.zip)\n", sep="", file=fo)
		cat(eco,",Climate change - ranks,table,13-Oct-2017,[ZIP](downloads/climate_change/eco",eco,"_cc.zip)\n", sep="", file=fo)
		cat(eco,",Focal species - ranks,table,13-Oct-2017,[ZIP](downloads/focal_species/eco",eco,"_fs.zip)\n", sep="", file=fo)
		cat(eco,",Benchmark networks,shapefile,13-Oct-2017,[ZIP](downloads/benchmark_networks/eco",eco,"_benchmark_networks.zip)\n", sep="", file=fo)
	}
}
close(fo)

x <- read_csv("_docs/downloads.csv")
fo <- file("downloads.Rmd", "w")

cat('---
title: "Reports, Tables & Maps"
output:
  html_document:
    toc: true
    toc_float:
      collapsed: false
      smooth_scroll: false
    theme: cosmo
    css: _styles.css
---

---


**NWB Reports**

<ul>
<li>Main report - [Download PDF](downloads/main_report/BEACONs_benchmark_report.pdf)</li>
<li>All ecoregion reports - [Download ZIP](downloads/eco_report/Eco_results_final.zip)</li>
<li>MDR analysis - [Download PDF](downloads/mdr_report/BEACONs_mdr_report.pdf)</li>
<li>Focal species report - [Download PDF](downloads/focal_species_report/BEACONs_focal_species_report.pdf)</li>
<li>Focal species appendix A: Review of management plans - [Download PDF](downloads/focal_species_report/Appendices/Appendix_A_bibliography_mgmt_plans.pdf)</li>
<li>Focal species appendix B: Management plans goals & targets - [Download XLSX](downloads/focal_species_report/Appendices/Appendix_B_mgmt_plans_goals&targets.xlsx)</li>
<li>Focal species appendix C: Experts consulted - [Download PDF](downloads/focal_species_report/Appendices/Appendix_C_experts_consulted.pdf)</li>
<li>Focal species Appendix D: Summary of datasets - [Download XLSX](downloads/focal_species_report/Appendices/Appendix_D_focal_species_data.xlsx)</li>
</ul>

**NWB Datasets:**

<ul>
<li>Benchmark networks metadata - [Download PDF](downloads/BEACONs_metadata_shapefiles.pdf)</li>
<li>NWBLCC-level Shapefiles (e.g., ecoregions) - [Download ZIP](downloads/nwblcc_ecoregions.zip)</li>
<li>Hydrology Units HUC8 and FDA - [Download ZIP](downloads/nwblcc_fdahuc8.zip)</li>
</ul>

**NWB Biophysical Criteria Datasets (all ecoregions):**

<ul>
<li>Climate moisture index - [Download ZIP](downloads/nwb_datasets/cmi.zip)</li>
<li>Gross primary productivity - [Download ZIP](downloads/nwb_datasets/gpp.zip)</li>
<li>Lake edge density - [Download ZIP](downloads/nwb_datasets/led.zip)</li>
<li>North American Landcover 2010 - [Download ZIP](downloads/nwb_datasets/nalc.zip)</li>
</ul>

**NWB Climate Change Datasets (all ecoregions):**

<ul>
<li>Climatic velocity (forward and backward) - [Download ZIP](downloads/nwb_datasets/climatic_velocity.zip)</li>
<li>Climatic velocity PCAs (temperature and precipitation) - [Download ZIP](downloads/nwb_datasets/climatic_velocity_pca.zip)</li>
</ul>

**NWB Focal Species Datasets (all ecoregions):**

<ul>
<li>Caribou - [Download ZIP](downloads/nwb_datasets/caribou.zip)</li>
<li>Caribou ranges - [Download ZIP](downloads/nwb_datasets/caribou_ranges.zip)</li>
<li>Moose - [Download ZIP](downloads/nwb_datasets/moose.zip)</li>
<li>Dall / Thinhorn Sheep - [Download ZIP](downloads/nwb_datasets/sheep.zip)</li>
<li>Beaver - [Download ZIP](downloads/nwb_datasets/beaver.zip)</li>
<li>Chinook Salmon - [Download ZIP](downloads/nwb_datasets/chinook.zip)</li>
<li>Chum Salmon - [Download ZIP](downloads/nwb_datasets/chum.zip)</li>
<li>Broad Whitefish - [Download ZIP](downloads/nwb_datasets/whitefish.zip)</li>
<li>Waterfowl - [Download ZIP](downloads/nwb_datasets/waterfowl.zip)</li>
<li>Rusty Blackbird - [Download ZIP](downloads/nwb_datasets/blackbird.zip)</li>
<li>Old-Forest birds - [Download ZIP](downloads/nwb_datasets/forest_birds.zip)</li>
<li>Rusty Blackbird insitu refugia - [Download ZIP](downloads/nwb_datasets/blackbird_insitu_refugia.zip)</li>
<li>Old-Forest Birds insitu refugia - [Download ZIP](downloads/nwb_datasets/forest_birds_insitu_refugia.zip)</li>
</ul>

', file=fo)

for (eco in ecoregions) {
	cat("---\n\n### Ecoregion", eco, "\n\n", file=fo)
	cat('```{r echo = FALSE, results = "asis"}\n', file=fo)
	cat('y <- filter(x, Ecoregion=="',eco,'")\n', sep='', file=fo)
	cat('y <- select(y, -Ecoregion)\n', file=fo)
	cat('kable(y, align="lccc")\n', file=fo)
	cat('```\n\n', file=fo)

}

close(fo)
