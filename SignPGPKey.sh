#!/bin/bash
#####
# This script signs and exports another key
# in an idiot-proof way (I tried it!)
# Currrent setting: The key imported is
# signed using 0x50175350 and then exported
# to the SKS-keyserver pgpkeys.eu
#
# (c) Philipp Bielefeldt, 2014
# GPL v3.0 or any later version as you like.
####

read -p "please give a key " SIGNED_KEY	                                        # the key you want to sign
export SIGNING_KEY=50175350	                                                # the key used to sign
gpg --keyserver pgpkeys.eu --recv-key $SIGNED_KEY

gpg --default-key $SIGNING_KEY --sign-key $SIGNED_KEY

gpg --update-trustdb # Changes the (local) trust
gpg --keyserver pgpkeys.eu --send-key $SIGNED_KEY
 
gpg --refresh-keys 	                                                        # updates the keyring
gpg --update-trustdb 	                                                        # renews the trust db
echo "done"

