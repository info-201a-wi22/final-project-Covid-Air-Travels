library(dplyr) 
library(plotly)
library(stringr)

source("source/chart1.R")
source("source/chart3.R")

date_filter <- passengers_report %>%
  filter(Month > 0 & Month < 4 & Year > 2009)

time_range <- range(date_filter$Year)

server <- function(input, output) { 
  output$wing <- renderImage({
    filename <- normalizePath(file.path('img/wing.png'))
    
    list(src = filename, 
         alt = "airplane wing")
    
  }, deleteFile = FALSE)
  
  output$chart1 <- renderPlotly({
    if(input$vis1 == "All"){
      p <- ggplot(data = NULL, 
                  aes(x = Year, y = Total,color = factor(Month))) +
        geom_line(data = jan_total) + 
        geom_line(data = feb_total) + 
        geom_line(data = mar_total) +
        ggtitle("Total Passengers by Months") +
        ylab("Total Passenger") +
        scale_color_discrete(name = "Months", 
                             label = c("January", "February", "March"))
      return(p)
      
    } else if(input$vis1 == "January"){
      current_select <- jan_total
    } else if(input$vis1 == "February"){
      current_select <- feb_total
    } else{
      current_select <- mar_total
    }
    
    p <- ggplot(
      data = current_select,
      mapping = aes_string(x = "Year", y = "Total")) +
      geom_line() + 
      ggtitle(paste0("Total Passengers in ", input$vis1)) +
      labs(x = "Years", y = "Total Passengers") + 
      scale_color_discrete(name = "Month", 
                           label = input$vis1)
    
    return(p)
  })

  
  output$chart2 <- renderPlotly({
    temp <- date_filter %>%
      filter(Year >= input$time_range[1], Year <= input$time_range[2])
    
    avg_plot <- function(temp,  search = "", 
                         xvar = "Year", yvar = "Total") {
      xmin <- min(temp[,xvar]) - 1
      xmax <- max(temp[,xvar]) + 1
      ymax <- max(temp[,yvar]) 
      
      data <- temp %>% 
        filter(grepl(search, carrier))
      
      p <- plot_ly(x = data[, xvar], y = data[, yvar], 
                   type = "scatter",
                   mode = "markers", 
                   marker = list(
                     opacity = .5, 
                     size = 10, 
                     color = "Month"
                   )) %>% 
        layout(title = paste0("Passenger Distributions for ", input$search), 
               xaxis = list(range = c(xmin, xmax), title = xvar), 
               yaxis = list(range = c(0, ymax), 
                            title = paste0("Total Passengers")) 
        )
      return(p)
    }
    
    return(avg_plot(temp, input$search))
  })

  
  output$chart3 <- renderPlotly({
    if(input$vis3 == "All carriers"){
      p <- ggplot(data = avg_passengers, aes(x = Year, y = All_Passengers)) +
        geom_bar(stat = "identity", fill = "olivedrab3") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of flight passengers by year")
    } else if(input$vis3 == "American Airlines"){
      p <- ggplot(data = avg_passengers, aes(x = Year, y = AmericanAir_Passengers)) +
        geom_bar(stat = "identity", fill = "firebrick3") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of American Airlines' passengers by year")
    } else if(input$vis3 == "Delta Airlines") {
      p <- ggplot(data = avg_passengers, aes(x = Year, y = Delta_Passengers)) +
        geom_bar(stat = "identity", fill = "dodgerblue2") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of Delta Airlines' passengers by year")
    } else if(input$vis3 == "Southwest Airlines") {
      p <- ggplot(data = avg_passengers, aes(x = Year, y = Southwest_Passengers)) +
        geom_bar(stat = "identity", fill = "darkgoldenrod1") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of Southwest Airlines' passengers by year")
    } else if(input$vis3 == "United Airlines") {
      p <- ggplot(data = avg_passengers, aes(x = Year, y = United_Passengers)) +
        geom_bar(stat = "identity", fill = "purple4") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of United Airlines' passengers by year")
    } else {
      p <- ggplot(data = avg_passengers, aes(x = Year, y = ChinaSouthern_Passengers)) +
        geom_bar(stat = "identity", fill = "deepskyblue3") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of China Southern Airlines' passengers by year")
    }
    
    return(p)
    
  })
  
  output$side <- renderImage({
    filename <- normalizePath(file.path('img/side.png'))
    
    list(src = filename, 
         alt = "airplane side")
    
  }, deleteFile = FALSE)
}

