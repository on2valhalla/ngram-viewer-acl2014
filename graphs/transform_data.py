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
gnu.write(u"""#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {{/Times-Italic \"{0}\"}}'
set output '{1}'
set ylabel "Relative Frequency"
set size 1,1
set xtics ("1800" 0, "1850" 12.5, "1900" 25, "1950" 37.5, "2000" 50)
set xrange [0:50]
unset ytics
set pointsize 2
set key left top Left reverse samplen 1

""".format(unicode(ngrams[0]), splitfn[0] + '.eps').encode('utf8'))

for i in xrange(len(data) - 1):
	gnu.write(u"set style line %i lw 10\n" % (i+1))

gnu.write("\n\nplot \\\n")

for i in xrange(len(data) - 1):
	gnu.write(u"""'{0}' using {1} every 4 w l ls {1} \\
t '{{/Times-Italic "{2}"}}', \\
""".format(datafilename, i+1, unicode(ngrams[i+1])).encode('utf8'))

gnu.close()

cleandatafile = open(datafilename, 'w')
for i in xrange(len(timeseries[0])):
	for j in xrange(1, len(timeseries)):
		cleandatafile.write("%.10g " % timeseries[j][i])
	cleandatafile.write("\n")

cleandatafile.close()