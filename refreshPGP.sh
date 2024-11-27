#!/bin/bash
#####
# This script simply searches for the
# latest versions of the public keys
# in your keyring and maintains the
# PGP trust database.
#
# (c) Philipp Bielefeldt, 2014
# GPL v3.0 or any later version as you like.
####

# all keys are listed here (omit the "0x")
declare -a keylist=("50175350" "3BED6553" "696057AB" "72BCBBF5")

# path to store to
declare CERTPATH=~/Sammlung/PGPKeys

# Keyserver to use
export KEYSERV="pgp.surfnet.nl"
#export KEYSERV="hkp://hkps.pool.sks-keyservers.net"

for KEY in "${keylist[@]}"
do
	gpg --default-key $KEY --refresh-keys 					# updates the keyring
	gpg --default-key $KEY --update-trustdb					# renews the trust db
	gpg --armor --export $KEY > ${CERTPATH}/0x${KEY}_pub.asc 		# exports the latest public key
	gpg --armor --export-secret-keys $KEY > ${CERTPATH}/0x${KEY}_prv.asc	# exports the latest public key
	gpg --keyserver $KEYSERV --send-keys $KEY 				# syncs with the public servers
	echo "done for key "$KEY
done

gpg --export-ownertrust > ${CERTPATH}/ownertrust.txt

echo "bye."
exit
