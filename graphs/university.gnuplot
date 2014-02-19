#!/usr/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set output 'university.eps'
set ylabel "Relative Frequency"
set size 1.15,0.85
set xtics ("1800" 0, "1850" 12.5, "1900" 25, "1950" 37.5, "2000" 50)
set xrange [25:50]
unset ytics
set pointsize 2
set key samplen 1
set font "Times-Roman,24"

set style line 1 lt 2 lc rgb "red" lw 10
set style line 2 lt 1 lc rgb "red" lw 10
set style line 3 lt 3 lc rgb "red" lw 10
set style line 4 lt 2 lc rgb "blue" lw 10
set style line 5 lt 1 lc rgb "blue" lw 10
set style line 6 lt 3 lc rgb "blue" lw 10

plot \
 'university.data' using 3 every 4 w l ls 1 t 'burnt', \
 'university.data' using 1 every 4 w l ls 2 t 'burnt\_VERB', \
 'university.data' using 4 every 4 w l ls 3 t 'burnt\_ADJ', \
 'university.data' using 2 every 4 w l ls 4 t 'burned', \
 'university.data' using 5 every 4 w l ls 5 t 'burned\_VERB', \
 'university.data' using 6 every 4 w l ls 6 t 'burned\_ADJ'

