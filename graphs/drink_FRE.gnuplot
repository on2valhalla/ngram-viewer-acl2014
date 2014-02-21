#!/usr/local/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {/Times-Italic "boire=>*\_NOUN"}'
set output 'drink_FRE.eps'
set ylabel "Relative Frequency"
set size 1,1
set xtics ("1800" 0, "1850" 12.5, "1900" 25, "1950" 37.5, "2000" 50)
set xrange [0:50]
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


plot \
'drink_FRE.data' using 1 every 4 w l ls 1 \
t '{/Times-Italic "boire=>vin\_NOUN"}', \
'drink_FRE.data' using 2 every 4 w l ls 2 \
t '{/Times-Italic "boire=>verre\_NOUN"}', \
'drink_FRE.data' using 3 every 4 w l ls 3 \
t '{/Times-Italic "boire=>eau\_NOUN"}', \
'drink_FRE.data' using 4 every 4 w l ls 4 \
t '{/Times-Italic "boire=>sang\_NOUN"}', \
'drink_FRE.data' using 5 every 4 w l ls 5 \
t '{/Times-Italic "boire=>lait\_NOUN"}', \
'drink_FRE.data' using 6 every 4 w l ls 6 \
t '{/Times-Italic "boire=>coup\_NOUN"}', \
'drink_FRE.data' using 7 every 4 w l ls 7 \
t '{/Times-Italic "boire=>café\_NOUN"}', \
'drink_FRE.data' using 8 every 4 w l ls 8 \
t '{/Times-Italic "boire=>thé\_NOUN"}', \
'drink_FRE.data' using 9 every 4 w l ls 9 \
t '{/Times-Italic "boire=>calice\_NOUN"}', \
'drink_FRE.data' using 10 every 4 w l ls 10 \
t '{/Times-Italic "boire=>eaux\_NOUN"}', \
