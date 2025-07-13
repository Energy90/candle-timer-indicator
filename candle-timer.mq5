//+------------------------------------------------------------------+
//|                                                 candle-timer.mq5 |
//|                                        Copyright 2025, Clarence. |
//|                                              https://mcode.co.za |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Clarence."
#property link      "https://mcode.co.za"
#property version   "1.00"
#property indicator_chart_window
#property description "- candle timer, the indicator that shows: "
#property description "- remaining time of the current candle, "
#property description "- the opening time of the current candle "
#property description "- and the closing time of the current candle"

// declaring global opening time
datetime opening_time;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create a timer with a 1 second period
   EventSetTimer(1);
   
//---
   return(INIT_SUCCEEDED);
  }
   
void OnDeinit(const int reason)
{
   // kill timer after closing a chart
   EventKillTimer();
   // remove comment from the chart   
   ChartSetString(0, CHART_COMMENT, "");
}

int OnCalculate(const int32_t rates_total,
                const int32_t prev_calculated,
                const datetime& time[],
                const double& open[],
                const double& high[],
                const double& low[],
                const double& close[],
                const long& tick_volume[],
                const long& volume[],
                const int& spread[])
  {
   ArraySetAsSeries(time, true);
   if(prev_calculated < rates_total)
   {
      opening_time = time[0];
   }
   return(rates_total);
  }
// timer function
void OnTimer()
{
   //--- time of the OnTimer() first call 
   static datetime start_time=TimeCurrent(); 
//--- trade server time during the first OnTimer() call 
   static datetime start_tradeserver_time=0; 
//--- calculated trade server time 
   static datetime calculated_server_time=0; 
//--- local PC time 
   datetime local_time= TimeLocal(); 

// opening time of a candle stick
   // datetime opening_time = iTime(NULL, PERIOD_CURRENT, 0);  
   
//--- current estimated trade server time 
   datetime trade_server_time= TimeTradeServer();
   datetime remaining_time = local_time - start_time;
   // Print("remaining time", remaining_time); 
//--- if a server time is unknown for some reason, exit ahead of time 
   if(trade_server_time==0) 
      return; 
//--- if the initial trade server value is not set yet 
   if(start_tradeserver_time==0) 
     { 
      start_tradeserver_time=trade_server_time; 
      //--- set a calculated value of a trade server       
      Print(trade_server_time); 
      calculated_server_time=trade_server_time; 
     } 
   else 
     { 
      //--- increase time of the OnTimer() first call 
      if(start_tradeserver_time!=0) 
         calculated_server_time=calculated_server_time+1;; 
     } 
//---
   string com=StringFormat("                  Start time: %s\r\n",TimeToString(start_time,TIME_MINUTES|TIME_SECONDS)); 
   com=com+StringFormat("                  Local time: %s\r\n",TimeToString(local_time,TIME_MINUTES|TIME_SECONDS)); 
   com=com+StringFormat("TimeTradeServer time: %s\r\n",TimeToString(trade_server_time,TIME_MINUTES|TIME_SECONDS)); 
   com=com+StringFormat(" EstimatedServer time: %s\r\n",TimeToString(calculated_server_time,TIME_MINUTES|TIME_SECONDS)); 
   
   com=com+StringFormat(" Opening time: %s\r\n", TimeToString(opening_time, TIME_MINUTES|TIME_SECONDS));
   com=com+StringFormat(" Closing time: %s\r\n", TimeToString(opening_time + PeriodSeconds(PERIOD_CURRENT), TIME_MINUTES|TIME_SECONDS));  
   com=com+StringFormat(" Remaining time: %s\r\n",TimeToString((opening_time + PeriodSeconds(PERIOD_CURRENT)) - trade_server_time,TIME_MINUTES|TIME_SECONDS));  
  
//--- display values of all counters on the chart 

   Comment(com);
}
//+------------------------------------------------------------------+
