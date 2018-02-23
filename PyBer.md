

```python
#Dependencies
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import csv

```


```python
#import csv city
city_data = "../HW5/city_data.csv"
city_read = pd.read_csv(city_data)
city_pd = pd.DataFrame(city_read, columns=["city", "driver_count", "type"])
city_pd.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>city</th>
      <th>driver_count</th>
      <th>type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Nguyenbury</td>
      <td>8</td>
      <td>Urban</td>
    </tr>
    <tr>
      <th>2</th>
      <td>East Douglas</td>
      <td>12</td>
      <td>Urban</td>
    </tr>
    <tr>
      <th>3</th>
      <td>West Dawnfurt</td>
      <td>34</td>
      <td>Urban</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Rodriguezburgh</td>
      <td>52</td>
      <td>Urban</td>
    </tr>
  </tbody>
</table>
</div>




```python
#import csv ride
ride_data = "../HW5/ride_data.csv"
ride_read = pd.read_csv(ride_data)
ride_pd = pd.DataFrame(ride_read, columns=["city", "date", "fare", "ride_id"])
ride_pd.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>city</th>
      <th>date</th>
      <th>fare</th>
      <th>ride_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Sarabury</td>
      <td>2016-01-16 13:49:27</td>
      <td>38.35</td>
      <td>5403689035038</td>
    </tr>
    <tr>
      <th>1</th>
      <td>South Roy</td>
      <td>2016-01-02 18:42:34</td>
      <td>17.49</td>
      <td>4036272335942</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Wiseborough</td>
      <td>2016-01-21 17:35:29</td>
      <td>44.18</td>
      <td>3645042422587</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Spencertown</td>
      <td>2016-07-31 14:53:22</td>
      <td>6.87</td>
      <td>2242596575892</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Nguyenbury</td>
      <td>2016-07-09 04:42:44</td>
      <td>6.28</td>
      <td>1543057793673</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Inner merge files

merge_city = pd.merge(city_pd, ride_pd, on="city", how='inner')
merge_city.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>city</th>
      <th>driver_count</th>
      <th>type</th>
      <th>date</th>
      <th>fare</th>
      <th>ride_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-08-19 04:27:52</td>
      <td>5.51</td>
      <td>6246006544795</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-04-17 06:59:50</td>
      <td>5.54</td>
      <td>7466473222333</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-05-04 15:06:07</td>
      <td>30.54</td>
      <td>2140501382736</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-01-25 20:44:56</td>
      <td>12.08</td>
      <td>1896987891309</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-08-09 18:19:47</td>
      <td>17.91</td>
      <td>8784212854829</td>
    </tr>
  </tbody>
</table>
</div>




```python
#having issues building pies and scatterplot, looking to type of data
merge_city.dtypes
```




    city             object
    driver_count      int64
    type             object
    date             object
    fare            float64
    ride_id           int64
    dtype: object




```python
#Changing fare to a numeric to attempt to solve pie and scatterplpt
merge_city['fare'] = pd.to_numeric(merge_city['fare'])
```


