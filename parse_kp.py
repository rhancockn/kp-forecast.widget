#!/anaconda3/bin/python3
import urllib.request
import re
import datetime
request = urllib.request.urlopen('ftp://ftp.swpc.noaa.gov/pub/weekly/27DO.txt')
data = request.read()
lines = data.splitlines()
dates = []
kps = []
html = []
for line in lines:
    line = line.decode("utf-8")
    if len(line) == 0:
        continue
    if line[0] == '#' or line[0] == ':':
        continue
    fields = re.split(r'\s+', line)
    kps.append(int(fields[5]))
    html.append('<button class="kp%s">%d</button>' % (fields[5], int(fields[2])))
    dates.append(' '.join(fields[0:3]))

start_day = datetime.datetime.strptime(dates[0], '%Y %b %d').weekday()

max_kp = max(kps)
content = f"""
  <div class="calendar">
    <div class="month-indicator kp{max_kp}">
      Max Kp: {max_kp}
    </div>
    <div class="day-of-week">
      <div>Su</div>
      <div>Mo</div>
      <div>Tu</div>
      <div>We</div>
      <div>Th</div>
      <div>Fr</div>
      <div>Sa</div>
    </div>
    <div class="date-grid">
    """
content = content + "\n".join(html)
content = content + "</div>\n</div>"
print(content)