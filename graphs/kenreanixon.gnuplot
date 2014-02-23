#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 32
set title 'Query: {/Times-Italic "President Kennedy, President Reagan, President Nixon"}'
set output 'kenreanixon.eps'
set ylabel "Relative Frequency"
set size 1.2,1
set xtics ("1930" 0, "1965" 35, "2000" 70)
set xrange [0:70]
unset ytics
set pointsize 1
set key left top Left reverse samplen 1

set style line 1 lw 10
set style line 2 lw 10
set style line 3 lw 10


plot \
'kenreanixon.data' using 1 every 1 w l ls 1 \
t '{/Times-Italic "President Kennedy"}', \
'kenreanixon.data' using 2 every 1 w l ls 2 \
t '{/Times-Italic "President Reagan"}', \
'kenreanixon.data' using 3 every 1 w l ls 3 \
t '{/Times-Italic "President Nixon"}', \
