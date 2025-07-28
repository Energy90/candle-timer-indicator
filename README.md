# candle-timer-indicator

### Description

The **Candle Timer Indicator** for MetaTrader 5 (MT5) is a powerful tool designed to give traders precise time-related information directly on their charts. It helps you keep track of various important timestamps, ensuring you're always in sync with market movements and candle cycles.

---

### Features
* This indicator provides the following key time metrics:
* **Indicator Start Time:** Shows the local time your indicator began running.
* **Local Machine Time:** Displays the current local time from your computer.
* **Broker Server Time:** Displays the current time from your broker's server.
* **Estimated Server Time:** Provides an estimate of the current server time, useful for anticipating updates.
* **Current Candle Open Time:** Shows the exact opening time of the active candlestick on your chart's current timeframe.
* **Current Candle Close Time:** Displays the projected closing time of the active candlestick on your chart's current timeframe.
* **Candle Remaining Time:** Counts down the time left until the current candlestick closes.

**Note:** This indicator is designed for intraday timeframes and is not compatible with daily, weekly, or monthly timeframes.

---


### How to use it?

Follow these steps to quickly install and start using the Candle Timer Indicator:

1. Download: Obtain the `candle-timer.mq5` source code file.
2. Create Folder: In your MetaTrader 5 `MQL5` directory, create a new folder (e.g., `Indicators/Custom`).
3. Place File: Move the downloaded `candle-timer.mq5` file into this new folder.
4. Open MetaEditor: Launch your MetaEditor (you can access it from MetaTrader 5 by pressing `F4`).
5. Compile:
    * Navigate to the folder where you placed the `.mq5` file.
    * Drag and drop the `candle-timer.mq5` file into the MetaEditor.
    * Click the Compile button (or press `F7`). This will create an executable .ex5 file in the same folder.
6. Refresh Indicators: Go back to your MetaTrader 5 terminal. In the Navigator panel, right-click on "Indicators" and select "Refresh".
7. Attach to Chart:
    * Expand the "Indicators" list in the Navigator panel.
    * Locate the "Candle Timer Indicator" (it will be listed under your custom folder if you created one).
    * Drag and drop the Candle Timer Indicator onto any open chart.

---

### Expected Output
Once successfully applied, you will see the time information displayed on the top-left corner of your chart, similar to the following:

```
Candle Timer Indicator
Local Time: 20:50:02
Server Time: 18:50:02
Estimated Server Time: 18:50:02
Open Time: 18:45:00
Close Time: 19:00:00
Remaining Time: 00:09:58 
```
### Image
[click here](candle-timer-indicator.png)