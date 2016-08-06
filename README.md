# Fuck capstone CS_ERR_VERSION

`CS_ERR_VERSION` is a type of error thrown by [capstone](https://github.com/aquynh/capstone) when it found that there exist a different API version between the core and binding.  
```
capstone.CsError: Different API version between core & binding (CS_ERR_VERSION)
```  

It happens a lot when I use tools like ROPGadget, pwntools, pwndbg...etc, and it really fucking pissed me off.  
After googling the solution for 5 hours, I found that the only way to end this pain is to re-install capstone, so here's a script that will do all the work:  
* It will download the latest capstone source code from github  
* Uninstall & re-install capstone 
* Install python binding (both python2 & python3)  
* Check the core & binding version  

Usage: `sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/bruce30262/fuck_capstone_CS_ERR_VERSION/master/fuck_capstone_cserror.sh)"`  

Dedicate to all pals who also suffered from this error.  
  
  
BTW don't get me wrong, capstone is a great project, it's just that this error happens so many times and it's so annoying that I decide to write a script to get rid of it once and for all (=_=)凸

