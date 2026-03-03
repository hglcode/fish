function dl
    aria2c -c -V -k1M -s$lnp -x16 -j$wnp --max-tries=3 --retry-wait=5 $argv
end
