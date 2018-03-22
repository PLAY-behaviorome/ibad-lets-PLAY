# Get county from city, state
city <- "Athens"
state <- "GA"
county_given_city(city, state)
# Get FIPs from county
fips <- fips_given_county(county_given_city(city, state), state)
# Assemble
d <- data_frame(City=city, State=state, region=fips)
d