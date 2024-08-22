# Code Book for Samsung Data Analysis

## Description
This code book describes the variables in the tidy dataset created from the Samsung wearable device data analysis. The dataset contains measurements collected from various activities performed by subjects.

## Variables

| Variable Name | Description                                        | Data Type |
|---------------|----------------------------------------------------|-----------|
| Subject       | Identifier for each subject (1-30)                | Integer   |
| Activity      | Type of activity performed (e.g., WALKING, SITTING, etc.) | Character |
| tBodyAccMeanX | Mean of the body acceleration in the X direction   | Numeric   |
| tBodyAccMeanY | Mean of the body acceleration in the Y direction   | Numeric   |
| tBodyAccMeanZ | Mean of the body acceleration in the Z direction   | Numeric   |
| tBodyAccStdX  | Standard deviation of body acceleration in the X direction | Numeric   |
| tBodyAccStdY  | Standard deviation of body acceleration in the Y direction | Numeric   |
| tBodyAccStdZ  | Standard deviation of body acceleration in the Z direction | Numeric   |
| ...           | ... (add other variables as necessary)            | ...       |

## Notes
- The dataset includes measurements from multiple subjects performing various activities.
- The variables prefixed with `t` represent time-domain signals, while those prefixed with `f` represent frequency-domain signals.
