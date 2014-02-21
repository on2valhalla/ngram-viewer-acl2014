import json
import sys
from os import path

rawdatafilename = sys.argv[1]
datafile = open(rawdatafilename, 'r')
datastring = datafile.read()
datafile.close()
data = json.loads(datastring)

ngrams = [x['ngram'].replace("_","\\_").replace("=&gt;","=>") for x in data]
# print ngrams
timeseries = [x['timeseries'] for x in data]


splitfn = path.splitext(rawdatafilename)
datafilename = splitfn[0] + '.data'

gnu = open(splitfn[0] + '.gnuplot', 'w')
gnu.write(
	"""#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {/Times-Italic \"%s\"}'
set output '%s'
set ylabel "Relative Frequency"
set size 1,1
set xtics ("1800" 0, "1850" 12.5, "1900" 25, "1950" 37.5, "2000" 50)
set xrange [0:50]
unset ytics
set pointsize 2
set key left top Left reverse samplen 1

""" % (ngrams[0], splitfn[0] + '.eps'))

for i in xrange(len(data) - 1):
	gnu.write("set style line %i lw %i\n" % (i+1, len(data) - 1 ))

gnu.write("\n\nplot \\\n")

for i in xrange(len(data) - 1):
	gnu.write("""'%s' using %i every 4 w l ls %i \\
t '{/Times-Italic "%s"}', \\
""" % (datafilename, i+1, i+1, ngrams[i+1]))

gnu.close()

cleandatafile = open(datafilename, 'w')
for i in xrange(len(timeseries[0])):
	for j in xrange(1, len(timeseries)):
		cleandatafile.write("%.10g " % timeseries[j][i])
	cleandatafile.write("\n")

cleandatafile.close()