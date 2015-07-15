import sys, time, click
import pandas as pd
from helpers.get_dataframe import get_dataframe

from sqlalchemy import create_engine
engine = create_engine('postgresql://zeus@localhost:5432/census_new')

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
        
    
    # cols_no_moe = filter(lambda c: "_moe" not in c, cols)
    # cols_moe = filter(lambda c: "_moe" in c, cols)
    
    # df_no_moe = df.drop(cols_moe, axis=1)
    # df_moe = df.drop(cols_no_moe, axis=1)
    
    # print df.columns.tolist()
    
    # df_moe.columns = cols_no_moe
    #
    # df_moe = df_moe.stack()
    # df_moe.name = 'val_moe'
    # df_no_moe = df_no_moe.stack()
    # df_no_moe.name = 'val'
    #
    # return pd.concat([df_no_moe, df_moe], axis=1)
    
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
    
    # start = time.time()
    #
    # for indicator in indicators:
    #     indicator_df = pd.DataFrame()
    #     for sumlevel in sumlevels:
    #         sumlevel_start = time.time()
    #
    #         geoids = '{}|01000US'.format(sumlevel)
    #         df = get_dataframe(indicator, geoids=geoids, include_moe=True)
    #         if df.empty:
    #             print "No data for sumlevel: {}. Skipping...".format(sumlevel)
    #             continue
    #         df = format_dataframe(df, indicator)
    #         # print df.loc[pd.IndexSlice[:,"Walked:"],"val"].order()
    #         # print new_df.loc[idx[:,"Russia"],"val"].order()
    #         # indicator_df = pd.concat([indicator_df, df])
    #
    #         df = df.reset_index()
    #         df.columns = ['geoid', 'indicator_filter', 'val', 'val_moe']
    #         df["year"] = 2010
    #         df["indicator"] = indicator
    #         df["sumlevel"] = sumlevel
    #         df = df[['year', 'geoid', 'sumlevel', 'indicator', 'indicator_filter', 'val', 'val_moe']]
    #         df.to_sql('acs', engine, schema='data', if_exists='append', index=False)
    #
    #         run_time = time.time() - sumlevel_start
    #         m, s = divmod(run_time, 60)
    #         h, m = divmod(m, 60)
    #         print "%s sumlevel runtime: %d:%02d:%02d" % (sumlevel, h, m, s)
    #
    # total_run_time = (time.time() - start) / 60
    # print; print;
    # print "Total runtime: {0} minutes".format(int(total_run_time))
    # print; print;