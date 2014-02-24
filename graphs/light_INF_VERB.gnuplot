#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {/Times-Italic "light\_VERB\_INF"}'
set output 'light_INF_VERB.eps'
set ylabel "Relative Frequency"
set size 1,1
set xtics ("1700" 0, "1850" 150, "2000" 300)
set xrange [0:300]
unset ytics
set pointsize 1
set key left top Left reverse samplen 1

set style line 1 lw 10
set style line 2 lw 10
set style line 3 lw 10
set style line 4 lw 10
set style line 5 lw 10
set style line 6 lw 10


plot \
'light_INF_VERB.data' using 1 every 1 w l ls 1 \
t '{/Times-Italic "light\_VERB"}', \
'light_INF_VERB.data' using 2 every 1 w l ls 2 \
t '{/Times-Italic "lighted\_VERB"}', \
'light_INF_VERB.data' using 3 every 1 w l ls 3 \
t '{/Times-Italic "lit\_VERB"}', \
'light_INF_VERB.data' using 4 every 1 w l ls 4 \
t '{/Times-Italic "lighting\_VERB"}', \
'light_INF_VERB.data' using 5 every 1 w l ls 5 \
t '{/Times-Italic "lights\_VERB"}', \
'light_INF_VERB.data' using 6 every 1 w l ls 6 \
t '{/Times-Italic "lightest\_VERB"}', \
