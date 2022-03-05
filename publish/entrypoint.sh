#!/bin/sh

set -e

echo
echo "🟢 START LOCAL REGISTRY"
tmp_registry_log=`mktemp`
sh -c "mkdir -p $HOME/.config/verdaccio"
sh -c "cp --verbose /config.yaml $HOME/.config/verdaccio/config.yaml"
sh -c "nohup verdaccio --config $HOME/.config/verdaccio/config.yaml &>$tmp_registry_log &"

#echo
#echo "💤 WAIT FOR VERDACCIO TO BOOT"
## FIXME: this throws a syntax error, but would be great to make it run
#grep -q 'http address' <(tail -f $tmp_registry_log)

echo
echo "🔑 LOGIN TO REMOTE REGISTRY"
sh -c "npm-auth-to-token -u $INPUT_USERNAME -p $INPUT_PASSWORD -e $INPUT_EMAIL -r $INPUT_REGISTRY"

echo
echo "📡 PUBLISH PACKAGE TO REMOTE REGISTRY"
sh -c "npm publish --registry $INPUT_REGISTRY $1"

echo
echo "🏁 DONE"
