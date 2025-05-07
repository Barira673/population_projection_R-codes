% Example setup for one grid

baseyear = 2020;
endyear = 2100;
stepwidth = 5;

% Assume 21 age groups (0–4, 5–9, ..., 100+)
age_groups = 21;

% Population in base year for one grid (male and female, 1x21 each)
pop_m_base = [500 450 400 350 300 250 200 150 100 80 60 40 30 25 20 15 10 8 6 4 2];
pop_f_base = [480 430 380 330 290 240 190 140 90 70 50 35 28 22 18 14 9 7 5 3 1];

pop_b = [pop_m_base; pop_f_base];

% Fertility in base year: 7 values, each for female age group (only reproductive ages matter)
fer_b = [0.6 0.05 0.1 0.12 0.1 0.05 0.02];

% Mortality in base year: 1x21 for male, 1x21 for female
mor_b = [0.01*ones(1,21); 0.009*ones(1,21)];

% Net migration in base year: 1x21 for male, 1x12 for female
mig_b = [zeros(1,12); zeros(1,12)];  % Assume no migration for simplicity

% Projected fertility (e.g., constant scenario): 17 steps for (2100-2020)/5 + 1
fer_proj = repmat([1.8 1.6 1.4], (endyear - baseyear)/stepwidth + 1, 1);  % high, med, low TFRs

% Newborn sex ratio (e.g., 1 male per female)
newbornsex = 1;

% SSP scenario and country type
ssp = 2;  % SSP2 - Middle of the road
ct = 2;   % High fertility country

% Call the population projection function for one grid
[population_m, population_f] = popproj1(baseyear, endyear, stepwidth, pop_b, fer_b, mor_b, mig_b, fer_proj, newbornsex, ssp, ct);

% result
years = baseyear:stepwidth:endyear;
total_pop_m = sum(population_m, 2);
total_pop_f = sum(population_f, 2);


