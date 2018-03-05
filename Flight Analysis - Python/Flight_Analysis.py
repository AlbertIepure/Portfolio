# -*- coding: utf-8 -*-
"""
Created on Sun Dec  3 22:53:45 2017

@author: aiepure
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import gc

frame = pd.read_csv('2008.csv')

#frame.ArrDelay.describe()
#frame.describe(include='all')

frame0 = frame.drop_duplicates()

#first drop columns 'CancellationCode','CarrierDelay','WeatherDelay','NASDelay','SecurityDelay','LateAircraftDelay'
frame1 = frame0.drop(['CancellationCode','CarrierDelay','WeatherDelay','NASDelay','SecurityDelay','LateAircraftDelay'], axis = 1)
#frame1.count() #counts the values which are not NANs

frame1_cleaned = frame1.dropna() #drop all rows that have any NaN values
#frame1_cleaned[['DepTime','CRSDepTime','ArrTime','CRSArrTime','ActualElapsedTime','CRSElapsedTime','AirTime','ArrDelay','DepDelay','Distance','TaxiIn','TaxiOut','Cancelled','Diverted']].describe(include='all')
# now use
#frame1_cleaned[['DepTime','CRSDepTime','ArrTime','CRSArrTime','ActualElapsedTime','CRSElapsedTime','AirTime','ArrDelay','DepDelay','Distance','TaxiIn','TaxiOut']].describe(include='all')
#frame1_cleaned.DepTime.describe()

del frame,frame1
gc.collect()


#new_frame = frame1[~np.isnan(frame1.ArrDelay)] 

#removes the rows that contain null values.np.isnan finds the rows where the values are null or nan and the ~ sign negates that

nbins = 30

plt.figure()
plt.hist(frame1_cleaned.ArrDelay, nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('ArrDelay')

plt.figure()
plt.boxplot(frame1_cleaned.ArrDelay)
plt.ylabel('Minutes')
plt.xlabel('ArrDelay')

plt.hist(frame1_cleaned.DepDelay[frame1_cleaned.ArrDelay <= 15], nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('DepDelay when ArrDelay <= 15')

plt.hist(frame1_cleaned.DepDelay[frame1_cleaned.ArrDelay > 15], nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('DepDelay when ArrDelay > 15')

plt.hist(frame1_cleaned.CRSArrTime[frame1_cleaned.ArrDelay <= 15], nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('CRSArrTime when ArrDelay <= 15')

plt.hist(frame1_cleaned.CRSArrTime[frame1_cleaned.ArrDelay > 15], nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('CRSArrTime when ArrDelay > 15')

plt.hist(frame1_cleaned.Month[frame1_cleaned.ArrDelay <= 15], nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('Month when ArrDelay <= 15')

plt.hist(frame1_cleaned.Month[frame1_cleaned.ArrDelay > 15], nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('Month when ArrDelay > 15')

plt.hist(frame1_cleaned.TaxiIn[frame1_cleaned.ArrDelay <= 15], nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('TaxiIn when ArrDelay <= 15')

plt.hist(frame1_cleaned.TaxiIn[frame1_cleaned.ArrDelay > 15], nbins, alpha=1)
plt.ylabel('Frequency')
plt.xlabel('TaxiIn when ArrDelay > 15')


plt.scatter(frame1_cleaned.DepDelay[frame1_cleaned.ArrDelay <= 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame1_cleaned.DepDelay[frame1_cleaned.ArrDelay > 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('DepDelay')
plt.show

plt.scatter(frame1_cleaned.CRSArrTime[frame1_cleaned.ArrDelay <= 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame1_cleaned.CRSArrTime[frame1_cleaned.ArrDelay > 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('CRSArrTime')
plt.show

plt.scatter(frame1_cleaned.Month[frame1_cleaned.ArrDelay <= 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame1_cleaned.Month[frame1_cleaned.ArrDelay > 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('Month')
plt.show

plt.scatter(frame1_cleaned.Distance[frame1_cleaned.ArrDelay <= 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame1_cleaned.Distance[frame1_cleaned.ArrDelay > 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('Distance')
plt.show

plt.scatter(frame1_cleaned.TaxiIn[frame1_cleaned.ArrDelay <= 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame1_cleaned.TaxiIn[frame1_cleaned.ArrDelay > 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('TaxiIn')
plt.show

plt.scatter(frame1_cleaned.TaxiOut[frame1_cleaned.ArrDelay <= 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame1_cleaned.TaxiOut[frame1_cleaned.ArrDelay > 15],frame1_cleaned.ArrDelay[frame1_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('TaxiOut')
plt.show



frame2 = frame0.drop(['CancellationCode'], axis = 1)
frame2_cleaned = frame2.dropna()

plt.scatter(frame2_cleaned.CarrierDelay[frame2_cleaned.ArrDelay <= 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame2_cleaned.CarrierDelay[frame2_cleaned.ArrDelay > 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('CarrierDelay')
plt.show

plt.scatter(frame2_cleaned.WeatherDelay[frame2_cleaned.ArrDelay <= 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame2_cleaned.WeatherDelay[frame2_cleaned.ArrDelay > 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('WeatherDelay')
plt.show

plt.scatter(frame2_cleaned.NASDelay[frame2_cleaned.ArrDelay <= 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame2_cleaned.NASDelay[frame2_cleaned.ArrDelay > 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('NASDelay')
plt.show

plt.scatter(frame2_cleaned.SecurityDelay[frame2_cleaned.ArrDelay <= 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame2_cleaned.SecurityDelay[frame2_cleaned.ArrDelay > 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('SecurityDelay')
plt.show

plt.scatter(frame2_cleaned.LateAircraftDelay[frame2_cleaned.ArrDelay <= 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay <= 15],color='red')
plt.scatter(frame2_cleaned.LateAircraftDelay[frame2_cleaned.ArrDelay > 15],frame2_cleaned.ArrDelay[frame2_cleaned.ArrDelay > 15],color='blue')
plt.ylabel('ArrDelay')
plt.xlabel('LateAircraftDelay')
plt.show