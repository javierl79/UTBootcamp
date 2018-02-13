

```python
#Dependencies
import pandas as pd
import numpy as np
import os
import sys
```


```python
#Load in json
json_path = "../HeroesOfPymoli/purchase_data.json"
purchase_df = pd.read_json(json_path)

#Inspect Column names
purchase_df.columns
```




    Index(['Age', 'Gender', 'Item ID', 'Item Name', 'Price', 'SN'], dtype='object')




```python
# view data sample
purchase_df
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
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
    </tr>
    <tr>
      <th>5</th>
      <td>20</td>
      <td>Male</td>
      <td>10</td>
      <td>Sleepwalker</td>
      <td>1.73</td>
      <td>Tanimnya91</td>
    </tr>
    <tr>
      <th>6</th>
      <td>20</td>
      <td>Male</td>
      <td>153</td>
      <td>Mercenary Sabre</td>
      <td>4.57</td>
      <td>Undjaskla97</td>
    </tr>
    <tr>
      <th>7</th>
      <td>29</td>
      <td>Female</td>
      <td>169</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>3.32</td>
      <td>Iathenudil29</td>
    </tr>
    <tr>
      <th>8</th>
      <td>25</td>
      <td>Male</td>
      <td>118</td>
      <td>Ghost Reaver, Longsword of Magic</td>
      <td>2.77</td>
      <td>Sondenasta63</td>
    </tr>
    <tr>
      <th>9</th>
      <td>31</td>
      <td>Male</td>
      <td>99</td>
      <td>Expiration, Warscythe Of Lost Worlds</td>
      <td>4.53</td>
      <td>Hilaerin92</td>
    </tr>
    <tr>
      <th>10</th>
      <td>24</td>
      <td>Male</td>
      <td>57</td>
      <td>Despair, Favor of Due Diligence</td>
      <td>3.81</td>
      <td>Chamosia29</td>
    </tr>
    <tr>
      <th>11</th>
      <td>20</td>
      <td>Male</td>
      <td>47</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>1.55</td>
      <td>Sally64</td>
    </tr>
    <tr>
      <th>12</th>
      <td>30</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Iskossa88</td>
    </tr>
    <tr>
      <th>13</th>
      <td>23</td>
      <td>Male</td>
      <td>77</td>
      <td>Piety, Guardian of Riddles</td>
      <td>3.68</td>
      <td>Seorithstilis90</td>
    </tr>
    <tr>
      <th>14</th>
      <td>40</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Sundast29</td>
    </tr>
    <tr>
      <th>15</th>
      <td>21</td>
      <td>Male</td>
      <td>96</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>4.77</td>
      <td>Haellysu29</td>
    </tr>
    <tr>
      <th>16</th>
      <td>22</td>
      <td>Female</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Sundista85</td>
    </tr>
    <tr>
      <th>17</th>
      <td>22</td>
      <td>Female</td>
      <td>59</td>
      <td>Lightning, Etcher of the King</td>
      <td>1.65</td>
      <td>Aenarap34</td>
    </tr>
    <tr>
      <th>18</th>
      <td>28</td>
      <td>Male</td>
      <td>91</td>
      <td>Celeste</td>
      <td>3.71</td>
      <td>Iskista88</td>
    </tr>
    <tr>
      <th>19</th>
      <td>31</td>
      <td>Male</td>
      <td>177</td>
      <td>Winterthorn, Defender of Shifting Worlds</td>
      <td>4.89</td>
      <td>Assossa43</td>
    </tr>
    <tr>
      <th>20</th>
      <td>24</td>
      <td>Male</td>
      <td>78</td>
      <td>Glimmer, Ender of the Moon</td>
      <td>2.33</td>
      <td>Irith83</td>
    </tr>
    <tr>
      <th>21</th>
      <td>15</td>
      <td>Male</td>
      <td>3</td>
      <td>Phantomlight</td>
      <td>1.79</td>
      <td>Iaralrgue74</td>
    </tr>
    <tr>
      <th>22</th>
      <td>11</td>
      <td>Female</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Deural48</td>
    </tr>
    <tr>
      <th>23</th>
      <td>19</td>
      <td>Male</td>
      <td>183</td>
      <td>Dragon's Greatsword</td>
      <td>2.36</td>
      <td>Chanosia65</td>
    </tr>
    <tr>
      <th>24</th>
      <td>11</td>
      <td>Male</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>1.96</td>
      <td>Qarwen67</td>
    </tr>
    <tr>
      <th>25</th>
      <td>21</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Idai61</td>
    </tr>
    <tr>
      <th>26</th>
      <td>29</td>
      <td>Male</td>
      <td>132</td>
      <td>Persuasion</td>
      <td>3.90</td>
      <td>Aerithllora36</td>
    </tr>
    <tr>
      <th>27</th>
      <td>34</td>
      <td>Male</td>
      <td>106</td>
      <td>Crying Steel Sickle</td>
      <td>2.29</td>
      <td>Assastnya25</td>
    </tr>
    <tr>
      <th>28</th>
      <td>15</td>
      <td>Male</td>
      <td>49</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>4.23</td>
      <td>Ilariarin45</td>
    </tr>
    <tr>
      <th>29</th>
      <td>16</td>
      <td>Female</td>
      <td>45</td>
      <td>Glinting Glass Edge</td>
      <td>2.46</td>
      <td>Phaedai25</td>
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
      <th>750</th>
      <td>23</td>
      <td>Male</td>
      <td>86</td>
      <td>Stormfury Lantern</td>
      <td>1.28</td>
      <td>Eollym91</td>
    </tr>
    <tr>
      <th>751</th>
      <td>26</td>
      <td>Female</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>1.88</td>
      <td>Lisjasksda68</td>
    </tr>
    <tr>
      <th>752</th>
      <td>15</td>
      <td>Female</td>
      <td>116</td>
      <td>Renewed Skeletal Katana</td>
      <td>2.37</td>
      <td>Yalostiphos68</td>
    </tr>
    <tr>
      <th>753</th>
      <td>20</td>
      <td>Male</td>
      <td>4</td>
      <td>Bloodlord's Fetish</td>
      <td>2.28</td>
      <td>Thryallym62</td>
    </tr>
    <tr>
      <th>754</th>
      <td>31</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Sondastan54</td>
    </tr>
    <tr>
      <th>755</th>
      <td>22</td>
      <td>Female</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>1.88</td>
      <td>Ailaesuir66</td>
    </tr>
    <tr>
      <th>756</th>
      <td>22</td>
      <td>Male</td>
      <td>6</td>
      <td>Rusty Skull</td>
      <td>1.20</td>
      <td>Siasri67</td>
    </tr>
    <tr>
      <th>757</th>
      <td>35</td>
      <td>Male</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>2.52</td>
      <td>Seosri62</td>
    </tr>
    <tr>
      <th>758</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Ryastycal90</td>
    </tr>
    <tr>
      <th>759</th>
      <td>19</td>
      <td>Male</td>
      <td>87</td>
      <td>Deluge, Edge of the West</td>
      <td>2.20</td>
      <td>Chanirrasta87</td>
    </tr>
    <tr>
      <th>760</th>
      <td>29</td>
      <td>Male</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>4.06</td>
      <td>Aerithllora36</td>
    </tr>
    <tr>
      <th>761</th>
      <td>28</td>
      <td>Male</td>
      <td>175</td>
      <td>Woeful Adamantite Claymore</td>
      <td>1.24</td>
      <td>Raeduerin33</td>
    </tr>
    <tr>
      <th>762</th>
      <td>36</td>
      <td>Male</td>
      <td>52</td>
      <td>Hatred</td>
      <td>4.39</td>
      <td>Lisosiast26</td>
    </tr>
    <tr>
      <th>763</th>
      <td>27</td>
      <td>Other / Non-Disclosed</td>
      <td>48</td>
      <td>Rage, Legacy of the Lone Victor</td>
      <td>4.32</td>
      <td>Eurisuru25</td>
    </tr>
    <tr>
      <th>764</th>
      <td>25</td>
      <td>Male</td>
      <td>70</td>
      <td>Hope's End</td>
      <td>3.89</td>
      <td>Assassasda84</td>
    </tr>
    <tr>
      <th>765</th>
      <td>15</td>
      <td>Male</td>
      <td>13</td>
      <td>Serenity</td>
      <td>1.49</td>
      <td>Aerithnucal56</td>
    </tr>
    <tr>
      <th>766</th>
      <td>22</td>
      <td>Female</td>
      <td>84</td>
      <td>Arcane Gem</td>
      <td>2.23</td>
      <td>Nitherian58</td>
    </tr>
    <tr>
      <th>767</th>
      <td>20</td>
      <td>Male</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>1.21</td>
      <td>Hailaphos89</td>
    </tr>
    <tr>
      <th>768</th>
      <td>21</td>
      <td>Male</td>
      <td>158</td>
      <td>Darkheart, Butcher of the Champion</td>
      <td>3.56</td>
      <td>Chamucosda93</td>
    </tr>
    <tr>
      <th>769</th>
      <td>24</td>
      <td>Male</td>
      <td>73</td>
      <td>Ritual Mace</td>
      <td>3.74</td>
      <td>Frichilsasya78</td>
    </tr>
    <tr>
      <th>770</th>
      <td>22</td>
      <td>Male</td>
      <td>141</td>
      <td>Persuasion</td>
      <td>3.27</td>
      <td>Aenasu69</td>
    </tr>
    <tr>
      <th>771</th>
      <td>24</td>
      <td>Male</td>
      <td>25</td>
      <td>Hero Cane</td>
      <td>1.03</td>
      <td>Lassista97</td>
    </tr>
    <tr>
      <th>772</th>
      <td>15</td>
      <td>Male</td>
      <td>31</td>
      <td>Trickster</td>
      <td>2.07</td>
      <td>Sidap51</td>
    </tr>
    <tr>
      <th>773</th>
      <td>21</td>
      <td>Male</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>2.46</td>
      <td>Chamadarsda63</td>
    </tr>
    <tr>
      <th>774</th>
      <td>24</td>
      <td>Male</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>1.14</td>
      <td>Lassassast73</td>
    </tr>
    <tr>
      <th>775</th>
      <td>22</td>
      <td>Male</td>
      <td>98</td>
      <td>Deadline, Voice Of Subtlety</td>
      <td>3.62</td>
      <td>Eural50</td>
    </tr>
    <tr>
      <th>776</th>
      <td>14</td>
      <td>Male</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>1.36</td>
      <td>Lirtossa78</td>
    </tr>
    <tr>
      <th>777</th>
      <td>20</td>
      <td>Male</td>
      <td>117</td>
      <td>Heartstriker, Legacy of the Light</td>
      <td>4.15</td>
      <td>Tillyrin30</td>
    </tr>
    <tr>
      <th>778</th>
      <td>20</td>
      <td>Male</td>
      <td>75</td>
      <td>Brutality Ivory Warmace</td>
      <td>1.72</td>
      <td>Quelaton80</td>
    </tr>
    <tr>
      <th>779</th>
      <td>23</td>
      <td>Female</td>
      <td>107</td>
      <td>Splitter, Foe Of Subtlety</td>
      <td>3.61</td>
      <td>Alim85</td>
    </tr>
  </tbody>
</table>
<p>780 rows × 6 columns</p>
</div>




```python
#Player Count

