## R compare and Install packages script

### Summary

  This tiny script comes in hand when you need to re-install a lost R user library, or even if you have a enviroment that you want to replicate towards a team. Of course there are far more *professional* approaches to it, but in my case, I just need to set my both systems with the same packages. 

### Usage 

  The Idea is to genarete a CSV file containing all the packages that you need to install in your new system. to do so, the following code snippet will do it :
  
```r
    toSave <- as.data.frame(installed.packages()[,c(1,3:4)])
    rownames(toSave) <- NULL
    toSave <- toSave[is.na(toSave$Priority),1:2,drop=FALSE]
    write.csv(toSave,file =  "./your/path/toinstall_r.cvs")
```

  Bring the generated file **toinstall_r.cvs** to your new system, change the variable *baseFile* to whatever *valid* file name and path you have and let it run !
  
### Warnings

- It might take a while to run ! You know, network speed, your system speed and so on.
- Some packages might fail, due R dependencies, OS dependencies, libc stuff, java stuff and etc, you will need to take care of it.
- Run at your own risk.

### Further implementations

- [ ] Improuve the paramenters on the *install.packages* command
- [ ] Check for version updates
- [ ] Log installation to a file