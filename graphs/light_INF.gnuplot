#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {/Times-Italic "light\_INF"}'
set output 'light_INF.eps'
set ylabel "Relative Frequency"
set size 1.25,1
set xtics ("1800" 0, "1850" 12.5, "1900" 25, "1950" 37.5, "2000" 50)
set xrange [0:50]
unset ytics
set pointsize 2
set key out vert
set key right Left reverse samplen 1

set style line 1 lw 10
set style line 2 lw 10
set style line 3 lw 10
set style line 4 lw 10
set style line 5 lw 10
set style line 6 lw 10
set style line 7 lw 10


plot \
'light_INF.data' using 1 every 4 w l ls 1 \
t '{/Times-Italic "light"}', \
'light_INF.data' using 2 every 4 w l ls 2 \
t '{/Times-Italic "lights"}', \
'light_INF.data' using 3 every 4 w l ls 3 \
t '{/Times-Italic "lighted"}', \
'light_INF.data' using 4 every 4 w l ls 4 \
t '{/Times-Italic "lighter"}', \
'light_INF.data' using 5 every 4 w l ls 5 \
t '{/Times-Italic "lighting"}', \
'light_INF.data' using 6 every 4 w l ls 6 \
t '{/Times-Italic "lit"}', \
'light_INF.data' using 7 every 4 w l ls 7 \
t '{/Times-Italic "lightest"}', \
