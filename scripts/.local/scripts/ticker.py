import sys
import yfinance as yf

def get_daily_change(ticker_symbol):
    try:
        # Fetch the last 2 days of market data
        ticker = yf.Ticker(ticker_symbol.upper())
        hist = ticker.history(period="2d")

        if len(hist) < 2:
            print(f"Not enough data found for ticker '{ticker_symbol}'.")
            return

        # Get closing prices
        prev_close = hist['Close'].iloc[0]
        current_close = hist['Close'].iloc[1]

        # Calculate daily percentage change
        pct_change = ((current_close - prev_close) / prev_close) * 100

        print(f"{ticker_symbol.upper()} {pct_change:.2f}%")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    # Fallback to S&P 500 ETF (SPY) if no argument is passed
    symbol = sys.argv[1] if len(sys.argv) > 1 else "VWRL.SW"
    get_daily_change(symbol)
