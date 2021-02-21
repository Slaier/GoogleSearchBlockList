#!/usr/bin/env fish

function sort_list
    set temp_file (mktemp)
    echo 'sort '$argv' ...'
    cat $argv | sort -s | uniq > $temp_file
    mv $temp_file $argv
    echo 'sort '$argv' done'
end

# generate ublacklist
cat match_patterns.txt Google-Chinese-Results-Blocklist/uBlacklist_match_patterns.txt > uBlacklist_match_patterns.txt

awk '{printf "*://%s/*\n",$0}' perma_ban_list.txt block_list.txt Blocklist/lunzi Blocklist/BLOCKLIST > uBlacklist_subscription.txt
cat Google-Chinese-Results-Blocklist/uBlacklist_subscription.txt >> uBlacklist_subscription.txt

# generate GHHbD
cat perma_ban_list.txt Google-Chinese-Results-Blocklist/GHHbD_perma_ban_list.txt Blocklist/lunzi Blocklist/BLOCKLIST > GHHbD_perma_ban_list.txt
cat block_list.txt > GHHbD_block_list.txt

# sort list
sort_list uBlacklist_match_patterns.txt
sort_list uBlacklist_subscription.txt
sort_list GHHbD_perma_ban_list.txt
sort_list GHHbD_block_list.txt
sort_list block_list.txt
sort_list perma_ban_list.txt
sort_list match_patterns.txt
