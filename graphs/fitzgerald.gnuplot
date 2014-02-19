#!/usr/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {/Times-Italic "fitzgerald [case-insensitive]"}'
set output 'fitzgerald.eps'
set ylabel "Relative Frequency"
set size 0.85,0.85
set xtics ("1800" 0, "1900" 25, "2000" 50)
set xrange [0:50]
unset ytics
set pointsize 2
set key left top Left reverse samplen 1

set style line 1 lw 10 
set style line 2 lw 10 
set style line 3 lw 10 


plot \
 'fitzgerald.data' using 1 every 4 w l ls 1 \
  t '{/Times-Italic Fitzgerald}', \
 'fitzgerald.data' using 2 every 4 w l ls 2 \
  t '{/Times-Italic FitzGerald}', \
 'fitzgerald.data' using 3 every 4 w l ls 3 \
  t '{/Times-Italic FITZGERALD}'



