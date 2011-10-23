
if (VERBOSE)
{
	print("Extracting text from tweets & calculating sentiment scores")
	flush.console()
}

# obviously, this is not an elegant way to repeat an operation, but
# we do end up with lots of objects in memory to play with (it _is_
# a tutorial, after all :)

davis.text = laply(davis.tweets, function(t) t$getText() )
gallagher.text = laply(gallagher.tweets, function(t) t$getText() )
higgins.text = laply(higgins.tweets, function(t) t$getText() )
mcguinness.text = laply(mcguinness.tweets, function(t) t$getText() )
mitchell.text = laply(mitchell.tweets, function(t) t$getText() )
norris.text = laply(norris.tweets, function(t) t$getText() )
scallon.text = laply(scallon.tweets, function(t) t$getText() )

davis.scores = score.sentiment(davis.text, pos.words, neg.words, .progress='text')
gallagher.scores = score.sentiment(gallagher.text, pos.words, neg.words, .progress='text')
higgins.scores = score.sentiment(higgins.text, pos.words, neg.words, .progress='text')
mcguinness.scores = score.sentiment(mcguinness.text, pos.words, neg.words, .progress='text')
mitchell.scores = score.sentiment(mitchell.text, pos.words, neg.words, .progress='text')
norris.scores = score.sentiment(norris.text, pos.words, neg.words, .progress='text')
scallon.scores = score.sentiment(scallon.text, pos.words, neg.words, .progress='text')

davis.scores$candidate = 'MaryDavis'
davis.scores$code = 'MD'
gallagher.scores$candidate = 'SeanGallagher'
gallagher.scores$code = 'SG'
higgins.scores$candidate = 'MichaelHiggins'
higgins.scores$code = 'MH'
mcguinness.scores$candidate = 'MartinMcGuinness'
mcguinness.scores$code = 'MM'
mitchell.scores$candidate = 'GayMitchell'
mitchell.scores$code = 'GM'
norris.scores$candidate = 'DavidNorris'
norris.scores$code = 'DN'
scallon.scores$candidate = 'DanaScallon'
scallon.scores$code = 'DS'

all.scores = rbind( davis.scores, gallagher.scores, higgins.scores, 
					mcguinness.scores, mitchell.scores, norris.scores, scallon.scores )

if (VERBOSE)
	print("Plotting score distributions")

# ggplot works on data.frames, always
g.hist = ggplot(data=all.scores, mapping=aes(x=score, fill=candidate) )

# add a bar graph layer. Let it bin the data and compute frequencies
# (set binwidth=1 since scores are integers)
g.hist = g.hist + geom_bar( binwidth=1 )

# make a separate plot for each candidate
g.hist = g.hist + facet_grid(candidate~.)

# plain display, nice colors
g.hist = g.hist + theme_bw() + scale_fill_brewer() 

print(g.hist)
ggsave(file.path(outputDir, 'twitter_score_histograms.pdf'), g.hist, width=6, height=5.5)

