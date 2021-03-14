library(tidyverse)
fitbit_sn = tibble(
  
    fitbit_id  = 1,
    fitbit_name="19780121_01087732005_flyinyou@gmail.com",
    fitbit_key = "22C5TY",
    fitbit_secret="23eddce810b992a9622a75893ccd6a0c"
)


saveRDS(fitbit_sn, "secret/sec.RDS")


