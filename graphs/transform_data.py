import json
import sys
from os import path

rawdatafilename = sys.argv[1]
datafile = open(rawdatafilename, 'r')
datastring = datafile.read()
datafile.close()
data = json.loads(datastring)

ngrams = [x['ngram'] for x in data]
# print ngrams
timeseries = [x['timeseries'] for x in data]


splitfn = path.splitext(rawdatafilename)
datafilename = splitfn[0] + '.data'

gnu = open(splitfn[0] + '.gnuplot', 'w')
gnu.write(
	"""#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title "Query: {/Times-Italic \"%s\"}"
set output '%s'
set ylabel "Relative Frequency"
set size 0.85,0.85
set xtics ("1800" 0, "1850" 12.5, "1900" 25, "1950" 37.5, "2000" 50)
set xrange [25:50]
unset ytics
set pointsize 2
set key left top Left reverse samplen 1

set style line 1 lw 10 
set style line 2 lw 10 
set style line 3 lw 10 
set style line 4 lw 10 
set style line 5 lw 10 
set style line 6 lw 10 
set style line 7 lw 10 
set style line 8 lw 10 
set style line 9 lw 10 
set style line 10 lw 10 

plot \\
 '%s' using 1 every 4 w l ls 1 \\
  t '{/Times-Italic %s}', \\
 '%s' using 2 every 4 w l ls 2 \\
  t '{/Times-Italic %s}', \\
 '%s' using 3 every 4 w l ls 3 \\
  t '{/Times-Italic %s}', \\
 '%s' using 4 every 4 w l ls 4 \\
  t '{/Times-Italic %s}', \\
 '%s' using 5 every 4 w l ls 5 \\
  t '{/Times-Italic %s}', \\
 '%s' using 6 every 4 w l ls 6 \\
  t '{/Times-Italic %s}', \\
 '%s' using 7 every 4 w l ls 7 \\
  t '{/Times-Italic %s}', \\
 '%s' using 8 every 4 w l ls 8 \\
  t '{/Times-Italic %s}', \\
 '%s' using 9 every 4 w l ls 9 \\
  t '{/Times-Italic %s}', \\
 '%s' using 10 every 4 w l ls 10 \\
  t '{/Times-Italic %s}')
""" % (ngrams[0], splitfn[0] + '.eps', datafilename, ngrams[1], datafilename, ngrams[2], datafilename, ngrams[3], 
	datafilename, ngrams[4], datafilename, ngrams[5], datafilename, ngrams[6], datafilename, ngrams[7], datafilename, ngrams[8],
	datafilename, ngrams[9], datafilename, ngrams[10]))
gnu.close()

cleandatafile = open(datafilename, 'w')
for i in xrange(len(timeseries[0])):
	for j in xrange(len(timeseries)):
		cleandatafile.write("%.10g " % timeseries[j][i])
	cleandatafile.write("\n")