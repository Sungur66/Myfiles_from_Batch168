import numpy as np
import pandas as pd
import pickle

dataset=pd.read_csv('hiring.csv')

print (dataset)

dataset['experience'].fillna(0, inplace=True)

dataset['test_score'].fillna(dataset['test_score'].mean(), inplace=True)
dataset['test_score']=dataset["test_score"].astype("int")

print (dataset)


x=dataset.iloc[:, :3]

def convert_to_int(word):
    word_dict = {'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6, 'seven': 7, 'eight': 8,
                 'nine': 9, 'ten': 10, 'eleven': 11, 'twelve': 12, 'zero': 0}
    if word.isdigit():
        return int(word)
    else:
        return word_dict[word.lower()]


x['experience'] = x['experience'].apply(lambda x: convert_to_int(x))
y = dataset.iloc[:, -1]

from sklearn.linear_model import LinearRegression

regressor = LinearRegression()
regressor.fit(x,y)
print (regressor.score(x,y))

degerler=np.array([[11,8, 8]])


pickle.dump(regressor, open('model.pkl', 'wb'))