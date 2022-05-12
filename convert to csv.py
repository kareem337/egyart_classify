import pickle as pkl
import pandas as pd
with open(r'C:\Users\hp\Downloads\hist_loss24.p', "rb") as f:
    object = pkl.load(f)
    
df = pd.DataFrame(object)
df.to_csv(r'file1234.csv')
print("converted!")