cassini=readtable('Cassinidata.txt');
cassini.Properties.VariableNames{1} = 'yr';
cassini.Properties.VariableNames{2} = 'mth';
cassini.Properties.VariableNames{3} = 'dy';
cassini.Properties.VariableNames{4} = 'x';
cassini.Properties.VariableNames{5} = 'y';
cassini.Properties.VariableNames{6} = 'z';
planets= readtable('Planetsdata.txt');
planets.Properties.VariableNames{1} = 'Planet';
planets.Properties.VariableNames{2} = 'Radius';
 planets.Planet{1} = 'Mercury';
planets.Planet{2} = 'Venus';
planets.Planet{3} = 'Earth';
planets.Planet{4} = 'Mars';
planets.Planet{5} = 'Jupiter';
planets.Planet{6} = 'Saturn';
planets.Planet{7} = 'Uranus';
planets.Planet{8} = 'Neptune';

for k = min(cassini.yr):max(cassini.yr)
     plot(cassini.x(cassini.yr==k),cassini.y(cassini.yr==k))
     hold on
end
hold off
theta= linspace(0,2*pi);
for k=1:6
    hold on
    plot(planets.Radius(k)*cos(theta),planets.Radius(k)*sin(theta),":k")
end
hold off
d = round(sqrt(cassini.x.^2 + cassini.y.^2 + cassini.z.^2),2);
t = zeros(length(planets.Radius),1);
for k = 1:length(planets.Radius)
    t(k) = nnz(d == planets.Radius(k));
end
planets.Days = t;
plot(planets.Radius,planets.Days,'Linestyle','-','Marker','o')
