### Database Views:

#### claims

* `period` (e.g. "2015 Q3")
* `medical` (e.g. 2778)
* `rx` (e.g. 3476)
* `paid` (e.g. 2647)


### place_of_service

* `label` (e.g. "Urgent Care")
* `percent` (e.g. 25)


### gender_distribution

* `label` (e.g. "male")
* `percent` (e.g. 40)


### medical_diagnostic_codes

* `year` (e.g. 2013)
* `label` (e.g. "Series A")
* `value` (e.g. 65)


### chronic_conditions

* `condition` (e.g. "scoliosis")
* `amount_paid` (e.g. 107321)
* `frequency` (e.g. 114)


### emergency_room_vs_urgent_care

* `year` (e.g. 2014)
* `emergency_room` (e.g. 90)
* `urgent_care` (e.g. 55)


### generic_vs_maintenance

* `year` (e.g. 2014)
* `generic` (e.g. 23)
* `maintenance` (e.g. 75)


### therapeutic_class

* `class` (e.g. 3)
* `label` (e.g. 'Therapeutic Class')
* `value` (e.g. 75)


### top_ten_drugs

* `position` (e.g. 9)
* `amount_paid` (e.g. 684300)
* `frequency` (e.g. 112)


### mail_vs_retail

* `year` (e.g. 2012)
* `mail` (e.g. 42)
* `retail` (e.g. 58)


### large_claims

* `position` (e.g. 4)
* `date_paid` (e.g. DateTime('July 4, 2013'))
* `place_of_service` (e.g. "Medical Office")
* `diagnosis_code` (e.g. "V900")
* `medical_expense_total` (e.g. 504722)
* `rx_total_paid` (e.g. 43859)
* `grand_total` (e.g. 702036)