```python
#caculate the avg fare per city
city_group = merge_city.groupby(["city"])
city_group.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>city</th>
      <th>driver_count</th>
      <th>type</th>
      <th>date</th>
      <th>fare</th>
      <th>ride_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-08-19 04:27:52</td>
      <td>5.51</td>
      <td>6246006544795</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-04-17 06:59:50</td>
      <td>5.54</td>
      <td>7466473222333</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-05-04 15:06:07</td>
      <td>30.54</td>
      <td>2140501382736</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-01-25 20:44:56</td>
      <td>12.08</td>
      <td>1896987891309</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Kelseyland</td>
      <td>63</td>
      <td>Urban</td>
      <td>2016-08-09 18:19:47</td>
      <td>17.91</td>
      <td>8784212854829</td>
    </tr>
    <tr>
      <th>28</th>
      <td>Nguyenbury</td>
      <td>8</td>
      <td>Urban</td>
      <td>2016-07-09 04:42:44</td>
      <td>6.28</td>
      <td>1543057793673</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Nguyenbury</td>
      <td>8</td>
      <td>Urban</td>
      <td>2016-11-08 19:22:04</td>
      <td>19.49</td>
      <td>1702803950740</td>
    </tr>
    <tr>
      <th>30</th>
      <td>Nguyenbury</td>
      <td>8</td>
      <td>Urban</td>
      <td>2016-03-19 13:08:09</td>
      <td>35.07</td>
      <td>9198401002936</td>
    </tr>
    <tr>
      <th>31</th>
      <td>Nguyenbury</td>
      <td>8</td>
      <td>Urban</td>
      <td>2016-05-12 15:57:15</td>
      <td>41.63</td>
      <td>224683791660</td>
    </tr>
    <tr>
      <th>32</th>
      <td>Nguyenbury</td>
      <td>8</td>
      <td>Urban</td>
      <td>2016-04-07 06:59:51</td>
      <td>19.01</td>
      <td>4648481871830</td>
    </tr>
    <tr>
      <th>54</th>
      <td>East Douglas</td>
      <td>12</td>
      <td>Urban</td>
      <td>2016-10-01 19:07:00</td>
      <td>16.36</td>
      <td>8450340983211</td>
    </tr>
    <tr>
      <th>55</th>
      <td>East Douglas</td>
      <td>12</td>
      <td>Urban</td>
      <td>2016-07-19 07:42:04</td>
      <td>11.24</td>
      <td>8566233760392</td>
    </tr>
    <tr>
      <th>56</th>
      <td>East Douglas</td>
      <td>12</td>
      <td>Urban</td>
      <td>2016-09-20 02:40:41</td>
      <td>23.26</td>
      <td>825335145222</td>
    </tr>
    <tr>
      <th>57</th>
      <td>East Douglas</td>
      <td>12</td>
      <td>Urban</td>
      <td>2016-04-02 13:49:14</td>
      <td>28.17</td>
      <td>3800595642657</td>
    </tr>
    <tr>
      <th>58</th>
      <td>East Douglas</td>
      <td>12</td>
      <td>Urban</td>
      <td>2016-10-19 20:25:16</td>
      <td>28.18</td>
      <td>6204409645686</td>
    </tr>
    <tr>
      <th>76</th>
      <td>West Dawnfurt</td>
      <td>34</td>
      <td>Urban</td>
      <td>2016-07-24 15:18:57</td>
      <td>30.80</td>
      <td>3839329929610</td>
    </tr>
    <tr>
      <th>77</th>
      <td>West Dawnfurt</td>
      <td>34</td>
      <td>Urban</td>
      <td>2016-03-06 18:21:13</td>
      <td>28.26</td>
      <td>3899054595030</td>
    </tr>
    <tr>
      <th>78</th>
      <td>West Dawnfurt</td>
      <td>34</td>
      <td>Urban</td>
      <td>2016-09-18 18:24:17</td>
      <td>19.67</td>
      <td>2851656538564</td>
    </tr>
    <tr>
      <th>79</th>
      <td>West Dawnfurt</td>
      <td>34</td>
      <td>Urban</td>
      <td>2016-01-03 11:35:45</td>
      <td>6.69</td>
      <td>7455207171412</td>
    </tr>
    <tr>
      <th>80</th>
      <td>West Dawnfurt</td>
      <td>34</td>
      <td>Urban</td>
      <td>2016-09-25 16:35:54</td>
      <td>22.28</td>
      <td>9242784905015</td>
    </tr>
    <tr>
      <th>105</th>
      <td>Rodriguezburgh</td>
      <td>52</td>
      <td>Urban</td>
      <td>2016-09-05 05:20:39</td>
      <td>4.54</td>
      <td>9650770953139</td>
    </tr>
    <tr>
      <th>106</th>
      <td>Rodriguezburgh</td>
      <td>52</td>
      <td>Urban</td>
      <td>2016-11-21 10:41:56</td>
      <td>26.13</td>
      <td>6513545702246</td>
    </tr>
    <tr>
      <th>107</th>
      <td>Rodriguezburgh</td>
      <td>52</td>
      <td>Urban</td>
      <td>2016-05-22 21:34:07</td>
      <td>8.83</td>
      <td>5135321621391</td>
    </tr>
    <tr>
      <th>108</th>
      <td>Rodriguezburgh</td>
      <td>52</td>
      <td>Urban</td>
      <td>2016-10-07 11:09:50</td>
      <td>25.19</td>
      <td>7709877217148</td>
    </tr>
    <tr>
      <th>109</th>
      <td>Rodriguezburgh</td>
      <td>52</td>
      <td>Urban</td>
      <td>2016-06-11 21:01:35</td>
      <td>27.66</td>
      <td>6959463827218</td>
    </tr>
    <tr>
      <th>128</th>
      <td>South Josephville</td>
      <td>4</td>
      <td>Urban</td>
      <td>2016-06-01 05:15:38</td>
      <td>28.33</td>
      <td>7956832876432</td>
    </tr>
    <tr>
      <th>129</th>
      <td>South Josephville</td>
      <td>4</td>
      <td>Urban</td>
      <td>2016-10-06 03:53:57</td>
      <td>28.19</td>
      <td>2604125036913</td>
    </tr>
    <tr>
      <th>130</th>
      <td>South Josephville</td>
      <td>4</td>
      <td>Urban</td>
      <td>2016-03-11 23:05:39</td>
      <td>29.12</td>
      <td>7477161326509</td>
    </tr>
    <tr>
      <th>131</th>
      <td>South Josephville</td>
      <td>4</td>
      <td>Urban</td>
      <td>2016-03-24 18:38:25</td>
      <td>13.73</td>
      <td>1488440031973</td>
    </tr>
    <tr>
      <th>132</th>
      <td>South Josephville</td>
      <td>4</td>
      <td>Urban</td>
      <td>2016-08-28 04:52:03</td>
      <td>38.51</td>
      <td>4250063766740</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>2355</th>
      <td>Stevensport</td>
      <td>6</td>
      <td>Rural</td>
      <td>2016-02-22 02:45:07</td>
      <td>19.91</td>
      <td>808097865942</td>
    </tr>
    <tr>
      <th>2356</th>
      <td>North Whitney</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-04-01 21:21:37</td>
      <td>51.01</td>
      <td>612689673941</td>
    </tr>
    <tr>
      <th>2357</th>
      <td>North Whitney</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-04-26 09:35:48</td>
      <td>42.09</td>
      <td>9465134041656</td>
    </tr>
    <tr>
      <th>2358</th>
      <td>North Whitney</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-06-24 21:09:09</td>
      <td>50.03</td>
      <td>9224879345166</td>
    </tr>
    <tr>
      <th>2359</th>
      <td>North Whitney</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-06-10 18:27:03</td>
      <td>29.25</td>
      <td>4071225680519</td>
    </tr>
    <tr>
      <th>2360</th>
      <td>North Whitney</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-02-21 18:20:14</td>
      <td>42.01</td>
      <td>3306522110065</td>
    </tr>
    <tr>
      <th>2366</th>
      <td>East Stephen</td>
      <td>6</td>
      <td>Rural</td>
      <td>2016-02-16 11:58:06</td>
      <td>22.43</td>
      <td>8118042484039</td>
    </tr>
    <tr>
      <th>2367</th>
      <td>East Stephen</td>
      <td>6</td>
      <td>Rural</td>
      <td>2016-07-27 09:55:18</td>
      <td>41.64</td>
      <td>3154261826545</td>
    </tr>
    <tr>
      <th>2368</th>
      <td>East Stephen</td>
      <td>6</td>
      <td>Rural</td>
      <td>2016-07-11 01:21:31</td>
      <td>41.86</td>
      <td>1023430862078</td>
    </tr>
    <tr>
      <th>2369</th>
      <td>East Stephen</td>
      <td>6</td>
      <td>Rural</td>
      <td>2016-11-19 04:47:01</td>
      <td>43.84</td>
      <td>7366535419230</td>
    </tr>
    <tr>
      <th>2370</th>
      <td>East Stephen</td>
      <td>6</td>
      <td>Rural</td>
      <td>2016-05-23 12:55:48</td>
      <td>48.49</td>
      <td>9985496304508</td>
    </tr>
    <tr>
      <th>2376</th>
      <td>East Leslie</td>
      <td>9</td>
      <td>Rural</td>
      <td>2016-04-21 18:44:59</td>
      <td>19.26</td>
      <td>5836114186294</td>
    </tr>
    <tr>
      <th>2377</th>
      <td>East Leslie</td>
      <td>9</td>
      <td>Rural</td>
      <td>2016-04-13 04:30:56</td>
      <td>40.47</td>
      <td>7075058703398</td>
    </tr>
    <tr>
      <th>2378</th>
      <td>East Leslie</td>
      <td>9</td>
      <td>Rural</td>
      <td>2016-04-26 02:34:30</td>
      <td>45.80</td>
      <td>9402873395510</td>
    </tr>
    <tr>
      <th>2379</th>
      <td>East Leslie</td>
      <td>9</td>
      <td>Rural</td>
      <td>2016-04-05 18:53:16</td>
      <td>44.78</td>
      <td>6113138249150</td>
    </tr>
    <tr>
      <th>2380</th>
      <td>East Leslie</td>
      <td>9</td>
      <td>Rural</td>
      <td>2016-11-13 10:21:10</td>
      <td>15.71</td>
      <td>7275986542384</td>
    </tr>
    <tr>
      <th>2387</th>
      <td>Hernandezshire</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-02-20 08:17:32</td>
      <td>58.95</td>
      <td>3176534714830</td>
    </tr>
    <tr>
      <th>2388</th>
      <td>Hernandezshire</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-06-26 20:11:50</td>
      <td>28.78</td>
      <td>6382848462030</td>
    </tr>
    <tr>
      <th>2389</th>
      <td>Hernandezshire</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-01-24 00:21:35</td>
      <td>30.32</td>
      <td>7342649945759</td>
    </tr>
    <tr>
      <th>2390</th>
      <td>Hernandezshire</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-03-05 10:40:16</td>
      <td>23.35</td>
      <td>7443355895137</td>
    </tr>
    <tr>
      <th>2391</th>
      <td>Hernandezshire</td>
      <td>10</td>
      <td>Rural</td>
      <td>2016-04-11 04:44:50</td>
      <td>10.41</td>
      <td>9823290002445</td>
    </tr>
    <tr>
      <th>2396</th>
      <td>Horneland</td>
      <td>8</td>
      <td>Rural</td>
      <td>2016-07-19 10:07:33</td>
      <td>12.63</td>
      <td>8214498891817</td>
    </tr>
    <tr>
      <th>2397</th>
      <td>Horneland</td>
      <td>8</td>
      <td>Rural</td>
      <td>2016-03-22 21:22:20</td>
      <td>31.53</td>
      <td>1797785685674</td>
    </tr>
    <tr>
      <th>2398</th>
      <td>Horneland</td>
      <td>8</td>
      <td>Rural</td>
      <td>2016-01-26 09:38:17</td>
      <td>21.73</td>
      <td>5665544449606</td>
    </tr>
    <tr>
      <th>2399</th>
      <td>Horneland</td>
      <td>8</td>
      <td>Rural</td>
      <td>2016-03-25 02:05:42</td>
      <td>20.04</td>
      <td>5729327140644</td>
    </tr>
    <tr>
      <th>2400</th>
      <td>West Kevintown</td>
      <td>5</td>
      <td>Rural</td>
      <td>2016-11-27 20:12:58</td>
      <td>12.92</td>
      <td>6460741616450</td>
    </tr>
    <tr>
      <th>2401</th>
      <td>West Kevintown</td>
      <td>5</td>
      <td>Rural</td>
      <td>2016-02-19 01:42:58</td>
      <td>11.15</td>
      <td>8622534016726</td>
    </tr>
    <tr>
      <th>2402</th>
      <td>West Kevintown</td>
      <td>5</td>
      <td>Rural</td>
      <td>2016-03-11 09:03:43</td>
      <td>42.13</td>
      <td>4568909568268</td>
    </tr>
    <tr>
      <th>2403</th>
      <td>West Kevintown</td>
      <td>5</td>
      <td>Rural</td>
      <td>2016-06-25 08:04:12</td>
      <td>24.53</td>
      <td>8188407925972</td>
    </tr>
    <tr>
      <th>2404</th>
      <td>West Kevintown</td>
      <td>5</td>
      <td>Rural</td>
      <td>2016-07-24 13:41:23</td>
      <td>11.78</td>
      <td>2001192693573</td>
    </tr>
  </tbody>
</table>
<p>618 rows × 6 columns</p>
</div>




```python
#calculate average fare, numeric is code not working as expected
avg_fare = city_group['fare'].mean()
avg_fare.head()
```




    city
    Alvarezhaven    23.928710
    Alyssaberg      20.609615
    Anitamouth      37.315556
    Antoniomouth    23.625000
    Aprilchester    21.981579
    Name: fare, dtype: float64




```python
#total rides pero city
total_rides = city_group['city'].count()
total_rides.head()
```




    city
    Alvarezhaven    31
    Alyssaberg      26
    Anitamouth       9
    Antoniomouth    22
    Aprilchester    19
    Name: city, dtype: int64




```python
#total number of drivers per city
total_drivers = city_group['driver_count'].mean()
total_drivers.head()
```




    city
    Alvarezhaven    21
    Alyssaberg      67
    Anitamouth      16
    Antoniomouth    21
    Aprilchester    49
    Name: driver_count, dtype: int64




```python
#issues with data showing up in brackets, this could also be causing issues with the scatterplot
city_type = city_group['type'].unique()
city_type.head()

