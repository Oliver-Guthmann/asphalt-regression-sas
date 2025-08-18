DATA ASPHALT;                                                                    
INPUT obs y x1 x2 x3 x4 x5 x6;
 /* Gorman and Toman (1966) present data on potholes in 
 31 different pavement strips. 
    y = depth of a pothole per 1 million wheels passes
    x1= viscosity of the asphalt
    x2= percent of of asphalt in the surface
    x3= base
    x4= run
    x5= fine`
    x6= voids
 */
  infile datalines dlm="	";                                      
DATALINES;  
01	 6.75	 2.80	4.68	4.87	0	8.4	4.916
02	13.00	 1.40	5.19	4.50	0	6.5	4.563
03	14.75	 1.40	4.82	4.73	0	7.9	5.321
04	12.60	 3.30	4.85	4.76	0	8.3	4.865
05	 8.25	 1.70	4.86	4.95	0	8.4	3.776
06	10.67	 2.90	5.16	4.45	0	7.4	4.397
07	 7.28	 3.70	4.82	5.05	0	6.8	4.867
08	12.67	 1.70	4.86	4.70	0	8.6	4.828
09	12.58	 0.92	4.78	4.84	0	6.7	4.865
10	20.60	 0.68	5.16	4.76	0	7.7	4.034
11	 3.58	 6.00	4.57	4.82	0	7.4	5.450
12	 7.00	 4.30	4.61	4.65	0	6.7	4.853
13	26.20	 0.60	5.07	5.10	0	7.5	4.257
14	11.67	 1.80	4.66	5.09	0	8.2	5.144
15	 7.67	 6.00	5.42	4.41	0	5.8	3.718
16	12.25	 4.40	5.01	4.74	0	7.1	4.715
17	 0.76	 88.0	4.97	4.66	1	6.5	4.625
18	 1.35	 62.0	4.01	4.72	1	8.0	4.977
19	 1.44	 50.0	4.96	4.90	1	6.8	4.322
20	 1.60	 58.0	5.20	4.70	1	8.2	5.087
21	 1.10	 90.0	4.80	4.60	1	6.6	5.971
22	 0.85	 66.0	4.98	4.69	1	6.4	4.647
23	 1.20	140.0	5.35	4.76	1	7.3	5.115
24	 0.56	240.0	5.04	4.80	1	7.8	5.939
25	 0.72	420.0	4.80	4.80	1	7.4	5.916
26	 0.47	500.0	4.83	4.60	1	6.7	5.471
27	 0.33	180.0	4.66	4.72	1	7.2	4.602
28	 0.26	270.0	4.67	4.50	1	6.3	5.043
29	 0.76	170.0	4.72	4.70	1	6.8	5.075
30	 0.80	 98.0	5.00	5.07	1	7.2	4.334
31	 2.00	 35.0	4.70	4.80	1	7.7	5.705
;
PROC REG DATA=ASPHALT;                                                           
MODEL y = x1-x6 / collin vif Cp ;                                   
RUN; 

PROC REG DATA=ASPHALT;                                                           
MODEL y = x1 x2 x3 x4 x5 x6/ selection=Cp SSE RSQUARE ADJRSQ MSE CP;                                   
RUN; 
PROC REG DATA=ASPHALT;                                                           
MODEL y = x1 x2 x3 x4 x5 x6 / Selection=ADJRSQ SSE RSQUARE ADJRSQ MSE CP;                                   
RUN; 
PROC REG DATA=ASPHALT;                                                           
MODEL y = x1 x2 x3 x4 x5 x6 / Selection=stepwise slentry=0.30
                           slstay=0.20 details  SSE RSQUARE ADJRSQ MSE CP;                                   
RUN;

PROC REG DATA=ASPHALT;
	MODEL y = x2 x3 x4 / CLI CLM CLB P R VIF INFLUENCE;
OUTPUT OUT=NEW P=PRED R=RES H=LEV COOKD=CD ;
RUN;