#Jack Greff
#Lab 1

#COMMENTED NON-IMPORTANT LINES OUT
#mkdir Lab1 <- not sure if needed
#cd Lab1
#ls
curl -s  pg26.txt https://www.gutenberg.org/cache/epub/26/pg26.txt > pg26.txt
#more pg26.txt
wc -l pg26.txt
#sort < pg26.txt
#tr -s ' ' '\n'
tr -s ' ' '\n' < pg26.txt  > each_word.txt 
#tr -cd '[:alnum:]' < pg26.txt 
#tr -cd '[:alnum:][:space:]' < pg26.txt
#tr -cd '[:alnum:][:space:]' < pg26.txt | tr -s ' ' '\n'
#cat pg26.txt | tr -cd '[:alnum:][:space:]' | tr -s ' ' '\n'
#cat pg26.txt | tr -cd '[:alnum:][:space:]' | tr -s '[:space:]' '\n'
#cat pg26.txt | tr -cd '[:alnum:][:space:]' | tr -s '[:space:]' '\n' | sort -f
cat pg26.txt | tr -cd '[:alnum:][:space:]' | tr -s ' ' '\n' | sort -f | wc -l > total_words.txt
cat pg26.txt | tr -cd '[:alnum:][:space:]' | tr -s ' ' '\n' | sort -f | uniq -c > word_counts.txt
cat pg26.txt | tr -cd '[:alnum:][:space:]' | tr -s ' ' '\n' | sort -f | uniq -c | sort -nr | head  -20 > most_common.txt
cat pg26.txt | tr -cd '[:alnum:][:space:]' | tr -s ' ' '\n' | sort -f | uniq -c | sort -nr | head  -20
