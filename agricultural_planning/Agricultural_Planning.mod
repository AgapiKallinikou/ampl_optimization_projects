set Fields;
set Cereals;

param surface{i in Fields};
param water{i in Fields};
param max_surface{j in Cereals};
param water_consumption{j in Cereals};
param profit{j in Cereals};

var percentage in [0,1];
var surf_field_cereal{i in Fields, j in Cereals}>=0;

maximize Profit: sum{i in Fields, j in Cereals}profit[j]*surf_field_cereal[i,j];
subject to Surface{i in Fields}: sum{j in Cereals}surf_field_cereal[i,j]=percentage*surface[i];
subject to Water{i in Fields}: sum{j in Cereals}water_consumption[j]*surf_field_cereal[i,j]<=water[i];
subject to Max_surface{j in Cereals}:sum{i in Fields}<=max_surface[j];
