for year in 2010; do
    for year_est in 1; do
        for sumlevel in 040 050 310 160 860 795 140; do
          for indicator in B05006 B16001 B21002 B17001 B08141 B08201 B25003 B05001 B01001 B19301 B19001; do
              python acs_data/acs.py --indicator=$indicator --sumlevel=$sumlevel --year=$year --year_est=$year_est
          done
        done
    done
done