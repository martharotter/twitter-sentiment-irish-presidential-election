#
# 1_load.R - loads Twitter data, Hu & Liu's opinion lexicon
#
# scrape.R should be run once to collect and cache tweets before running this script.
#

if (!file.exists(file.path(dataDir, 'davis.tweets.RData' )) )
{
	stop("Tweets not found on disk -- source('R/scrapeAras.R') to scrape Twitter first")

} else {

	if (VERBOSE)
		print("Loading tweets from disk:")
	
	print( load( file.path(dataDir, 'davis.tweets.RData' ) ) )
	print( load( file.path(dataDir, 'gallagher.tweets.RData' ) ) )
	print( load( file.path(dataDir, 'higgins.tweets.RData' ) ) )
	print( load( file.path(dataDir, 'mcguinness.tweets.RData' ) ) )
	print( load( file.path(dataDir, 'mitchell.tweets.RData' ) ) )
	print( load( file.path(dataDir, 'norris.tweets.RData' ) ) )
	print( load( file.path(dataDir, 'scallon.tweets.RData' ) ) )
}


if (VERBOSE)
	print("Loading Hu & Liu opinion lexicon")

hu.liu.pos = scan(file.path(dataDir, 'opinion-lexicon-English', 'positive-words.txt'), what='character', comment.char=';')
hu.liu.neg = scan(file.path(dataDir, 'opinion-lexicon-English', 'negative-words.txt'), what='character', comment.char=';')

# add a few twitter and industry favorites
pos.words = c(hu.liu.pos, 'upgrade')
neg.words = c(hu.liu.neg, 'wtf', 'wait', 'waiting', 'epicfail', 'mechanical', 'refusing')

