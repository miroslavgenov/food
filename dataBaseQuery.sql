create database NutritionFoods;

create table foods(
id int not null auto_increment primary key, 
FoodName varchar(255),
Weight int
);

create table nutritionComponents(
id int not null auto_increment primary key,
componentName varchar(255),
measurementMetric varchar(255)
);

create table macronutrients(
id int not null auto_increment primary key, 
foodId int,
Calories int,
Fat decimal(7,3),
Protein decimal(7,3),
Carbohydrate decimal(7,3),
Sugars decimal(7,3),
Fiber decimal(7,3),
Cholesterol decimal(7,3),
SaturatedFats decimal(7,3),
NetCarbs decimal(7,3),
TransFattyAcids decimal(7,3),

foreign key (foodId)
	references foods(id)
    on update no action
    on delete no action
);

create table minerals(
id int not null auto_increment primary key, 
foodId int,
Calcium int,
Iron decimal(7,3),
Potassium decimal(7,3),
Magnesium decimal(7,3),
Phosphorus decimal(7,3),
Sodium decimal(7,3),
Zinc decimal(7,3),
Copper decimal(7,3),
Manganese decimal(7,3),
Selenium decimal(7,3),
Fluoride decimal(7,3),
Molybdenum decimal(7,3),
Iodine decimal(7,3),
Chlorine decimal(7,3),
Chromium decimal(7,3),



foreign key (foodId)
	references foods(id)
    on update no action
    on delete no action
);



create table vitamis(
id int not null auto_increment primary key, 
foodId int,
VitaminARAE decimal(7,3),
VitaminC decimal(7,3),
VitaminB1 decimal(7,3),
VitaminB2 decimal(7,3),
VitaminB3 decimal(7,3),
VitaminB5 decimal(7,3),
VitaminB6 decimal(7,3),
VitaminB7 decimal(7,3),
VitaminB9 decimal(7,3),
Folicacid decimal(7,3),
FoodFolate decimal(7,3),
FolateDFE decimal(7,3),
Choline decimal(7,3),
VitaminB12 decimal(7,3),
Retinol decimal(7,3),
Carotenebeta decimal(7,3),
Carotenealpha decimal(7,3),
Cryptoxanthinbeta decimal(7,3),
VitaminAIU decimal(7,3),
Lycopene decimal(7,3),
LutplusZeaxanthin decimal(7,3),
VitaminE decimal(7,3),
VitaminD decimal(7,3),
VitaminD2 decimal(7,3),
VitaminD3 decimal(7,3),
VitaminDIU decimal(7,3),
VitaminK decimal(7,3),
VitaminK1 decimal(7,3),
Menaquinone4 decimal(7,3),

foreign key (foodId)
	references foods(id)
    on update no action
    on delete no action
);

create table otherNutritionData(
id int not null auto_increment primary key, 
foodId int,
Water decimal(7,3),
Ash decimal(7,3),
Alcohol decimal(7,3),
Caffeine decimal(7,3),
Theobromine decimal(7,3),
PRALscore decimal(7,3),

foreign key (foodId)
	references foods(id)
    on update no action
    on delete no action
);

create table carbsSugars(
id int not null auto_increment primary key, 
foodId int,
SolubleFiber decimal(7,3),
InsolubleFiber decimal(7,3),
AddedSugar decimal(7,3),
Sucrose decimal(7,3),
GlucoseDextrose decimal(7,3),
Fructose decimal(7,3),
Lactose decimal(7,3),
Maltose decimal(7,3),
Galactose decimal(7,3),
Starch decimal(7,3),
Carbohydrateother decimal(7,3),
Totalsugaralcohols decimal(7,3),

foreign key (foodId)
	references foods(id)
    on update no action
    on delete no action
);

create table fats(
id int not null auto_increment primary key, 
foodId int,
TotalMonounsaturated decimal(7,3),
TotalPolyunsaturated decimal(7,3),
Omega3s decimal(7,3),
Omega6s decimal(7,3),
Omega3toOmega6Ratio decimal(7,3),
Omega6toOmega3Ratio decimal(7,3),
alphaLinolenicAcid decimal(7,3),
EicosapentaenoicAcid decimal(7,3),
DocosapentaenoicAcid decimal(7,3),
DocosahexaenoicAcid decimal(7,3),
n3EicosatrienoicAcid decimal(7,3),
LinoleicAcid decimal(7,3),
gammaLinolenicAcid decimal(7,3),
ciscisn6EicosadienoicAcid decimal(7,3),
DihomogammalinolenicAcid decimal(7,3),
ArachidonicAcid decimal(7,3),
ButyricAcid decimal(7,3),
CaproicAcid decimal(7,3),
CaprylicAcid decimal(7,3),
CapricAcid decimal(7,3),
LauricAcid decimal(7,3),
TridecanoicAcid decimal(7,3),
MyristicAcid decimal(7,3),
PentadecanoicAcid decimal(7,3),
PalmiticAcid decimal(7,3),
MargaricAcid decimal(7,3),
StearicAcid decimal(7,3),
ArachidicAcid decimal(7,3),
BehenicAcid decimal(7,3),
LignocericAcid decimal(7,3),
MyristoleicAcid decimal(7,3),
PentadecenoicAcid decimal(7,3),
PalmitoleicAcid decimal(7,3),
cisPalmitoleicAcid decimal(7,3),
HeptadecenoicAcid decimal(7,3),
OleicAcid decimal(7,3),
cisOleicAcid decimal(7,3),
cisVaccenicAcid decimal(7,3),
GadoleicAcid decimal(7,3),
DocosenoicAcid decimal(7,3),
cisDocosenoicAcid decimal(7,3),
cisTetracosenoicAcid decimal(7,3),
OctadecadienoicAcid decimal(7,3),
ConjugatedLinoleicAcid decimal(7,3),
iOctadecadienoicAcid decimal(7,3),
undifferentiatedOctadecatrienoic decimal(7,3),
OctadecatrienoicAcid decimal(7,3),
ParinaricAcid decimal(7,3),
EicosatrienoicAcid decimal(7,3),
EicosatetraenoicAcid decimal(7,3),
HeneicosapentaenoicAcid decimal(7,3),
AdrenicAcid decimal(7,3),
TransPolyenoicFats decimal(7,3),
TransMonoenoicFats decimal(7,3),
transPalmitoleicAcid decimal(7,3),
transOleicAcid decimal(7,3),
transDocosenoicAcid decimal(7,3),
transOctadecadienoicAcid decimal(7,3),
transtransOctadecadienoicAcid decimal(7,3),
TotalPhytosterols decimal(7,3),
Stigmasterol decimal(7,3),
Campesterol decimal(7,3),
Betasitosterol decimal(7,3),

foreign key (foodId)
	references foods(id)
    on update no action
    on delete no action
);

create table aminoAcids(
id int not null auto_increment primary key, 
foodId int,
Histidine decimal(7,3),
Isoleucine decimal(7,3),
Leucine decimal(7,3),
Lysine decimal(7,3),
Methionine decimal(7,3),
Phenylalanine decimal(7,3),
Threonine decimal(7,3),
Tryptophan decimal(7,3),
Valine decimal(7,3),
Arginine decimal(7,3),
Cystine decimal(7,3),
Glycine decimal(7,3),
Proline decimal(7,3),
Tyrosine decimal(7,3),
Alanine decimal(7,3),
Asparticacid decimal(7,3),
Betaine decimal(7,3),
Glutamicacid decimal(7,3),
Hydroxyproline decimal(7,3),
Serine decimal(7,3),

foreign key (foodId)
	references foods(id)
    on update no action
    on delete no action
);