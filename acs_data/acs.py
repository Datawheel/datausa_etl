import os, sys, time, click
import pandas as pd
from helpers.get_dataframe import get_dataframe

from sqlalchemy import create_engine
db_user = os.getenv('datausa_etl_user')
db_name = os.getenv('datausa_etl_db')
engine = create_engine('postgresql://{}@localhost:5432/{}'.format(db_user, db_name))

def compute_totals(df):
    names = [x.replace("_male", "").replace("_female", "") for x in df.columns if x not in ["name", "Total:", "Male:", "Female:"] and "_moe" not in x]
    uniq = []
    for name in names:
        if name not in uniq: uniq.append(name)
    for c in uniq:
        df[c + "_total"] = df[c+"_male"] + df[c+"_female"]
        df[c + "_moe_total"] = (df[c+"_moe_male"] ** 2 + df[c+"_moe_female"] ** 2) ** 0.5
    return df

def format_dataframe(df, indicator):
    cols = df.columns.tolist()
    # cols = map(lambda c: c.replace(":", ""), cols)
    
    '''Special cleaning for langs'''
    if indicator == 'B16001':
        unwanted_cols = filter(lambda c: "Speak English" in c, cols)
        df = df.drop(unwanted_cols, axis=1)
        cols = df.columns.tolist()
    
    '''Special cleaning for poverty'''
    if indicator == 'B17001':
        cols = filter(lambda c: "income" not in c.lower() and "total" not in c.lower(), cols)
        df = df.drop(cols, axis=1)
        cols = map(lambda c: c.replace("_female", ""), df.columns.tolist())
        df.columns = cols
        cols = df.columns.tolist()
    
    '''Special cleaning for means of transportation'''
    if indicator == 'B08141':
        unwanted_cols = filter(lambda c: "available" in c, cols)
        df = df.drop(unwanted_cols, axis=1)
        cols = df.columns.tolist()
    
    '''Special cleaning for vehicles per household'''
    if indicator == 'B08201':
        df = df.iloc[:, :12]
        cols = df.columns.tolist()
    
    '''Special cleaning for age distribution'''
    if indicator == 'B01001':
        df = compute_totals(df)
        cols = df.columns.tolist()
        unwanted_cols = filter(lambda c: "male" in c.lower(), cols)
        df = df.drop(unwanted_cols, axis=1)
        cols = df.columns.tolist()
    
    return df

@click.command()
@click.option('-i', '--indicator', required=True)
@click.option('-s', '--sumlevel', required=True)
@click.option('-y', '--year', default=2010, type=int)
@click.option('-e', '--year_est', default=5, type=int)
def add_new_data(indicator, sumlevel, year, year_est):
    print "Indicator:", indicator
    print "Sumlevel:", sumlevel
    
    geoids = '{}|01000US'.format(sumlevel)
    acs_release = 'acs{}_{}yr'.format(year, year_est)
    print "Release:", acs_release
    df = get_dataframe(indicator.upper(), geoids=geoids, include_moe=True, release=acs_release)
    if df.empty:
        sys.exit("No data for this sumlevel")
    
    df = format_dataframe(df, indicator)
    # sys.exit(df.head())
    # sys.exit(df.columns.tolist())
    
    cols = []
    for i, c in enumerate(df.columns.tolist()):
        col = "{}_{}".format(indicator, i/2)
        if i%2:
            col = col + "_moe"
        cols.append(col)
    df.columns = cols
    
    df["year"] = year
    df["year_est"] = year_est
    df["sumlevel"] = sumlevel
    
    df = df.reset_index()
    df = df.rename(columns={'index': 'geoid'})
    df.columns = map(str.lower, df.columns.tolist())
    
    df.to_sql(indicator.lower(), engine, schema='acs', if_exists='append', index=False)
    
if __name__ == '__main__':
    add_new_data()
