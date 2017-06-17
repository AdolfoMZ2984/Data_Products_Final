#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

        library(quantmod)
        options("getSymbols.warning4.0"=FALSE)

        getSymbols(c("EPD",
                "ETP",
                "PXD",
                "PAA",
                "KMI",
                "ENB",
                "TRP",
                "SU",
                "COP",
                "WMB",
                "BPL",
                "MPC",
                "VLO",
                "HES",
                "TSO"),
                src="google")

        EPD.Cl<-EPD$EPD.Close
        ETP.Cl<-ETP$ETP.Close
        PXD.Cl<-PXD$PXD.Close
        PAA.Cl<-PAA$PAA.Close
        KMI.Cl<-KMI$KMI.Close
        ENB.Cl<-ENB$ENB.Close
        TRP.Cl<-TRP$TRP.Close
        SU.Cl<-SU$SU.Close
        COP.Cl<-COP$COP.Close
        WMB.Cl<-WMB$WMB.Close
        BPL.Cl<-BPL$BPL.Close
        MPC.Cl<-MPC$MPC.Close
        VLO.Cl<-VLO$VLO.Close
        HES.Cl<-HES$HES.Close
        TSO.Cl<-TSO$TSO.Close

        output$plot1<-renderPlot({
                data <- data.frame(cbind(EPD.Cl,
                                        ETP.Cl,
                                        PXD.Cl,
                                        PAA.Cl,
                                        KMI.Cl,
                                        ENB.Cl,
                                        TRP.Cl,
                                        SU.Cl,
                                        COP.Cl,
                                        WMB.Cl,
                                        BPL.Cl,
                                        MPC.Cl,
                                        VLO.Cl,
                                        HES.Cl,
                                        TSO.Cl))

                data$date<-as.Date(rownames(data))

                library(reshape2)
                data_long <- melt(data, id="date")

                if(input$ticker1==FALSE){
                        data_long<-data_long[data_long$variable!="ETP.Close",]
                }
                if(input$ticker2==FALSE){
                        data_long<-data_long[data_long$variable!="PXD.Close",]
                }
                if(input$ticker3==FALSE){
                        data_long<-data_long[data_long$variable!="PAA.Close",]
                }
                if(input$ticker4==FALSE){
                        data_long<-data_long[data_long$variable!="KMI.Close",]
                }
                if(input$ticker5==FALSE){
                        data_long<-data_long[data_long$variable!="ENB.Close",]
                }
                if(input$ticker6==FALSE){
                        data_long<-data_long[data_long$variable!="TRP.Close",]
                }
                if(input$ticker7==FALSE){
                        data_long<-data_long[data_long$variable!="SU.Close",]
                }
                if(input$ticker8==FALSE){
                        data_long<-data_long[data_long$variable!="COP.Close",]
                }
                if(input$ticker9==FALSE){
                        data_long<-data_long[data_long$variable!="WMB.Close",]
                }
                if(input$ticker10==FALSE){
                        data_long<-data_long[data_long$variable!="BPL.Close",]
                }
                if(input$ticker11==FALSE){
                        data_long<-data_long[data_long$variable!="MPC.Close",]
                }
                if(input$ticker12==FALSE){
                        data_long<-data_long[data_long$variable!="VLO.Close",]
                }
                if(input$ticker13==FALSE){
                        data_long<-data_long[data_long$variable!="HES.Close",]
                }
                if(input$ticker14==FALSE){
                        data_long<-data_long[data_long$variable!="TSO.Close",]
                }
                if(input$ticker3==FALSE){
                        data_long<-data_long[data_long$variable!="PAA.Close",]
                }
                if(input$ticker3==FALSE){
                        data_long<-data_long[data_long$variable!="PAA.Close",]
                }
                if(input$ticker15==FALSE){
                        data_long<-data_long[data_long$variable!="EPD.Close",]
                }

                data_long<-data_long[data_long$date>=format(input$sliderX[1], "%Y-%m-%d"),]
                data_long<-data_long[data_long$date<=format(input$sliderX[2], "%Y-%m-%d"),]

                library(ggplot2)
                p<-ggplot(data=data_long,
                       aes(x=date, y=value, colour=variable)) +
                        geom_line()
                print(p)
        })

        output$out1<-renderText(format(input$sliderX[1], "%Y-%m-%d"))
        output$out2<-renderText(format(input$sliderX[2], "%Y-%m-%d"))
  })

