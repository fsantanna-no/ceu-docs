00:30 -> 01:10 demo
03:00 -> 05:32 possible implementation
06:20 -> 06:56 actual implementation
07:30 -> 08:25 fragmentation / serialize
09:00 -> 10:04 compression
12:50 -> 14:00 diffs

melt \
    braid.mp4 in=780   out=1750  \
    braid.mp4 in=4500  out=8300  \
    braid.mp4 in=9550  out=10420 \
    braid.mp4 in=11350 out=12650 \
    braid.mp4 in=13500 out=15125 \
    braid.mp4 in=19250 out=21450 \
        -consumer avformat:cut-braid.mkv
