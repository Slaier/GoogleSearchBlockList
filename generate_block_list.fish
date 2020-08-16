#!/usr/bin/env fish

# sort ban list
cat block_domain_list.txt | sort | uniq > temp
mv temp block_domain_list.txt

# generate ublacklist
cat uBlacklist_match_patterns.txt | sort | uniq >> temp
cp temp uBlacklist_match_patterns.txt
cat block_domain_list.txt | parallel -k echo  '\*://'{}'/\*' >> temp
mv temp uBlacklist_subscription.txt
