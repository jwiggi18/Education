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

View(taxa)

library(taxize)

# tried to filter taxa to only species names... many spcies names have a genus name as the second part of the binomen
# e.g. Schizocaena arthropoda so I get an error (More than one TSN found for taxon 'Arthropoda'!)

out <- list()
for(i in 1:length(taxa)){
    out[[i]] <- tax_name(taxa[i], get = "species")
}
out2 <- plyr::ldply(out, data.frame)
taxa[-which(is.na(out2$species))]

#Tried finding accepted names first then filtering
#find accepted names
#data_source_ids, 3 = ITIS, 12 = EOL
gnr_taxa <- gnr_resolve(names = taxa, data_source_ids = c(3,12), stripauthority = T) #stripauthority isn't removing author and year info
#View output
View(gnr_taxa)

nrow(gnr_taxa) #2131

#matched name produces duplicates but with year, subspecies(?), or a number in parentheses
gnr_taxa[!duplicated(gnr_taxa$matched_name),c("user_supplied_name", "matched_name")]

