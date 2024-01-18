import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle

model=pickle.load(open('model.pkl','rb'))

print(model.predict([[11,8,8]]))