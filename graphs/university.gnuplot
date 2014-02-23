#!/usr/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title "Query: {/Times-Italic \"University of *\"}"
set output 'university.eps'
set ylabel "Relative Frequency"
set size 1,1
set xtics ("1800" 0, "1850" 12.5, "1900" 25, "1950" 37.5, "2000" 50)
set xrange [25:50]
unset ytics
set pointsize 2
set key left top Left reverse samplen 1

set style line 1 lw 10 
set style line 2 lw 10 
set style line 3 lw 10 
set style line 4 lw 10 
set style line 5 lw 10 

#set style line 1 lt 2 lc rgb "red" lw 10
#set style line 2 lt 1 lc rgb "red" lw 10
#set style line 3 lt 3 lc rgb "red" lw 10
#set style line 4 lt 2 lc rgb "blue" lw 10
#set style line 5 lt 1 lc rgb "blue" lw 10
#set style line 6 lt 3 lc rgb "blue" lw 10

plot \
 'university.data' using 1 every 4 w l ls 1 \
  t '{/Times-Italic University of California}', \
 'university.data' using 2 every 4 w l ls 2 \
  t '{/Times-Italic University of Chicago}', \
 'university.data' using 3 every 4 w l ls 3 \
  t '{/Times-Italic University of Wisconsin}', \
 'university.data' using 4 every 4 w l ls 4 \
  t '{/Times-Italic University of Michigan}', \
 'university.data' using 5 every 4 w l ls 5 \
  t '{/Times-Italic University of Pennsylvania}'


