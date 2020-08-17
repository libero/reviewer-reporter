#!/bin/sh
set -euo pipefail

# Generate a temporary file and populate with header
mailfile=$(mktemp /tmp/mailfile.XXXXXX)
cp /mail-config/mailheader ${mailfile}

# Generate the report as the body of the file (also take any errors)
/scripts/html-status.sh 2>>${mailfile} >> ${mailfile} || true

# Mail the file
ssmtp xpub-tech-alerts@elifesciences.org < ${mailfile}

# Tidy up
rm ${mailfile}
