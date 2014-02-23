#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {/Times-Italic "oracle (All)"}'
set output 'oracle.eps'
set ylabel "Relative Frequency"
set size 1,1
set xtics ("1800" 0, "1850" 12.5, "1900" 25, "1950" 37.5, "2000" 50)
set xrange [0:50]
unset ytics
set pointsize 2
set key right top Left reverse samplen 1

set style line 1 lw 10
set style line 2 lw 10
set style line 3 lw 10


plot \
'oracle.data' using 1 every 4 w l ls 1 \
t '{/Times-Italic "oracle"}', \
'oracle.data' using 2 every 4 w l ls 2 \
t '{/Times-Italic "Oracle"}', \
'oracle.data' using 3 every 4 w l ls 3 \
t '{/Times-Italic "ORACLE"}', \
