plasma_trans <- tabPanel(title = "Plasma Transfusion", 
                    value = "plasma",
                    br(), hr(),
                    #-- Button ------
                    column(width = 9,
                           ##--+ Recipient ----
                           column(width = 3,
                                  pickerInput(inputId = "plasma_recip", 
                                              label = "Recipient", 
                                              choices = btype, 
                                              selected = "O", 
                                              options = list(`live-search` = TRUE))
                           ),
                           
                           ##--+ Donor ----
                           column(width = 3,
                                  selectInput(inputId = "plasma_donor", 
                                              label = "Donor", 
                                              choices = "", 
                                              selected = "",
                                  )
                           ),
                           ##--+ Clinical Phase ----
                           column(width = 3,
                                  pickerInput(inputId = "plasma_phase", 
                                              label = "Transfusion Phase", 
                                              choices = c("I", "II", "III_a", "III"), 
                                              selected = "I",
                                              options = list(`live-search` = TRUE))
                           )
                    ),
                    br(),
                    br(),
                    ##-- Visualization ----
                    column(width = 2, style = "padding-top: 50px;",
                           actionBttn(inputId = "plasma_choice", 
                                      label = "Select", 
                                      style = "fill", 
                                      color = "success", 
                                      icon = icon("check"), size = "sm") 
                    ),
                    br(),
                    conditionalPanel(condition = "input.plasma_choice < 1",
                                     column(width = 12,
                                            br(), br(),
                                            wellPanel(
                                              HTML("<h1>The General Principle of Plasma Transfusion for ABO-Incompatible Progenitor Cell Transplantation. <h1>"),
                                              HTML("<h4> Transfusion during progenitor cell transplantation can be separated into three phases, 
                                                    with phase I occurring during the preparative regimen, phase II during engraftment, and phase III post-engraftment. <h4>"),
                                              #HTML("<h4> <b> Reference: </b> <i>Patricia M. Kopko(2015) Transfusion Support for ABO-Incompatible Progenitor Cell Transplantation. Transfusion Medicine and Hemotherapy. </i><h4>"),
                                              HTML("<h3><b> Plasma transfusion for Major ABO-incompatible progenitor </b><h3>"),
                                              HTML("<h4> 1. During phase I of the transplant process, the recipient can safely receive plasma of recipient type; <h4>"),
                                              HTML("<h4> 2. During phase II, the compatibility of plasma can be addressed by transfusion of donor type (the 1st choice), and the 2nd choice of thansfusion type is AB (if the donor is blood type A
or B). <h4>"),
                                              HTML("<h4> 3. During phase III, donor red blood cells have engrafted, and incompatible recipient isoagglutinins are no longer present. The recipient can receive plasma of donor type. <h4>"),
                                              HTML("<h3><b> For Minor ABO-incompatible progenitor </b><h3>"),
                                              HTML("<h4> 1. In phase I of the transplant process, plasma received by the patient should be the recipient(patient) type. <h4>"),
                                              HTML("<h4> 2. In phase II, since plasma should ideally not contain isoagglutinins directed against the recipient’s red blood cells, plasma of the recipient’s blood type are considered to be the first choice. <h4>"),
                                              HTML("<h4> 3. In phase III, the patient should receive plasma of donor type. Furthermore, an alternate approach to plasma transfusion with recipient type (the 1st choice), which considers isoagglutinin compatibility with both the donor and recipient is preferred by some transplant centers.<h4>"),
                                              HTML("<h3><b> For Bidirectional ABO-incompatible progenitor </b> <h3>"),
                                              HTML("<h4> 1. In phase I,  the patient can receive plasma of the recipient’s blood type. <h4>"),
                                              HTML("<h4> 2. In phase II, only group AB plasma can be transfused. <h4>"),
                                              HTML("<h4> 3. In phase III, transfusion of plasma can be of donor type. Alternatively, if isoagglutinin compatibility with both the donor and the recipient is preferred, the first choice of plasma is group AB. <h4>")
                                              #HTML("<h4> <b>In this tab, based on conditional selection, the user can explore the optimal choice of blood type for the patients treated by  ABO-incompatible progenitor cell transplantation. </b><h4>")
                                            )
                                     )
                    ),
                    column(width = 12,
                           conditionalPanel(condition = "input.plasma_choice > 0",
                                            HTML("<h3><i>Tips</i> :<h3>" ),
                                            HTML("<h4><p style=color:red>1. Based on conditional selection, the user can explore the optimal choice of <b><i>Plasma</b></i> for the patients treated by ABO-incompatible progenitor cell transplantation."),
                                            HTML("<h4><p style=color:red>2. For plasma transfusion, Phase III means donor-compatible; III_a indicating donor- and recipient-compatible.  </p><h4>") 
                           ),
                           
                           ##-- + 1st Choice ----
                           column(width = 6,
                                  conditionalPanel(condition = "input.plasma_choice > 0",
                                                   HTML("<center><h1>The 1st Choice</h1></center>"),
                                                   br(),
                                                   textOutput("plasma_1st_choice"),
                                                   tags$head(tags$style('#plasma_1st_choice{color:red;
                                                                                          font-size: 200px;
                                                                                          font-weight: bold;
                                                                                          text-align:center}')),
                                  )
                           ),
                           ##-- + 2nd Choice ----
                           column(width = 6,
                                  conditionalPanel(condition = "input.plasma_choice > 0",
                                                   HTML("<center><h1>The 2nd Choice</h1></center>"),
                                                   br(),
                                                   textOutput("plasma_2nd_choice"),
                                                   tags$head(tags$style('#plasma_2nd_choice{color:#0176FE;
                                                                                          font-size: 200px;
                                                                                          font-weight: bold;
                                                                                          text-align:center}'))
                                                   
                                  )
                           )
                    )
                    
                    
  )
                    
