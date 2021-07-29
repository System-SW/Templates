# create Line Graph with only one data series
# six other line types are available

# file name of the graph
EPSFILE="CDF_OCZ_Ext4_WR_DIRECT_4G_1M_none.eps"

# data file to generate CDF
DATAFILE="X25M_btrfs_none_sydi_seq_1M_4G.data"

# title of the CDF
GRAPHTITLE="X25M (btrfs): 1MB WR - 4GB File , SD"

# Legend
LEGEND="{/=28 Record Size 1MB}"

# Label of x-axis
XLABEL="Sequence of 1MB WR Operation"

# Label of y-axis
YLABEL="Latency (usec)"

# template for CDF
load "Line.template"

