# MSAtools.R
#
# Purpose:  Tools to analyze multiple sequence alignments (MSA).
#
# V 0.1
#
# Date:     April 2016
# Author:   Boris Steipe (boris.steipe@utoronto.ca)
#
# V 0.1     First code
#
# ==============================================================================


# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


# ==== FUNCTION ================================================================

# Sample function
set2ali <- function(inSet) {
    if(length(grep("StringSet", class(inSet))) == 0){
        stop(sprintf("%s%s%s%s",
                     "Function needs input of class <DNA|RNA|AA>StringSet.\n",
                     "This object has class \"",
                     class(inSet),
                     "\" instead.\n"))
    }

    ali <- switch(
        # convert <DNA|RNA|AA>StringSet to <DNA|RNA|AA>MultipleAlignment
        class(inSet),
        AAStringSet = AAMultipleAlignment(inSet),
        DNAStringSet = DNAMultipleAlignment(inSet),
        RNAStringSet = RNAMultipleAlignment(inSet)
    )

    return(ali)

}

# [END]
