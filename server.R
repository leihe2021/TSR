# Define server logic required to draw a histogram
server <- function(input, output, session) {
  ##-- Home page -----
  
  observeEvent(input$rbc_trans,{
    updateTabsetPanel(session = session, inputId = "navbar", selected = "rbc")
  })
  observeEvent(input$plasma_trans,{
    updateTabsetPanel(session = session, inputId = "navbar", selected = "plasma")
  })
  observeEvent(input$plt_trans,{
    updateTabsetPanel(session = session, inputId = "navbar", selected = "plt")
  })
  observeEvent(input$contact_us,{
    updateTabsetPanel(session = session, inputId = "navbar", selected = "contact")
  })
  
  ##---- RBC server page -----
  ##---- + Set updataSelectInput for donor type ----
  observeEvent(
    input$rbc_recip,
    updateSelectInput(session,
                      inputId = "rbc_donor",
                      label = "Donor",
                      choices = btype[-which(btype == input$rbc_recip)]
    )
  )
  ##-----+ reactive input ----
  rbc_react <- reactive({
    rec <- input$rbc_recip
    don <- input$rbc_donor
    pha <- input$rbc_phase
    
    rbc_act <- dat %>% 
      dplyr::filter(Products == "RBC", Recipient == rec, Donor == don, Phase == pha) %>% 
      dplyr::select(-Products)
    
    return(rbc_act)
    
  })
  ##-----+ Output ----
  
  res_rbc <- eventReactive(input$rbc_choice,{
    t <- rbc_react()$Component_Transfusion
    return(t)
  })
  
  output$rbc_1st_choice <- renderText({
    res_rbc()
  })
  
  ##---- Plasma server page -----
  ##---- + Set updataSelectInput for donor type ----
  observeEvent(
    input$plasma_recip,
    updateSelectInput(session,
                      inputId = "plasma_donor",
                      label = "Donor",
                      choices = btype[-which(btype == input$plasma_recip)]
    )
  )
  ##-----+ reactive input----
  plasma_react <- reactive({
    pl_rec <- input$plasma_recip
    pl_don <- input$plasma_donor
    pl_pha <- input$plasma_phase
    
    plasma_act <- dat %>% 
      dplyr::filter(Products == "plasma", Recipient == pl_rec, Donor == pl_don, Phase == pl_pha) %>% 
      dplyr::select(-Products)
    
    return(plasma_act)
    
  })
  
  ##-----+ Output ----
  
  ##----+ The 1st choice ---- 
  res_plasma_1st <- eventReactive(input$plasma_choice,{
    t <- plasma_react() %>% 
      dplyr::filter(Choice_levels == "1st") %>% 
      dplyr::select(Component_Transfusion) %>% 
      pull()
   
    return(t)
  })
  
  output$plasma_1st_choice <- renderText({
    res_plasma_1st()
  })
  
  
  ##----+ The 2nd choice ----
  res_plasma_2nd <- eventReactive(input$plasma_choice,{
    t <- plasma_react() %>% 
      dplyr::filter(Choice_levels == "2nd") %>% 
      dplyr::select(Component_Transfusion) %>% 
      pull()
    
    return(t)
  })
  
  output$plasma_2nd_choice <- renderText({
      res_plasma_2nd()
    })
  
  ##---- Plt server page -----
  ##---- + Set updataSelectInput for donor type ----
  observeEvent(
    input$plt_recip,
    updateSelectInput(session,
                      inputId = "plt_donor",
                      label = "Donor",
                      choices = btype[-which(btype == input$plt_recip)]
    )
  )
  
  ##-----+ reactive input----
  plt_react <- reactive({
    plt_rec <- input$plt_recip
    plt_don <- input$plt_donor
    plt_pha <- input$plt_phase
    
    plt_act <- dat %>% 
      dplyr::filter(Products == "Platelet", Recipient == plt_rec, Donor == plt_don, Phase == plt_pha) %>% 
      dplyr::select(-Products)
    
    return(plt_act)
    
  })
  
  ##-----+ Output ----
  
  ##----+ The 1st choice ---- 
  res_plt_1st <- eventReactive(input$plt_choice,{
    p <- plt_react() %>% 
      dplyr::filter(Choice_levels == "1st") %>% 
      dplyr::select(Component_Transfusion) %>% 
      pull()
    
    return(p)
  })
  
  output$plt_1st_choice <- renderText({
    res_plt_1st()
  })
  
  
  ##----+ The 2nd choice ----
  res_plt_2nd <- eventReactive(input$plt_choice,{
    p <- plt_react() %>% 
      dplyr::filter(Choice_levels == "2nd") %>% 
      dplyr::select(Component_Transfusion) %>% 
      pull()
    
    return(p)
  })
  
  output$plt_2nd_choice <- renderText({
    res_plt_2nd()
  })
  
    
  
  
}