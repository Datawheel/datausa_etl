import pandas as pd
import requests
from helpers.get_dataframe import get_dataframe


def compute_totals(frame):
    names = [x.replace("_male", "").replace("_female", "") for x in frame.columns if x not in ["name", "Total:", "Male:", "Female:"] and "_moe" not in x]
    uniq = set(names)
    for c in uniq:
        frame[c + "_total"] = frame[c+"_male"] + frame[c+"_female"]
        frame[c + "_moe_total"] = (frame[c+"_moe_male"] ** 2 + frame[c+"_moe_female"] ** 2) ** 0.5
    return frame

if __name__ == '__main__':
    # df = get_dataframe(geo_names=True)
    # print "Top 10 most populous states"
    # print df.sort('B01001001',ascending=False)['B01001001'].head(10)
    
    acs_release='acs2010_5yr'
    state_df = get_dataframe(tables='C24020', geoids='310|01000US',col_names=True, geo_names=True, include_moe=True,release=acs_release)


    print state_df.columns
    print state_df[["name", "Total:"]]