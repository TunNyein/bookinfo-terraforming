terraform { 
  cloud { 
    
    organization = "hc-cnfp2" 

    workspaces { 
      name = "ratings" 
    } 
  } 
}