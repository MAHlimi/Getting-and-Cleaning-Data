Codebook
========
 Variable list and descriptions
------------------------------
  
Variable name    | Description
-----------------|-------------------------------------------------------------------
SubjectId.Id     | Identifier of the subject who carried out the experiment (1 to 30)
Activity         | Activity label (LAYING, SITTING, ...)
Signal.Domain    | Domain of the signal: Time or frequency (Time or Freq)
Measurement      | Measured variable
#Measurements    | Number of measurements used to compute the "Average"
Mean.Average     | Average of the "Mean value" variable by "Subject", "Activity", "Signal.Domain" and "Measurment"
SD.Average       | Average of the "Standard deviation" variable by "Subject", "Activity", "Signal.Domain" and "Measurment"

Dataset dimensions
-----------------
  
  
  ```r
  dim(dtTidy)
  ```
  
  ```
  ## [1] 5940    7
  ```

Dataset structure
-----------------
  
  
  ```r
  str(dtTidy)
  ```
  
  ```
  ## Classes 'data.table' and 'data.frame':	5940 obs. of  7 variables:
  ##  $ Subject.Id   : Factor w/ 30 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
  ##  $ Activity     : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
  ##  $ Signal.Domain: Factor w/ 2 levels "Freq","Time": 1 1 1 1 1 1 1 1 1 1 ...
  ##  $ Measurement  : Factor w/ 20 levels "Body Acceleration (Magnitude)",..: 1 2 3 4 5 6 7 8 9 10 ...
  ##  $ #Measurements: int  50 50 50 50 50 50 50 50 50 50 ...
  ##  $ Mean.Average : num  -0.862 -0.939 -0.867 -0.883 -0.933 ...
  ##  $ SD.Average   : num  -0.798 -0.924 -0.834 -0.813 -0.922 ...
  ##  - attr(*, "sorted")= chr  "Subject.Id" "Activity" "Signal.Domain" "Measurement"
  ##  - attr(*, ".internal.selfref")=<externalptr>
  ```

List the key variables in the data table
----------------------------------------
  
  
  ```r
  key(dtTidy)
  ```
  
  ```
  ## [1] "Subject.Id"    "Activity"      "Signal.Domain" "Measurement"
  ```

Show a few rows of the dataset
------------------------------
  
  
  ```r
  dtTidy
  ```
  
  ```
  ##       Subject.Id         Activity Signal.Domain
  ##    1:          1           LAYING          Freq
  ##    2:          1           LAYING          Freq
  ##    3:          1           LAYING          Freq
  ##    4:          1           LAYING          Freq
  ##    5:          1           LAYING          Freq
  ##   ---                                          
  ## 5936:         30 WALKING_UPSTAIRS          Time
  ## 5937:         30 WALKING_UPSTAIRS          Time
  ## 5938:         30 WALKING_UPSTAIRS          Time
  ## 5939:         30 WALKING_UPSTAIRS          Time
  ## 5940:         30 WALKING_UPSTAIRS          Time
  ##                               Measurement #Measurements Mean.Average
  ##    1:       Body Acceleration (Magnitude)            50  -0.86176765
  ##    2:          Body Acceleration (X axis)            50  -0.93909905
  ##    3:          Body Acceleration (Y axis)            50  -0.86706521
  ##    4:          Body Acceleration (Z axis)            50  -0.88266688
  ##    5:  Body Acceleration Jerk (Magnitude)            50  -0.93330036
  ##   ---                                                               
  ## 5936: Body Angular Velocity Jerk (Z axis)            65  -0.03641578
  ## 5937:    Gravity Acceleration (Magnitude)            65  -0.13762786
  ## 5938:       Gravity Acceleration (X axis)            65   0.93182983
  ## 5939:       Gravity Acceleration (Y axis)            65  -0.22664729
  ## 5940:       Gravity Acceleration (Z axis)            65  -0.02214011
  ##       SD.Average
  ##    1: -0.7983009
  ##    2: -0.9244374
  ##    3: -0.8336256
  ##    4: -0.8128916
  ##    5: -0.9218040
  ##   ---           
  ## 5936: -0.6651506
  ## 5937: -0.3274108
  ## 5938: -0.9540336
  ## 5939: -0.9149339
  ## 5940: -0.8624028
  ```

Summary of variables
--------------------
  
  
  ```r
  summary(dtTidy)
  ```
  
  ```
  ##    Subject.Id                 Activity   Signal.Domain
  ##  1      : 198   LAYING            :990   Freq:2340    
  ##  2      : 198   SITTING           :990   Time:3600    
  ##  3      : 198   STANDING          :990                
  ##  4      : 198   WALKING           :990                
  ##  5      : 198   WALKING_DOWNSTAIRS:990                
  ##  6      : 198   WALKING_UPSTAIRS  :990                
  ##  (Other):4752                                         
  ##                              Measurement   #Measurements  
  ##  Body Acceleration (Magnitude)     : 360   Min.   :36.00  
  ##  Body Acceleration (X axis)        : 360   1st Qu.:49.00  
  ##  Body Acceleration (Y axis)        : 360   Median :54.50  
  ##  Body Acceleration (Z axis)        : 360   Mean   :57.22  
  ##  Body Acceleration Jerk (Magnitude): 360   3rd Qu.:63.25  
  ##  Body Acceleration Jerk (X axis)   : 360   Max.   :95.00  
  ##  (Other)                           :3780                  
  ##   Mean.Average        SD.Average     
  ##  Min.   :-0.99762   Min.   :-0.9977  
  ##  1st Qu.:-0.93140   1st Qu.:-0.9714  
  ##  Median :-0.12974   Median :-0.9194  
  ##  Mean   :-0.30898   Mean   :-0.6597  
  ##  3rd Qu.:-0.01192   3rd Qu.:-0.3638  
  ##  Max.   : 0.97451   Max.   : 0.6871  
  ## 
  ```
