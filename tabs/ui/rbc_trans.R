##-- tabs: rbc_trans

# subtab may be added
# tab_files <- list.files(path = "tabs/ui/rbc", full.names = T)
# suppressMessages(lapply(tab_files, source))

rbc_trans <- tabPanel(title = "RBC Transfusion", 
                     value = "rbc",
                     br(), hr(),
                     #-- Button ------
                     column(width = 9,
                            ##--+ Recipient ----
                            column(width = 3,
                                   pickerInput(inputId = "rbc_recip", 
                                               label = "Recipient", 
                                               choices = btype, 
                                               selected = "O", 
                                               options = list(`live-search` = TRUE))
                            ),
                            
                            ##--+ Donor ----
                            column(width = 3,
                                   selectInput(inputId = "rbc_donor", 
                                               label = "Donor", 
                                               choices = "", 
                                               selected = "",
                                   )
                            ),
                            ##--+ Clinical Phase ----
                            column(width = 3,
                                   pickerInput(inputId = "rbc_phase", 
                                               label = "Transfusion Phase", 
                                               choices = c("I", "II", "III"), 
                                               selected = "I",
                                               options = list(`live-search` = TRUE))
                            ),
                            
                            
                     ), 
                     br(),
                     br(),
                     ##-- Visualization ----
                     column(width = 2, style = "padding-top: 50px;",
                            actionBttn(inputId = "rbc_choice", 
                                       label = "Select", 
                                       style = "fill", 
                                       color = "success", 
                                       icon = icon("check"), size = "sm") 
                     ),
                     br(),
                     conditionalPanel(condition = "input.rbc_choice < 1",
                                      column(width = 12,
                                             br(), br(),
                                             wellPanel(
                                               HTML("<h1>The General Principle of Red Blood Cell (RBC) Transfusion for ABO-Incompatible Progenitor Cell Transplantation. <h1>"),
                                               HTML("<h4> Transfusion during progenitor cell transplantation can be separated into three phases, 
                                                    with phase I occurring during the preparative regimen, phase II during engraftment, and phase III post-engraftment. <h4>"),
                                               #HTML("<h4> <b> Reference: </b> <i>Patricia M. Kopko(2015) Transfusion Support for ABO-Incompatible Progenitor Cell Transplantation. Transfusion Medicine and Hemotherapy. </i><h4>"),
                                               HTML("<h3><b> RBC transfusion for Major ABO-incompatible progenitor </b><h3>"),
                                               HTML("<h4> 1. During phase I of the transplant process, the recipient can safely receive blood components of recipient type. <h4>"),
                                               HTML("<h4> 2. During phase II, the compatibility of RBC can be addressed by transfusion of cells of recipient type. <h4>"),
                                               HTML("<h4> 3. During phase III, donor red blood cells have engrafted, the recipient can receive RBC of donor type. <h4>"),
                                               HTML("<h3><b> For Minor ABO-incompatible progenitor </b><h3>"),
                                               HTML("<h4> 1. In phase I of the transplant process, RBC received by the patient should be the recipient(patient) type. <h4>"),
                                               HTML("<h4> 2. In phase II, the patient should receive RBC of donor type. <h4>"),
                                               HTML("<h4> 3. In phase III, the patient should receive RBC of donor type. <h4>"),
                                               HTML("<h3><b> For Bidirectional ABO-incompatible progenitor </b> <h3>"),
                                               HTML("<h4> 1. In phase I,  the patient can receive all products of the recipient’s blood type. <h4>"),
                                               HTML("<h4> 2. In phase II, only group O RBC can be transfused. <h4>"),
                                               HTML("<h4> 3. In phase III, transfusion of RBCs can be of donor type. <h4>")
                                               #HTML("<h4> <b>In this tab, based on conditional selection, the user can explore the optimal choice of blood type for the patients treated by  ABO-incompatible progenitor cell transplantation. </b><h4>")
                                             )
                                      )
                     ),
                     ##-- Outputs ----
                     column(width = 12,
                            conditionalPanel(condition = "input.rbc_choice > 0",
                                             HTML("<h3><i>Tips</i> :<h3>" ),
                                             HTML("<h4><p style=color:red>1. Based on conditional selection, the user can explore the optimal choice of <b><i>RBC</b></i> for the patients treated by ABO-incompatible progenitor cell transplantation."),
                                             HTML("<h4><p style=color:red>2. A policy regarding progenitor cell transplantation and <b><i>irradiation of RBC to prevent transfusion-associated graft versus disease (TAGVHD)</b></i> should be established. </p><h4>") 
                            ),
                            
                            ##-- + 1st Choice ----
                            column(width = 6,
                                   conditionalPanel(condition = "input.rbc_choice > 0",
                                                    HTML("<center><h1>The 1st Choice</h1></center>"),
                                                    br(),
                                                    textOutput("rbc_1st_choice"),
                                                    tags$head(tags$style('#rbc_1st_choice{color:red;
                                                                                          font-size: 200px;
                                                                                          font-weight: bold;
                                                                                          text-align:center}')),
                                   )
                            ),
                            ##-- + 2nd Choice ----
                            column(width = 6,
                                   conditionalPanel(condition = "input.rbc_choice > 0",
                                                    HTML("<center><h1>The 2nd Choice</h1></center>"),
                                                    br(),
                                                    plotOutput("rbc_2nd_choice")
                                                    
                                   )
                            )
                     )
)


