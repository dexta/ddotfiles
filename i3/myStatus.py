#!/usr/bin/env python
import psutil

raw = psutil.cpu_percent(interval=0.1,percpu=True)
out = " - ".join("%02d"%x for x in raw)

print("%s ||"%out)
