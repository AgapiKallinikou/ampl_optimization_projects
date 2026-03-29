set Air_Media;
set Print_Media;
set Media = Air_Media union Print_Media;

param max_rate_print_air;
param max_cost;
param cost{i in Media};
param min_adv{i in Media};
param max_adv{i in Media};
param efficiency{i in Media};

var number_adv{i in Media} integer;

maximize Efficiency : sum{i in Media} efficiency[i] * number_adv[i];

subject to Max_cost : sum{i in Media} cost[i] *  number_adv[i] <= max_cost;
subject to Max_Min_adv{i in Media} : min_adv[i] <= number_adv[i] <= max_adv[i];
subject to Max_rate_print_air : sum{i in Print_Media} number_adv[i] <= max_rate_print_air * (sum{i in Air_Media} number_adv[i]);