# Create a group based on the values in the 'maker' column
#player_group = purchase_df.groupby('Gender')

# Count how many times each maker appears in our group
count_player = purchase_df['SN'].nunique()
#count_player
pd.DataFrame({'Total Players':[count_player]})
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
      <th>Total Players</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>573</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Purchasing Analysis Total

# Number of Unique Items
unique_count = purchase_df['Item ID'].nunique()
#unique_count


```


```python
# AVG purchase price
price_avg = purchase_df['Price'].mean()
#price_avg
pd.DataFrame({'AVG purchase Price':[price_avg]})
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
      <th>AVG purchase Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2.931192</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Total Number of Purchases
purchases = purchase_df['Price'].count()
#purchases
pd.DataFrame({'Total Number of Purchases':[purchases]})
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
      <th>Total Number of Purchases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>780</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Sum of Price
revenue = purchase_df['Price'].sum()
#revenue
pd.DataFrame({'Revenue':[revenue]})
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
      <th>Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2286.33</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Purchasing Analysis Total, will need assistance on creating summary table

```


```python
#Gender Demographics
gender_group = purchase_df.groupby('Gender')
count_gender = gender_group['SN'].nunique()
count_gender
```




    Gender
    Female                   100
    Male                     465
    Other / Non-Disclosed      8
    Name: SN, dtype: int64




```python
pct_female = "{:.2%}".format(100/count_player)
#pct_female
pd.DataFrame({'% Female':[pct_female]})
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
      <th>% Female</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>17.45%</td>
    </tr>
  </tbody>
