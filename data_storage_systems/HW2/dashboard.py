# Import packages
from dash import Dash, html, dash_table, dcc
import plotly.express as px

import pandas as pd
import plotly.express as px
import sqlite3

# Get data
con = sqlite3.connect("./data/Transactions.db") # Подключимся к базе данных Transactions.db
cur = con.cursor() # Инициируем курсор
query_f = '''
SELECT date(TX_DATETIME) as TRANSACTION_DT,
       SUM(TX_AMOUNT) AS TOTAL_TX_AMOUNT
FROM transaction_bd
GROUP BY TRANSACTION_DT
ORDER BY TRANSACTION_DT ASC
'''
df_f = pd.read_sql(query_f, con) # Выгрузим результаты запроса в датафрейм
con.close() # Закроем подключение

# Initialize the app
app = Dash(__name__)

fig_bar = px.bar(
    df_f,
    x='TRANSACTION_DT',
    y='TOTAL_TX_AMOUNT',
    title="Daily Amount of Transctions Dynamic",
    labels={'TRANSACTION_DT': 'Date', 'TOTAL_TX_AMOUNT': 'Amount of transactions'}
    )

fig_hist = px.histogram(
    df_f,
    x="TOTAL_TX_AMOUNT",
    title="Daily Amount of Transctions Distribution",
    labels={'TOTAL_TX_AMOUNT': 'Amount of transactions'}
    )

# App layout
app.layout = html.Div([
    html.H1('HW2 Dash App with Graph and Histogram'),
    html.Div('Author: Polina Kudryavtseva'),
    # dash_table.DataTable(data=df.to_dict('records'), page_size=10),
    dcc.Graph(figure=fig_bar),
    dcc.Graph(figure=fig_hist)
    ])

# Run the app
if __name__ == '__main__':
    app.run_server(debug=True)