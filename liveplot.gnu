set term png size 1920,920
#set output "../csvStreamer/public/google.png"
set output output
set multiplot
set size 1, 0.5

set key title "Latency"
set xlabel "Date"
set ylabel "Latency (ms)"
set xdata time
set timefmt '%Y-%m-%d %H:%M:%S'
set format x "%Y-%m-%d %H:%M"
set datafile sep ','
set origin 0.0,0.5
set autoscale fix
set yrange [-1:]
#stats [2:5] "/var/log/pingData/google.ping.log"
#set yr [0:stats_max_y]
plot logfile using 1:5  w l title 'Max' lc rgb 'red', logfile using 1:4 w l title 'Avg' lc rgb 'blue', logfile using 1:3 w l lc rgb 'green' title 'Min'

set key title ""
set origin 0.0,0.0
set yrange [-1:100]
set ylabel "Loss (%)"
plot logfile using 1:2 w l lc rgb 'red' notitle
unset multiplot
#pause 1
#reread
