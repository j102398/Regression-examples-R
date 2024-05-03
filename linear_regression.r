# Load the ggplot2 and RSQLite libraries
library(ggplot2)
library(RSQLite)

# Connect to the SQLite databases
gw28_connection <- dbConnect(SQLite(), dbname = "gw28_outcome.db")
gw29_connection <- dbConnect(SQLite(), dbname = "gw29_outcome.db")
gw30_connection <- dbConnect(SQLite(),dbname="gw30_outcome.db")
gw31_connection <- dbConnect(SQLite(),dbname="gw31_outcome.db")
gw32_connection <- dbConnect(SQLite(),dbname="gw32_outcome.db")


# Get Game Week28,29,30,31 data
gw28_data <- dbGetQuery(gw28_connection, "SELECT home_xg, home_points FROM outcome")
gw29_data <- dbGetQuery(gw29_connection, "SELECT home_xg, home_points FROM outcome")
gw30_data <- dbGetQuery(gw30_connection, "SELECT home_xg, home_points FROM outcome")
gw31_data <- dbGetQuery(gw31_connection, "SELECT home_xg, home_points FROM outcome")
gw32_data <- dbGetQuery(gw32_connection, "SELECT home_xg, home_points FROM outcome")


# Combine data from all available weeks
combined_data <- rbind(gw28_data, gw29_data,gw30_data,gw31_data,gw32_data)

# Print the combined data
print(combined_data)

# Create a ggplot with home_xg and home_points
pplot <- ggplot(combined_data, aes(x = home_xg, y = home_points)) +
  geom_point() +  # Adding a geom layer for points
  geom_smooth(method = "lm", se = TRUE, color = "red") +  # Adding a linear regression line
  #se = TRUE shows confidence interval
  labs(title = "Linear Regression of Home Points vs. Expected Goals",
       x = "Expected Goals",
       y = "Home Points") +
  theme_minimal()


# Print the plot
print(pplot)

# Don't forget to disconnect from the databases when you're done
dbDisconnect(gw28_connection)
dbDisconnect(gw29_connection)
