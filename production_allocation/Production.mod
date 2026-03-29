set Resources;
set Products;

param price{j in Products};
param availability{i in Resources};
param requirements{i in Resources, j in Products};

var amount{j in Products} >= 0;

maximize Profit : sum{j in Products} price[j] * amount[j];

subject to Availability{i in Resources} : 
sum{j in Products} requirements[i,j] * amount[j] <= availability[i];