library(chron)
library(tidyverse)
sleep <- read.csv("csv/sleep.csv", stringsAsFactors = FALSE)
sleep$sleep.time <- chron(time = sleep$sleep_time)
sleep$wake.time <- chron(time = sleep$wake.time)
sleep$sleep.hrs <- with(sleep, abs(wake.time-sleep.time)*24)

sleep %>%
  gather(key = sleep.status, value = clock.time, 
         sleep.time, wake.time) %>%
  mutate(sleep.status, factor(sleep.status, labels = c("sleep", "awaken"))) %>%
  ggplot() +
  aes(x = clock.time, y = id, shape = sleep.status) +
  geom_point() +
  scale_x_chron(format="%H:%M:%S")

sleep %>%
  ggplot() +
  aes(x = sleep.hrs, fill = sleeping.loc) +
  geom_histogram(binwidth = 2) +
  theme_classic()

sleep %>%
  ggplot() +
  aes(x = sleep.hrs, y = naps.hours) +
  geom_point(aes(color = sleeping.loc, size = 1)) +

  theme_classic()

sleep %>%
  ggplot() +
  aes(x=sleep.time) +
  geom_bar() +
  scale_x_chron(format="%H:%M:%S")

sleep %>%
  ggplot() +
  aes(x = wake.time) +
  geom_bar() +
  scale_x_chron(format = "%H:%M:%S")

```{r sleep-plot, fig.cap = "Infant night time and nap hours by sleeping location."}
# sleep <- read.csv("csv/sleep.csv", stringsAsFactors = FALSE)
# 
# sleep$sleep.time <- chron(time = sleep$sleep.time)
# sleep$wake.time <- chron(time = sleep$wake.time)
# sleep$sleep.hrs <- with(sleep, abs(wake.time-sleep.time)*24)
# 
# sleep %>%
#   ggplot() +
#   aes(x = sleep.hrs, y = naps.hours) +
#   geom_point(aes(color = sleeping.loc)) +
#   theme(axis.line = element_blank()) +
#   play.theme +
#   xlab("Nighttime sleep hours") +
#   theme(axis.text = element_text(size = rel(1.2)))
```
<!-- Figure \@ref{fig:sleep-plot} shows parent-reported night time and day time nap hours by sleeping location. -->
  <!-- Most infants sleep in a separate crib about 13 hours/night and take 2-2.5 hour naps each day. -->