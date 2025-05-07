# Colorectal_Cancer_Analysis
![Screenshot 2025-05-07 230215](https://github.com/user-attachments/assets/a2fe5ec7-4812-44a0-a68b-a37ffd44d9ca)


ANALYSIS OF COLORECTAL CANCER DATASET

The dataset which was for several world countries, was filtered for only entries for South Africa. Only a sample of 1034 entries was used for the analysis.
The dataset was split into 5 tables: Patients, Treatment Type, Outcomes, Healthcare Data and Diagnosis.
This analysis is only meant to provide a quick look at the colorectal cancer trends in South Africa as only a part of the data has been used for analysis.

Exploratory Data Analysis

MySQL was used for the exploratory data analysis, answering the following questions;
-	What is the distribution of cancer diagnosis by gender and smoking status?
-	What is the distribution of cancer diagnosis by patient age?
-	How did screening frequency affect detection?
-	Which is the most common treatment type for each cancer stage?
-	Compare the use of different Treatment types in developed regions vs developing regions.
-	What is the number of patients predicted to survive by each cancer stage?
-	How does the 5-year survival rate vary by treatment type?
-	How does survival prediction vary by treatment type?
-	Is there a correlation between healthcare access and survival prediction?
-	How does the combination of cancer stage and early detection affect survival prediction?

Data Visualization
An SQL query was used to import data into Power BI. DAX formulas and Power BI were used to visualize the data

The next task was to visualize the data in order to answer the following questions in order to assess certain factors that influence survival after diagnosis with colorectal cancer;

-	Which treatment type has the best 5-year survival rate?
-	Which treatment type has the best survival prediction rate for patients surviving?
-	How does economic classification affect survival prediction rate for patients surviving?
-	What is the percentage of patients surviving 5 years post treatment per cancer stage at diagnosis?
-	How does early detection affect survival rate for each cancer stage at diagnosis?

Insights gained from the visualization

-	The combination of different treatment types resulted in the highest percentage of patients surviving after 5 years, with 61% of patients under combination therapy still surviving in 5 years. Chemotherapy on the other hand was the least effective treatment type with only 58% of patients undergoing the treatment surviving in 5 years.
-	Radiotherapy has the best survival prediction outcomes with 65% of the patients undergoing radiotherapy predicted to survive. Surgery ranks second whereas chemotherapy and combination therapy tied for last with only 54% of patients that undergo either treatment type surviving.
-	Patients in developed areas have a better survival prediction as compared to those in non-developed areas.
-	Patients with cancer that is localized are best placed to survive 5 years later, whilst those whose cancer stage is metastatic is are less likely to survive in ten years relative to localized and regional stages.
-	At all cancer stages, more patients are predicted to survive when the disease has been detected early.
