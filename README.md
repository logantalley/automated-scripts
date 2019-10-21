# Automated Scripts
This git repo will house all of my automation scripts

#merge-script
This script allows you to merge all sorts of files
## Usage: merge-script [-d arg] [-e arg] [-f arg] [-t arg]
### [-d] directory
### [-e] file extension to search
### [-f] file name for combined text file
### [-t] type of merging to perform **REQUIRED**
* 'ho' only preserve one header (if headers exist, otherwise use 'n')
* 'hf' preserve one header and one footer
* 'e' remove headers and footers entirely
* 'n' no headers or footers exist
