#!/usr/bin/env fish

# sort ban list
cat block_domain_list.txt | sort -s | uniq > temp
mv temp block_domain_list.txt

# generate ublacklist
cat uBlacklist_match_patterns.txt | sort -s | uniq >> temp
cp temp uBlacklist_match_patterns.txt
awk '{printf "*://%s/*\n",$0}' block_domain_list.txt Blocklist/lunzi Blocklist/BLOCKLIST >> temp
mv temp uBlacklist_subscription.txt
