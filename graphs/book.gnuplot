#!/usr/bin/gnuplot

set terminal postscript enh eps color "Times-Roman" 24
set title 'Query: {/Times-Italic "book\_INF a hotel"}'
set output 'book.eps'
set ylabel "Relative Frequency"
set size 1.5,1
set xtics ("1950" 0, "1975" 12.5, "2000" 25)
set xrange [0:25]
unset ytics
set pointsize 2
set key left top Left reverse samplen 1

set style line 1 lw 10 
set style line 2 lw 10 
set style line 3 lw 10 
set style line 4 lw 10 
set style line 5 lw 10 

plot \
 'book.data' using 1 every 2 w l ls 1 \
  t '{/Times-Italic book a hotel}', \
 'book.data' using 2 every 2 w l ls 2 \
  t '{/Times-Italic booked a hotel}', \
 'book.data' using 3 every 2 w l ls 3 \
  t '{/Times-Italic booking a hotel}', \
 'book.data' using 4 every 2 w l ls 4 \
  t '{/Times-Italic books a hotel}'


