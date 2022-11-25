plt_trans <- tabPanel(title = "Platelet Transfusion", 
                         value = "plt",
                         br(), hr(),
                      #-- Button ------
                      column(width = 9,
                             ##--+ Recipient ----
                             column(width = 3,
                                    pickerInput(inputId = "plt_recip", 
                                                label = "Recipient", 
                                                choices = btype, 
                                                selected = "O", 
                                                options = list(`live-search` = TRUE))
                             ),
                             
                             ##--+ Donor ----
                             column(width = 3,
                                    selectInput(inputId = "plt_donor", 
                                                label = "Donor", 
                                                choices = "", 
                                                selected = "",
                                    )
                             ),
                             ##--+ Clinical Phase ----
                             column(width = 3,
                                    pickerInput(inputId = "plt_phase", 
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
                             actionBttn(inputId = "plt_choice", 
                                        label = "Select", 
                                        style = "fill", 
                                        color = "success", 
                                        icon = icon("check"), size = "sm") 
                      ),
                      br(),
                      conditionalPanel(condition = "input.plt_choice < 1",
                                       column(width = 12,
                                              br(), br(),
                                              wellPanel(
                                                HTML("<h1>The General Principle of Platelet Transfusion for ABO-Incompatible Progenitor Cell Transplantation. <h1>"),
                                                HTML("<h4> Transfusion during progenitor cell transplantation can be separated into three phases, 
                                                    with phase I occurring during the preparative regimen, phase II during engraftment, and phase III post-engraftment. <h4>"),
                                                #HTML("<h4> <b> Reference: </b> <i>Patricia M. Kopko(2015) Transfusion Support for ABO-Incompatible Progenitor Cell Transplantation. Transfusion Medicine and Hemotherapy. </i><h4>"),
                                                HTML("<h3><b> Platelet transfusion for Major ABO-incompatible progenitor </b><h3>"),
                                                HTML("<h4> 1. During phase I of the transplant process, the recipient can safely receive platelet of recipient type; <h4>"),
                                                HTML("<h4> 2. During phase II, the compatibility of platelet can be addressed by transfusion of donor type (the 1st choice). <h4>"),
                                                HTML("<h4> 3. During phase III, donor red blood cells have engrafted, and incompatible recipient isoagglutinins are no longer present. The recipient can receive platelet of donor type. <h4>"),
                                                HTML("<h3><b> For Minor ABO-incompatible progenitor </b><h3>"),
                                                HTML("<h4> 1. In phase I of the transplant process, platelet received by the patient should be the recipient type. <h4>"),
                                                HTML("<h4> 2. In phase II, since plasma should ideally not contain isoagglutinins directed against the recipient’s red blood cells, platelet of the recipient’s blood type are considered to be the first choice. <h4>"),
                                                HTML("<h4> 3. In phase III, the patient should receive platelet of donor type. Furthermore, an alternate approach to platelet transfusion with recipient type (the 1st choice), which considers isoagglutinin compatibility with both the donor and recipient is preferred by some transplant centers.<h4>"),
                                                HTML("<h3><b> For Bidirectional ABO-incompatible progenitor </b> <h3>"),
                                                HTML("<h4> 1. In phase I,  the patient can receive platelet of the recipient’s blood type. <h4>"),
                                                HTML("<h4> 2. In phase II, the group AB platelet can be transfused (the 1st choice). <h4>"),
                                                HTML("<h4> 3. In phase III, transfusion of platelet can be of donor type. Alternatively, if isoagglutinin compatibility with both the donor and the recipient is preferred, the first choice of platelet is group AB. <h4>")
                                                #HTML("<h4> <b>In this tab, based on conditional selection, the user can explore the optimal choice of blood type for the patients treated by  ABO-incompatible progenitor cell transplantation. </b><h4>")
                                              )
                                       )
                      ),
                      column(width = 12,
                             conditionalPanel(condition = "input.plt_choice > 0",
                                              HTML("<h3><i>Tips</i> :<h3>" ),
                                              HTML("<h4><p style=color:red>1. Based on conditional selection, the user can explore the optimal choice of <b><i>Platelet</b></i> for the patients treated by ABO-incompatible progenitor cell transplantation."),
                                              HTML("<h4><p style=color:red>2. For platelet transfusion, Phase III means donor-compatible; III_a indicating donor- and recipient-compatible.  </p><h4>"),
                                              HTML("<h4><p style=color:red>3. A policy regarding progenitor cell transplantation and <b><i>irradiation of Platelet to prevent transfusion-associated graft versus disease (TAGVHD)</b></i> should be established. </p><h4>") 
                             ),
                             
                             ##-- + 1st Choice ----
                             column(width = 6,
                                    conditionalPanel(condition = "input.plt_choice > 0",
                                                     HTML("<center><h1>The 1st Choice</h1></center>"),
                                                     br(),
                                                     textOutput("plt_1st_choice"),
                                                     tags$head(tags$style('#plt_1st_choice{color:red;
                                                                                          font-size: 200px;
                                                                                          font-weight: bold;
                                                                                          text-align:center}')),
                                    )
                             ),
                             ##-- + 2nd Choice ----
                             column(width = 6,
                                    conditionalPanel(condition = "input.plt_choice > 0",
                                                     HTML("<center><h1>The 2nd Choice</h1></center>"),
                                                     br(),
                                                     textOutput("plt_2nd_choice"),
                                                     tags$head(tags$style('#plt_2nd_choice{color:#0176FE;
                                                                                          font-size: 200px;
                                                                                          font-weight: bold;
                                                                                          text-align:center}'))
                                                     
                                    )
                             )
                      )
)