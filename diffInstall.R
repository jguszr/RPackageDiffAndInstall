##R Local Package Comparsion and instalation script.


baseFile <- "./toinstall_r.cvs"

to_be <- read.csv(file = baseFile,header = TRUE)

current <- as.data.frame(installed.packages()[,c(1,3:4)])

rownames(current) <- NULL

current <- current[is.na(current$Priority),1:2,drop=FALSE]

#Filtering 
to_be <- subset(to_be, !(to_be$Package %in% current$Package))

# the Actual installation process
lapply(to_be,install.packages)