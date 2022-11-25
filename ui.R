
ui <- fluidPage(
  ##-- Setting html ----
  tags$head(
    tags$link(rel = "shortcut icon", href = "Transfusion_Safety.png"),
    
    #-- js ----
    tags$link(rel="stylesheet", type = "text/css",
              href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
    tags$link(rel="stylesheet", type = "text/css",
              href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro")
  ),
  
  ##-- Logo ----
  list(tags$head(HTML('<link rel="icon", href="Transfusion_Safety.png",
                        type="image/png" />'))),
  div(style="padding: 1px 0px; width: '100%'",
      titlePanel(
        title="", windowTitle = "TRANSFUSION SAFETY"
      )
  ),
  
  ##-- Header ----
  navbarPage(title = div(img(src="Transfusion_Safety.png",
                             height = "90px"), style = "padding-left:100px;"),
             
             id = "navbar",
             selected = "home",
             theme = "styles.css", 
             fluid = T,
  ##-- Tabs ----
             home,
             rbc_trans,
             plasma_trans,
             plt_trans,
             contact_us
  ),
             
  ##-- Footer ----
             div(class = "footer",
                 includeHTML("html/footer.html")
                 )

)


