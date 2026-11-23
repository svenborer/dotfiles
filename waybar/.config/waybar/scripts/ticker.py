import sys
import json
import yfinance as yf
import pandas as pd

def get_waybar_format(tickers):
    if not tickers:
        return

    closing_prices = {}
    for symbol in tickers:
        try:
            # We only need the last 2 days to get the most recent daily change
            ticker = yf.Ticker(symbol)
            hist = ticker.history(period="2d")
            if not hist.empty and len(hist) >= 2:
                closing_prices[symbol.upper()] = hist['Close']
        except Exception:
            continue

    if not closing_prices:
        # Silently fail or show empty so Waybar doesn't crash
        print(json.dumps({"text": "No Data", "class": "none"}))
        return

    # Align data and calculate the percentage change for the final day
    df = pd.DataFrame(closing_prices)
    daily_changes = df.pct_change().iloc[-1] * 100
    avg_change = daily_changes.mean()

    # Determine status class for Waybar styling (no signs, per your preference)
    abs_val = abs(avg_change)
    if avg_change > 0:
        status_class = "positive"
        text_output = f"{abs_val:.2f}%"
    elif avg_change < 0:
        status_class = "negative"
        text_output = f"-{abs_val:.2f}%"
    else:
        status_class = "neutral"
        text_output = f"{abs_val:.2f}%"

    # Waybar expects a JSON object with at least a 'text' key
    output = {
        "text": text_output,
        "tooltip": f"{', '.join(closing_prices.keys())} Daily Change",
        "class": status_class
    }
    
    print(json.dumps(output))

if __name__ == "__main__":
    # Pass your tickers here. Defaults to ZURN.SW and NESN.SW if none given
    user_args = sys.argv[1:] if len(sys.argv) > 1 else ["VT", "VWRL.SW"]
    get_waybar_format(user_args)