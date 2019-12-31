## Transcriptome co-expression network
These scripts are the precursor to creating a gene co-expression network in cytoscape using timeseries transcriptomic data, 
originally from Xerophyta schlechteri (FKA Xerophyta viscosa - network_data_eg.txt). 

Script 1 (pearson_timeseries_1_with_astrids_notes.R) creates a pearson correlation matrix for the timecourse data 
(uses FPKM/TPM of all biological replicates in the correlation) and allows you to determine a cutoff value (pearson 
correlation coefficient or R value) for the number of nodes and edges that would appear in the network.

Script 2 (pearson_timeseries_2_with_astrids_notes.R) creates a list (Edge_List.csv) of nodes (transcript1) and their correlation 
coefficients (score) with other nodes (transcript2). These scores will be plotted in cytoscape as the edge length, or distance 
between nodes, so as to determine their clustering. 

This Edge_list.csv file can now be imported into cytoscape for visualisation. 

