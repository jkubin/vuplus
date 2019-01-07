# Vu+ scripts to edit bouquets
If you want to edit bouquets, you have the following choices:
- remote control (slow, boring, ugly)
- OpenWebif interface (mouse hell)
- external GUI programs (dreamboxEDIT for example)
- ***vuplus scripts***
  - ***for power CLI users***

## The main idea of vuplus scripts
> raw userbouquet files contains the following cryptic lines:
```
...
#SERVICE 1:0:19:3396:C89:3:EB0000:0:0:0:
#SERVICE 1:0:19:3392:C89:3:EB0000:0:0:0:
#SERVICE 1:0:16:339C:C89:3:EB0000:0:0:0:
...
```
> ***radio.txt*** and ***tv.txt*** contains all available pairs service-name from ***YOUR*** Vu+  
> the script `vuplus_userbouquets_editable` converts raw userbouquet-s to pairs service-name:
```
...
1:0:19:3396:C89:3:EB0000:0:0:0:	Prima COOL HD
1:0:19:3392:C89:3:EB0000:0:0:0:	Prima HD
1:0:16:339C:C89:3:EB0000:0:0:0:	Prima KRIMI
...
```
> ***now you can easily***  
> copy desired lines from {radio,tv}.txt to your userbouquet files  
> add/reorder/delete existing lines  
> add/reorder/delete lines in bouquets.{radio,tv}  
> run `vuplus_userbouquets_restore` to change userbouquet files to previous raw format
## My Vu+ box
```
Brand & Model:	Vu+ Uno4K
Version:        OpenWebif 1.2.6
https://github.com/E2OpenPlugins/e2openplugin-OpenWebif
```
## Steps to use vuplus scripts
1. copy all bouquets to working location
```
$ scp root@ip_address_or_hostname:/etc/enigma2/*.{radio,tv} .
```
   or
```
root@uno4k:~# cp /etc/enigma2/*.{radio,tv} .
```

2. download JSON data from Vu+ to create {radio,tv}.txt (all available services from `/etc/enigma2/lamedb`)
- refresh the `lamedb` file (Main Menu ---> Setup ---> Service Searching ---> Automatic Scan)
```
$ vuplus_download_all_services ip_address_or_hostname
```
   or
```
root@uno4k:~# vuplus_download_all_services localhost
```

3. convert userbouquet-s to pairs service-name
```
$ vuplus_userbouquets_editable
```

4. modify userbouquet-s by your needs (use Vim shortcuts: `dd` `p`)
```
$ vim -p tv.txt *.tv
$ vim -p radio.txt *.radio
```
Vim commmand to sort services alphabetically (the `^I` is Ctrl-v + tab):
```
:1,$! sort -t'^I' -k 2
```

- (optionaly) purge unused services
```
$ vuplus_userbouquets_purge
```

5. restore the userbouquet files to the original format for uploading back into Vu+
```
$ vuplus_userbouquets_restore
```

6. upload them back
```
$ scp *.{radio,tv} root@ip_address_or_hostname:/etc/enigma2/
```

7. restart enigma to reload new bouquets
```
root@uno4k:~# killall -9 enigma2
```
8. enjoy your bouquets (and give me some stars ;-)

### Contact (Base64): bTR1bml4QGdtYWlsLmNvbQ
