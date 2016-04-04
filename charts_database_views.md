### Database Views:

#### claims (We may want to break this into a 2 charts, medical claims and rx claims)

* `period` (e.g. "Jan 2016", Monthly trend wiht a 6 month lookback)
* `medical_freq` (e.g. 2778)
* `medical_paid` (e.g. 900432)
* `rx_freq` (e.g. 2647)
* `rx_paid` (e.g. 683242)


### place_of_service (Let's turn this into a top 10 horizontal bar graph)

* `label` (e.g. "Urgent Care")
* `frequency` (e.g. 25)
* `paid` (e.g. 188343)


### gender_distribution

* `label` (e.g. "male")
* `percent` (e.g. 40)


### medical_diagnostic_codes (Let's turn this into a top 10 horizontal bar graph)

* `label` (e.g. "Pneumonia")
* `value` (e.g. 65)
* `paid` (e.g 123324)


##### NOTE: I think we may be able to merge medical_diagnostic_codes and chronic_conditions for now, let's just make one chart called medical_diagnosis


### chronic_conditions

* `condition` (e.g. "scoliosis")
* `amount_paid` (e.g. 107321)
* `frequency` (e.g. 114)


### emergency_room_vs_urgent_care

* `month_year` (e.g. Jan 2016, this will be a monthly trend with a 6 month lookback)
* `emergency_room_paid` (e.g. 343390)
* `urgent_care_paid` (e.g. 345455)


### generic_vs_maintenance

* `month_year` (e.g. Jan 2016, this will be a monthly trend wiht a 6 month lookback)
* `generic_paid` (e.g. 323343)
* `maintenance_paid` (e.g. 343375)


### therapeutic_class (Top 10 horizontal bar chart)

* `label` (e.g. "Antibiotics")
* `frequency` (e.g. 75)
* `paid` (e.g. 134342)


### top_ten_drugs (Top 10 Table)

* `label` (e.g. MELOXICAM)
* `amount_paid` (e.g. 684300)
* `frequency` (e.g. 112)


### mail_vs_retail (Vertical Bar Chart)

* `month_year` (e.g. Jan 2016)
* `mail_paid` (e.g. 343342)
* `retail_paid` (e.g. 233258)


### large_claims (Top 10 Table for the current month)

* `date` (e.g. Jan 15, 2016)
* `paid` (e.g. 333234)
* `place_of_service` (e.g. Medical Office)
* `City` (e.g. Raleigh)
* `State` (e.g. NC)
* `dianosis` (e.g. Pneumonia)

