terraform { 
  cloud { 
    
    organization = "hc-cnfp2" 

    workspaces { 
      name = "reviews"
      project = "bookinfo"
    } 
  } 
}