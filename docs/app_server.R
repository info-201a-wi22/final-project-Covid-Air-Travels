library(dplyr) 
library(plotly)
library(stringr)

source("../source/summary.R")
source("../source/summary_table.R")
source("../source/chart1.R")
source("../source/chart2.R")
source("../source/chart3.R")


server <- function(input, output) { 
  output$imgTix <- renderImage({
    filename <- normalizePath(file.path('../img/plane.jpg'))
    
    list(src = filename, 
         width = 500,
         alt = "airplane")
    
  }, deleteFile = FALSE)
  
  output$report <- renderText({
    abstract <- "Our main question is how COVID has affected air travel and how 
    this impacts the lives of the people that travel. This question is 
    important because COVID has caused many losses for airlines with many 
    people opting for other options to connect with others. To help answer this 
    question, we will find details on the changes in passengers that the 
    airlines receive."
  })
  
  output$chart1 <- renderPlot({
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
    
    #FEEDBACK: "Your first chart is great, and I do think that it's one of your 
    #strongest graphs as it does the best job of showing just how much COVID 
    #affected flights. For the widgets, I would suggest having the user select 
    #the range of dates or years they want or certain months"
    
  })
  
  output$chart2 <- renderPlot({
    
    
    #FEEDBACK: "Your second chart is great, one thing that I might work on 
    #would be maybe adding a more descriptive X-axis might help increase the 
    #clarity to the table, or even a more descriptive title. Another thing 
    #might be to make sure the user knows what year you are looking at, is it 
    #only one year, one month, one day, or all the data inside of the data set?"
    
  })
  
  output$chart3 <- renderPlot({
    if(input$vis3 == "All carriers"){
      p <- ggplot(data = avg_passengers, aes(x = Year, y = all)) +
        geom_bar(stat = "identity", fill = "olivedrab3") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of flight passengers by year")
    } else if(input$vis3 == "American Airlines"){
      p <- ggplot(data = avg_passengers, aes(x = Year, y = aa)) +
        geom_bar(stat = "identity", fill = "firebrick3") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of American Airlines' passengers by year")
    } else if(input$vis3 == "Delta Airlines") {
      p <- ggplot(data = avg_passengers, aes(x = Year, y = dl)) +
        geom_bar(stat = "identity", fill = "dodgerblue2") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of Delta Airlines' passengers by year")
    } else if(input$vis3 == "Southwest Airlines") {
      p <- ggplot(data = avg_passengers, aes(x = Year, y = wn)) +
        geom_bar(stat = "identity", fill = "darkgoldenrod1") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of Southwest Airlines' passengers by year")
    } else if(input$vis3 == "United Airlines") {
      p <- ggplot(data = avg_passengers, aes(x = Year, y = ua)) +
        geom_bar(stat = "identity", fill = "purple4") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of United Airlines' passengers by year")
    } else {
      p <- ggplot(data = avg_passengers, aes(x = Year, y = cz)) +
        geom_bar(stat = "identity", fill = "deepskyblue3") +
        labs(y = "Average number of passengers", x = "Year") +
        ggtitle("Average number of China Southern Airlines' passengers by year")
    }
    return(p)

  })
}

