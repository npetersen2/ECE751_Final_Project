import pandas as pd
from math import log10, sqrt
#import cv2
import numpy as np

    
df = pd.read_csv (r'values_approx.csv')

def PSNR(df):
    mse = np.mean((df.iloc[:, 0] - df.iloc[:, 1]) ** 2)
    if(mse == 0):  # MSE is zero means no noise is present in the signal .
                  # Therefore PSNR have no importance.
        return 100
    max_pixel = 65025.0
    psnr = 20 * log10(max_pixel / sqrt(mse))
    return psnr
  
def main():
    value = PSNR(df)
    print(f"PSNR value is {value} dB")
       
if __name__ == "__main__":
    main()

print (df)