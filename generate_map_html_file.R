list.of.packages <- c("leaflet", "htmlwidgets")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


# Start Script Here: ------------------------------------------------------

library(leaflet)
library(readr)
assignment <- read_csv("/users/alecdewar/Downloads/lab7/assignment.csv")
my.path = 'assignment.csv'
my.path
df = read.csv(my.path)
df
popup <- paste("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:300px'><b>",
               '<a href=', df$InfoURL, ' target="_blank"> <h2 align="center"><strong>', df$Name, "</strong></h2></a><br>",
               "</b>", df$Description, '<br><br><center><img src="', df$ImageURL, '" height="150px" width="200px" border="8"></center><br> </div>')


map = leaflet() %>%
    addTiles( ) %>%
    addMarkers(data = df, lat = df$Latitude, lng = df$Longitude, popup = popup )

map

htmlwidgets::saveWidget(map, file = paste0(dirname(my.path), "/map.html"))


## my map is giving me a few locations in around China
## I have tried changing the longitude to negatives and it still gives me those coordinates
