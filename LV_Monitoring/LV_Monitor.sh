#!/bin/bash

alias LVControl='python3 /home/milliqan/MilliDAQ/LVTools/LVExe.py'

ts=$(date +%Y-%m-%d_%H:%M:%S.%N)
LVControl > /home/milliqan/LV_Monitoring/LV_log/Status_LV.log


######### Currents

### Imon

awk -v ts="$ts" '
  /^Current in channel 1:/ {
    if (match($0, /:[[:space:]]*([0-9.]+)/, m)) c1[++n]=m[1]+0
  }
  END {
    printf "%s", ts
    for (i=1;i<=n;i++) printf " %.4f A", c1[i]
    print ""
  }
' /home/milliqan/LV_Monitoring/LV_log/Status_LV.log >> /home/milliqan/LV_Monitoring/LV_log/Imon_positive.log

awk -v ts="$ts" '
  /^Current in channel 2:/ {
    if (match($0, /:[[:space:]]*([0-9.]+)/, m)) c1[++n]=m[1]+0
  }
  END {
    printf "%s", ts
    for (i=1;i<=n;i++) printf " %.4f A", c1[i]
    print ""
  }
' /home/milliqan/LV_Monitoring/LV_log/Status_LV.log >> /home/milliqan/LV_Monitoring/LV_log/Imon_negative.log


### Iset

awk -v ts="$ts" '
  /^Current in channel 1 is set to/ {
    if (match($0, /set to[[:space:]]*([0-9.]+)/, m)) c1[++n]=m[1]
  }
  END {
    printf "%s", ts
    for (i=1;i<=n;i++) printf " %.4f A", c1[i]
    print ""
  }
' /home/milliqan/LV_Monitoring/LV_log/Status_LV.log >> /home/milliqan/LV_Monitoring/LV_log/Iset_positive.log

awk -v ts="$ts" '
  /^Current in channel 2 is set to/ {
    if (match($0, /set to[[:space:]]*([0-9.]+)/, m)) c1[++n]=m[1]
  }
  END {
    printf "%s", ts
    for (i=1;i<=n;i++) printf " %.4f A", c1[i]
    print ""
  }
' /home/milliqan/LV_Monitoring/LV_log/Status_LV.log >> /home/milliqan/LV_Monitoring/LV_log/Iset_negative.log


######### Voltages

### Vmon

awk -v ts="$ts" '
  /^Voltage in channel 1:/ {
    if (match($0, /:[[:space:]]*([0-9.]+)/, m)) c1[++n]=m[1]+0
  }
  END {
    printf "%s", ts
    for (i=1;i<=n;i++) printf " %.4f V", c1[i]
    print ""
  }
' /home/milliqan/LV_Monitoring/LV_log/Status_LV.log >> /home/milliqan/LV_Monitoring/LV_log/Vmon_positive.log

awk -v ts="$ts" '
  /^Voltage in channel 2:/ {
    if (match($0, /:[[:space:]]*([0-9.]+)/, m)) c1[++n]=m[1]+0
  }
  END {
    printf "%s", ts
    for (i=1;i<=n;i++) printf " %.4f V", c1[i]
    print ""
  }
' /home/milliqan/LV_Monitoring/LV_log/Status_LV.log >> /home/milliqan/LV_Monitoring/LV_log/Vmon_negative.log


### Vset

awk -v ts="$ts" '
  /^Voltage in channel 1 is set to/ {
    if (match($0, /set to[[:space:]]*([0-9.]+)/, m)) c1[++n]=m[1]+0
  }
  END {
    printf "%s", ts
    for (i=1;i<=n;i++) printf " %.4f V", c1[i]
    print ""
  }
' /home/milliqan/LV_Monitoring/LV_log/Status_LV.log >> /home/milliqan/LV_Monitoring/LV_log/Vset_positive.log

awk -v ts="$ts" '
  /^Voltage in channel 2 is set to/ {
    if (match($0, /set to[[:space:]]*([0-9.]+)/, m)) c1[++n]=m[1]+0
  }
  END {
    printf "%s", ts
    for (i=1;i<=n;i++) printf " %.4f V", c1[i]
    print ""
  }
' /home/milliqan/LV_Monitoring/LV_log/Status_LV.log >> /home/milliqan/LV_Monitoring/LV_log/Vset_negative.log

