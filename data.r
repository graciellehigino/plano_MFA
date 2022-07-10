library(timevis)

data <- data.frame(
  id      = 1:3,
  content = c("Write & send pitch to faculty",
              "Trip MTL",
              "Schedule English test"),
  start   = c("2022-08-10", "2022-08-13", "2022-08-29"),
  end     = c("2022-08-12", "2022-08-27", NA),
  group = c("admission", "documentary", "admission"),
  type = c(rep("range", 2), "point"),
  editable = TRUE
)

timevis(data)

timevisDataGroups <- data.frame(
  id = c("admission", "documentary"),
  content = c("Admissions", "Documentary")
)