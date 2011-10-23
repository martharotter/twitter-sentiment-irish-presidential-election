#
# scrapeAras.R - scrape web data and cache to the data/ directory:
#
#			 * aras11-related tweets via twitteR's searchTwitter()
# 			 * Election candidates for 2011 are Mary Davis, 
#			 * Sean Gallagher, Michael Higgins, Martin McGuinness, 
#			 * Gay Mitchell, David Norris & Dana Scallon
#

if (VERBOSE)
	print("Searching Twitter for Aras tweets and saving to disk")

require(twitteR)

davis.tweets = searchTwitter('aras11 AND marydavisire OR davis', n=1500)
save(davis.tweets, file=file.path(dataDir, 'davis.tweets.RData' ), ascii=T)

gallagher.tweets = searchTwitter('aras11 AND gallagher OR seangallagher1', n=1500)
save(gallagher.tweets, file=file.path(dataDir, 'gallagher.tweets.RData' ), ascii=T)

higgins.tweets = searchTwitter('aras11 AND md_higgins OR higgins OR michael', n=1500)
save(higgins.tweets, file=file.path(dataDir, 'higgins.tweets.RData' ), ascii=T)

mcguinness.tweets = searchTwitter('aras11 AND martin OR mcguinness OR Martin4Prez2011', n=1500)
save(mcguinness.tweets, file=file.path(dataDir, 'mcguinness.tweets.RData' ), ascii=T)

mitchell.tweets = searchTwitter('aras11 AND mitchell OR gay OR GayMitchell2011', n=1500)
save(mitchell.tweets, file=file.path(dataDir, 'mitchell.tweets.RData' ), ascii=T)

norris.tweets = searchTwitter('aras11 AND norris OR david OR SenDavidNorris', n=1500)
save(norris.tweets, file=file.path(dataDir, 'norris.tweets.RData' ), ascii=T)

scallon.tweets = searchTwitter('aras11 AND scallon OR dana OR VoteDana', n=1500)
save(scallon.tweets, file=file.path(dataDir, 'scallon.tweets.RData' ), ascii=T)

