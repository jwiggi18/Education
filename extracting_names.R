#extracting scientific names from wikipedia

library(rphylotastic)
#Alaska
#scrape names from wikipedia
names_Alaska <- url_get_scientific_names(URL = "https://en.wikipedia.org/wiki/List_of_Alaska_state_symbols")

print(names_Alaska)
#returns list()

#Check the scientific names
Alaska_resolved_otol <- taxa_resolve_names_with_otol(taxa = names_Alaska)

print(Alaska_resolved_otol)

Alaska_resolved_gnr <- taxa_resolve_names_with_gnr(taxa = names_Alaska)

print(Alaska_resolved_gnr)

#Arizona
#scrape names from wikipedia
names_Arizona <- url_get_scientific_names(URL = "https://en.wikipedia.org/wiki/List_of_Arizona_state_symbols")

print(names_Arizona)
#URL = "Hyla eximia"                  rphylotastic = "Hyla"
#      "Bassariscus astutus"                         "Bassariscus"
#      "Oncorhynchus gilae apache"                   "Oncorhynchus gilae"
#      "Crotalus willardi willardi"                  "Crotalus willardi"
       
#Check the scientific names
Arizona_resolved_otol <- taxa_resolve_names_with_otol(taxa = names_Arizona)

print(Arizona_resolved_otol)
#removed Harpagornis incendei (the cacuts wren) and kept Peoria and Maricopa (county in Arizona, also a genus of moth)

Arizona_resolved_gnr <- taxa_resolve_names_with_gnr(taxa = names_Arizona)

print(Arizona_resolved_gnr)
#scraped list = "Harpagornis incendei"           gnr = "Harpagornis"
#kept Peoria and Maricopa

#Arkansas
#scrape names from wikipedia
names_Arkansas <- url_get_scientific_names(URL = "https://en.wikipedia.org/wiki/List_of_Arkansas_state_symbols")

print(names_Arkansas)
#Populus = part of state motto
#Ouachita = state region

#Check the scientific names
Arkansas_resolved_otol <- taxa_resolve_names_with_otol(taxa = names_Arkansas)

print(Arkansas_resolved_otol)
#prints "Apis mellifera" Vitis aestivalis" "Pyrus malus" multiple times
#keeps Populus
#eliminates Ouachita

Arkansas_resolved_gnr <- taxa_resolve_names_with_gnr(taxa = names_Arkansas)

print(Arkansas_resolved_gnr)
#keeps Populus
#eliminates Ouachita
