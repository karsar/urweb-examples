#Simple web apps in Ur/Web

Mostly useful for beginners

**Thermo:**

A simple web interface to a database containing measurements of temperature. New
measurements are constantly added via external program writing them to the database upon
receiving from the sensor. In real system everything works on Raspberry Pi 2. To simulate sensor's
work, monitor.py may be used (not a part of the web interface).
 Left side bar plot shows latest 25 temperatures (more recent being placed on top). The length of
each bar is proportional to the temperature value. Bar plot is updated every minute or so. If
temperature is not in the prescribed interval, it's marked by red and the length of the bar stays
constant in that case. The rest is self-explanatory. Screenshot is not a part of the web interface.
It was my intension to avoid FFI altogether!

**SVGTest: SVG circle and mouse events:**

 Example of new tag introduction and, as a consequence, of possibly compromised security
(don't prove, just warn). I also use mouse events (legal and OK). Svg tag introduction is heavily
borrowed from the example given in the urweb mailing list. I'm currently experimenting with svg tag
and this is one of the experiments in pursuit of the D3 style.

**Juji:**

 A scheduler for a jujitsu practitioner. Lists all the techniques of a given level together with the
number of times being practiced. Assuming that after executing more than five times technique is
memorized, as soon as all the techniques are memorized requests upgrading the level. The name of the
techniques changes color according to number of practiced executions. This just to help
keep track things. Small illustration of list data structure. 
