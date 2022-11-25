home <- tabPanel(title = "Home", 
                 value = "home",
                 hr(),
                 br(), br(),
                 HTML("<h1><center>WELCOME TO <b>TRANSFUSION SAFETY</b> WEBPAGE...</center></h1>"),
                 br(), br(), br(), br(),
                 column(width = 3, align = "center",
                        tab_tsr(texto = "Red blood cell", cor = "#E96449", icon = "rbc_used.png", id = "rbc_trans")
                 ),
                 column(width = 3, align = "center",
                        tab_tsr(texto = "Plasma", cor = "#FDC23A", icon = "plasma_used.png", id = "plasma_trans")
                 ),
                 column(width = 3, align = "center",
                        tab_tsr(texto = "Platelet", cor = "#098EBB", icon = "plt_used.png", id = "plt_trans")
                 ),
                 column(width = 3, align = "center",
                        tab_tsr(texto = "Contact us", cor = "#804480", icon = "contact.png", id = "contact_us")
                 ),
                 column(width = 12,
                        br(), br(), br(), br(),
                        wellPanel(
                          HTML("<h1><b><p style=color:rgb(255,0,0)>TRANSFUSION SAFETY</b></h1>"),
                          HTML("<h3><b><p>TSR is an easy-to-use application that offers a “one-key” output for transfusion practice targeting ABO-incompatible HSCT.</p> </b></h3>"),
                          HTML("<h3><b><p>The benefit of TSR is that the physician can review each ABO-incompatible HSCT case before receiving the blood products and individualize the transfusion therapy.</p></h3></b>")
                         
                          
                              
                        )
                 )
)