```




    city
    Alvarezhaven       [Urban]
    Alyssaberg         [Urban]
    Anitamouth      [Suburban]
    Antoniomouth       [Urban]
    Aprilchester       [Urban]
    Name: type, dtype: object




```python
#DataFrame of Summary
city_summary = pd.DataFrame({"AVG Fare/City":avg_fare,
                            "Rides/City":total_rides,
                            "Drivers/City":total_drivers,
                            "City Type":city_type})
city_summary.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>AVG Fare/City</th>
      <th>City Type</th>
      <th>Drivers/City</th>
      <th>Rides/City</th>
    </tr>
    <tr>
      <th>city</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Alvarezhaven</th>
      <td>23.928710</td>
      <td>[Urban]</td>
      <td>21</td>
      <td>31</td>
    </tr>
    <tr>
      <th>Alyssaberg</th>
      <td>20.609615</td>
      <td>[Urban]</td>
      <td>67</td>
      <td>26</td>
    </tr>
    <tr>
      <th>Anitamouth</th>
      <td>37.315556</td>
      <td>[Suburban]</td>
      <td>16</td>
      <td>9</td>
    </tr>
    <tr>
      <th>Antoniomouth</th>
      <td>23.625000</td>
      <td>[Urban]</td>
      <td>21</td>
      <td>22</td>
    </tr>
    <tr>
      <th>Aprilchester</th>
      <td>21.981579</td>
      <td>[Urban]</td>
      <td>49</td>
      <td>19</td>
    </tr>
  </tbody>
</table>
</div>




```python
#cannot build a scatterplot, but this would be my idea as a start.
x = np.arange(total_rides)
y = np.arange(avg_fare)
z = np.city_type

plt.scatter("x", "y","z", marker="o", color='red')
plt.show()
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-22-9aed9aa03671> in <module>()
    ----> 1 x = np.arange(total_rides)
          2 y = np.arange(avg_fare)
          3 z = np.city_type
          4 
          5 plt.scatter("x", "y","z", marker="o", color='red')


    ~/anaconda3/envs/PythonData/lib/python3.6/site-packages/pandas/core/series.py in wrapper(self)
         95             return converter(self.iloc[0])
         96         raise TypeError("cannot convert the series to "
    ---> 97                         "{0}".format(str(converter)))
         98 
         99     return wrapper


    TypeError: cannot convert the series to <class 'float'>

