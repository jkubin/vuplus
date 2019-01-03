# Vu+ scripts to edit bouquets
If you want to edit bouquets, you have the following choices:
- remote control (slow, boring, ugly)
- OpenWebif interface
- external GUI programs (dreamboxEDIT for example)
- ***vuplus scripts***
  - ***for power users***

## why to use vuplus scripts
raw userbouquet files contains cryptic lines
```
...
#SERVICE 1:0:19:3396:C89:3:EB0000:0:0:0:
#SERVICE 1:0:19:3392:C89:3:EB0000:0:0:0:
#SERVICE 1:0:16:339C:C89:3:EB0000:0:0:0:
```

***vuplus_userbouquets_editable*** makes them Vim editable
```
...
1:0:19:3396:C89:3:EB0000:0:0:0:	Prima COOL HD
1:0:19:3392:C89:3:EB0000:0:0:0:	Prima HD
1:0:16:339C:C89:3:EB0000:0:0:0:	Prima KRIMI
...
```
edit what you want and finaly change them with ***vuplus_userbouquets_restore*** to cryptic format

## steps to use vuplus scripts
1. copy bouquets to working location
```
$ scp root@ip_address_or_name_of_your_vuplus:/etc/enigma2/*.{radio,tv} .
```
   or
```
root@uno4k:~# cp /etc/enigma2/*.{radio,tv} .
```

2. download JSON data to tv.txt and radio.txt (all available services)
```
$ vuplus_download_all_services ip_address_or_name_of_your_vuplus
```
   or
```
root@uno4k:~# vuplus_download_all_services localhost
```

3. convert them to human editable format
```
$ vuplus_userbouquets_editable
```

4. modify them by your needs (vim shortcuts: dd p)
```
$ vim -p tv.txt *.tv
$ vim -p radio.txt *.radio
```

- purge unused services (optionaly)
```
$ vuplus_userbouquets_purge
```

5. restore the userbouquet files to the original format for uploading back into vuplus
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

### Contact (Base64): bTR1bml4QGdtYWlsLmNvbQ
