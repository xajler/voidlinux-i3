exec i3
xset b off

# Add this to exec i3 for logging.
# -V -d all >> /home/x/.config/i3/logfile

# calibration for ThinkPad t440s
/usr/bin/xcalib -d :1 .config/icc/Profiles/B140HAN01_2_Easy_D65_201801151337.icm
# calibration for ThinkPad x220
#/usr/bin/xcalib -d :0 .config/icc/Profiles/Color-LCD-#1-2016-02-16-02-0-2.2-F-S-XYZLUT+MTX.icc