</table>
</div>




```python
pct_male = "{:.2%}".format(465/count_player)
#pct_male
pd.DataFrame({'% Male':[pct_male]})
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
      <th>% Male</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>81.15%</td>
    </tr>
  </tbody>
</table>
</div>




```python
pct_other = "{:.2%}".format(8/count_player)
#pct_other
pd.DataFrame({'% Other':[pct_other]})
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
      <th>% Other</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.40%</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Gender Dempgraphics, will need assistance on creating summary table
```


```python
#Purchasing Analysis Gender

#Purchase Count by Gender

count_purchase = gender_group['Price'].count()
count_purchase

```




    Gender
    Female                   136
    Male                     633
    Other / Non-Disclosed     11
    Name: Price, dtype: int64




```python
#Average Purchase Price

avg_price_gender = gender_group['Price'].mean()
avg_price_gender
```




    Gender
    Female                   2.815515
    Male                     2.950521
    Other / Non-Disclosed    3.249091
    Name: Price, dtype: float64




```python
#Total Purchase Value

total_gender_purchase = gender_group['Price'].sum()
total_gender_purchase
```




    Gender
    Female                    382.91
    Male                     1867.68
    Other / Non-Disclosed      35.74
    Name: Price, dtype: float64




```python
# Normalize
```
