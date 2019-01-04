# Vu+ scripts to edit bouquets
If you want to edit bouquets, you have the following choices:
- remote control (slow, boring, ugly)
- OpenWebif interface (mouse hell)
- external GUI programs (dreamboxEDIT for example)
- ***vuplus scripts***
  - ***for power CLI users***

## The main idea of vuplus scripts
Raw userbouquet files contains the following cryptic lines:
```
...
#SERVICE 1:0:19:3396:C89:3:EB0000:0:0:0:
#SERVICE 1:0:19:3392:C89:3:EB0000:0:0:0:
#SERVICE 1:0:16:339C:C89:3:EB0000:0:0:0:
...
```
> tv.txt and radio.txt contains all available pairs service-name from ***YOUR*** Vu+
The script `vuplus_userbouquets_editable` converts userbouquet-s to pairs service-name:
```
...
1:0:19:3396:C89:3:EB0000:0:0:0:	Prima COOL HD
1:0:19:3392:C89:3:EB0000:0:0:0:	Prima HD
1:0:16:339C:C89:3:EB0000:0:0:0:	Prima KRIMI
...
```
... copy or reorder lines and finally run `vuplus_userbouquets_restore` understandable for your Vu+ ...
## Steps to use vuplus scripts
1. copy all bouquets to working location
```
$ scp root@ip_address_or_name_of_your_vuplus:/etc/enigma2/*.{radio,tv} .
```
   or
```
root@uno4k:~# cp /etc/enigma2/*.{radio,tv} .
```

2. download JSON data from Vu+ and create tv.txt and radio.txt (all available services from `/etc/enigma2/lamedb`)
```
$ vuplus_download_all_services ip_address_or_name_of_your_vuplus
```
   or
```
root@uno4k:~# vuplus_download_all_services localhost
```

3. convert them to pairs service-name
```
$ vuplus_userbouquets_editable
```

4. modify them by your needs (use Vim shortcuts: dd p)
```
$ vim -p tv.txt *.tv
$ vim -p radio.txt *.radio
```
Vim commmand to sort services alphabetically (the `^I` is Ctrl-v + tab):
```
:1,$! sort -t'^I' -k 2
```

- purge unused services (optionaly)
```
$ vuplus_userbouquets_purge
```

5. restore the userbouquet files to the original format for uploading back into Vu+
```
$ vuplus_userbouquets_restore
```

6. upload them back
```
$ scp *.{radio,tv} root@ip_address_or_name_of_your_vuplus:/etc/enigma2/
```

7. restart enigma
```
root@uno4k:~# killall -9 enigma2
```
8. enjoy reordered services

### Contact (Base64): bTR1bml4QGdtYWlsLmNvbQ
