CREATE TABLE performance
(
	fl_date date,
	mkt_carrier character varying(2),
	mkt_carrier_fl_num character varying(4),
	origin character varying(3),
	origin_city_name character varying(45),
	origin_state_abr character varying(2),
	dest character varying(3),
	dest_city_name character varying(45),
	dest_state_abr character varying(2),
	dep_delay_new numeric,
	arr_delay_new numeric,
	cancelled numeric,
	cancellation_code character varying(2),
	diverted numeric,
	carrier_delay numeric,
	weather_delay numeric,
	nas_delay numeric,
	security_delay numeric,
	late_aircraft_delay numeric
);

COPY public.performance (fl_date, mkt_carrier, mkt_carrier_fl_num, origin, origin_city_name, origin_state_abr, dest, dest_city_name, dest_state_abr, dep_delay_new, arr_delay_new, cancelled, cancellation_code, diverted, carrier_delay, weather_delay, nas_delay, security_delay, late_aircraft_delay) 
FROM 'F://100_days_of_learning//OntimeCarrier.csv' 
DELIMITER ',' 
CSV HEADER ENCODING 'UTF8' 
QUOTE '"' 
ESCAPE '''';

SELECT * FROM performance;

