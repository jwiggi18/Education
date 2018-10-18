#How to get phylotastic/datelife to call the correct phylogeny

library(rphylotastic)
library(datelife)
#to pull the scientifc names from the list of state symbols in my .txt file

WV_symbols <- file_get_scientific_names(file_name = "state_symbols/West_Virginia.txt")

WV_phy1 <- taxa_get_otol_tree(taxa = WV_symbols)

#WV_phy2 <- taxa_get_phylomatic_tree(taxa = WV_symbols)

source_tree <- c("Open Tree of Life")

library(ape)
#par = set or query graphical parameters
#xpd = plotting parameter
par(xpd = FALSE, mfrow = c(1,1), mai = c(0.1, 0.1, 0.5, 0.1), oma = c(0, 1, 2, 1))
plot(ladderize(WV_phy1))
mtext(paste("from", source_tree[i]), cex = 1, side = 3, line = 1)
mtext("West Virginia State Symbols", outer = T, side = 3, cex = 1.5, line = 0)


