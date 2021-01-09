

#input and rename 
iesheet<-read.csv('/Users/sagarchaudhary/Downloads/AusDams/data/input_df.csv')
iesheet <- rename(iesheet,c('INCLUSION_EXCLUSION_CRITERION_SH'='ietested'))

#new ds, subsetting and sorting
ads1<-ads1[c(ads1$RANDFL=='Y'),]
ads1[order(ads1$usujid, na.last=TRUE) , ]


#reading and sorting
adie<-read.csv('/Users/sagarchaudhary/Downloads/AusDams/data/input_df.csv')
adie[order(adie$usujid, na.last=TRUE) , ]


# inner joining 
anaie<-merge(x = adie, y = ads1, by = "usujid")
anaie<-anaie[order(anaie$ietestcd, na.last=TRUE) , ]

#left joining 
anaie1<-merge(x = anaie, y = iesheet, by = "ietestcd",all.x = TRUE)

df %>%
  mutate(col0 = str_trim(trt01p, side = c("both")),
         col1 = str_trim(subjid, side = c("both")),
         col2 = if_else(trt01p == "Dummy A", NA, if_else(is.null(trtstd), "No", "Yes")),
         col3 = if_else("IN" %in% IETESTCD, substr(IETESTCD, 3, 6), NA),
         inc = if_else("IN" %in% IETESTCD, paste0(substr(IETESTCD, 1, 1), col3), NA),
         col4 = if_else("EX" %in% IETESTCD, substr(IETESTCD, 3, 6), NA),
         inc = if_else("EX" %in% IETESTCD, paste0(substr(IETESTCD, 1, 1), col4), NA)
  )