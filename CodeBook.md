# Dataset Transformation
 1. Load the files into "R"
 2. Concatenate the training and the test sets
 3. Extract only the measurements on the mean and standard deviation
 4. Use descriptive activity names
 5. label the data set with descriptive variable names
 6. Create a tidy data set

# Tidy Dataset Analysis
## Variables Description
  
Variable name    | Description
-----------------|-------------------------------------------------------------------
SubjectId.Id     | Identifier of the subject who carried out the experiment (1 to 30)
Activity         | Activity label (LAYING, SITTING, ...)
Signal.Domain    | Domain of the signal: Time or frequency (Time or Freq)
Measurement      | Measured variable
#Measurements    | Number of measurements used to compute the "Average"
Mean.Average     | Average of the "Mean value" variable by "Subject", "Activity", "Signal.Domain" and "Measurment"
SD.Average       | Average of the "Standard deviation" variable by "Subject", "Activity", "Signal.Domain" and "Measurment"

## Dataset Dimensions
  
  
  ```r
  dim(dtTidy)
  ```
  
  ```
  ## [1] 5940    7
  ```

## Key Variables
  
  
  ```r
  key(dtTidy)
  ```
  
  ```
  ## [1] "Subject.Id"    "Activity"      "Signal.Domain" "Measurement"
  ```

## Dataset Structure
  
  
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

## Variables Summary
  
  
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

## First six rows of the Dataset
  
  
  ```r
  head(dtTidy)
  ```
  
  ```
  ##    Subject.Id Activity Signal.Domain                        Measurement
  ## 1:          1   LAYING          Freq      Body Acceleration (Magnitude)
  ## 2:          1   LAYING          Freq         Body Acceleration (X axis)
  ## 3:          1   LAYING          Freq         Body Acceleration (Y axis)
  ## 4:          1   LAYING          Freq         Body Acceleration (Z axis)
  ## 5:          1   LAYING          Freq Body Acceleration Jerk (Magnitude)
  ## 6:          1   LAYING          Freq    Body Acceleration Jerk (X axis)
  ##    #Measurements Mean.Average SD.Average
  ## 1:            50   -0.8617676 -0.7983009
  ## 2:            50   -0.9390991 -0.9244374
  ## 3:            50   -0.8670652 -0.8336256
  ## 4:            50   -0.8826669 -0.8128916
  ## 5:            50   -0.9333004 -0.9218040
  ## 6:            50   -0.9570739 -0.9641607
  ```
