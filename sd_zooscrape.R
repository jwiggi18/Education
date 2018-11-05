#learning to scrape a zoo website

library(rvest)
library(rphylotastic)

get_san_diego_zoo_animals <- function() {
    animals <- read_html("https://animals.sandiegozoo.org/animals")
    links  <- animals %>% 
        html_nodes("a") %>% html_attr("href") # use rvest to get all the a href elements
    links <- links[grepl("/animals/", links)] # grepl to only get the links to the relevant pages. This is the sort of manual processing that is annoying but often necessary.
    
    links <- unique(links) # get rid of duplicates (b/c looking at the links, sometimes had the same link
    
    all.taxa <- c() # a vector to store the names
    
    for (i in seq_along(links)) { # now loop over the links
        print(paste("doing link", i, "of", length(links), links[i]))
        taxa <- NULL # store NULL first, so we can detect failure
        try(taxa <- rphylotastic::url_get_scientific_names(paste0("https://animals.sandiegozoo.org", links[i]))) # any time one plays on the web, things can fail. The function can return an error, so putting in a try lets the overall function run
        if(!is.null(taxa)) { # if it failed, just skip to next. Otherwise, incorporate the taxa
            all.taxa <-c(all.taxa, taxa)
        }
    }
    return(unique(all.taxa))
}

taxa <- get_san_diego_zoo_animals()
#filter by those entries that contain a space to retrieve binomial names (species names)
taxa <- taxa[grepl(" ", taxa)]
View(taxa)

library(taxize)

#find accepted names
#data_source_ids, 179 = Open Tree of Life reference taxonomy
gnr_taxa <- taxize::gnr_resolve(names = taxa, data_source_ids = 179, best_match_only = TRUE, canonical = TRUE) 
#View output
View(gnr_taxa)

gnr_vector <- gnr_taxa$matched_name2

sd_phy <- taxa_get_otol_tree(taxa = gnr_vector) #returns error

source_tree <- c("Open Tree of Life")

library(ape)
#par = set or query graphical parameters
#xpd = plotting parameter
par(xpd = FALSE, mfrow = c(1,1), mai = c(0.1, 0.1, 0.5, 0.1), oma = c(0, 1, 2, 1))
plot(ladderize(sd_phy))
mtext(paste("from", source_tree[i]), cex = 1, side = 3, line = 1)
mtext("San Diego Zoo Animals", outer = T, side = 3, cex = 1.5, line = 0)
