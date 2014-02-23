#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {/Times-Italic "President Kennedy, President Reagan, President Nixon, "}'
set output 'kenreanixon.eps'
set ylabel "Relative Frequency"
set size 1,1
set xtics ("1950" 0, "1975" 25, "2000" 50)
set xrange [0:50]
unset ytics
set pointsize 1
set key left top Left reverse samplen 1

set style line 1 lw 2
set style line 2 lw 2
set style line 3 lw 2


plot \
'kenreanixon.data' using 1 every 1 w l ls 1 \
t '{/Times-Italic "President Kennedy"}', \
'kenreanixon.data' using 2 every 1 w l ls 2 \
t '{/Times-Italic "President Reagan"}', \
'kenreanixon.data' using 3 every 1 w l ls 3 \
t '{/Times-Italic "President Nixon"}', \
