library(bupaR)
library(readr)
library(eventdataR)
library(processmapR)
library(processmonitR)

# import data
data <- read.csv('./new_data.csv', header = TRUE)
head(data)


# reshaping the data

data$timestamp <- as.Date(data$timestamp, format='%Y-%m-%d')
head(data)

log <- eventlog(
  eventlog = data,
  case_id = 'case_id',
  activity_id = 'activity',
  activity_instance_id = 'activity_instance_id',
  lifecycle_id = 'lifecycle_id',
  timestamp = 'timestamp',
  resource_id = 'resource'
)

log
# you can attempt to create an event log object manually by uncommenting the line below
# ieventlog(data)

#use log above to plot a process map
processmapR::process_map(log)

