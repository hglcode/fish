function dl
    set -l np (nproc)
    set -l lnp (math "np * 2")
    set -l wnp (math "np * 3")
    aria2c -c -V -k1M -s$lnp -x16 -j$wnp --max-tries=3 --retry-wait=5 $argv
end
