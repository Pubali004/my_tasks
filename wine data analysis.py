#!/usr/bin/env python
# coding: utf-8

# # Wine data analysis -- Pubali Mondal

# In[1]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import math


# In[3]:


df = pd.read_csv(r"C:\Users\dibak\Downloads\WineQT.csv")
df.head()


# In[6]:


#we see that id column is unecessary for our analysis so we drop it 
df = df.drop("Id",axis=1)
df.head() 


# In[7]:


df.info()


# # Data Visualization

# In[12]:


plt.figure(figsize=(5,4))
sns.countplot(x='quality',data=df,palette='Oranges')
plt.show()


# we see wine with quality 5 followed by quality 6 have max count and quality 3 have min count 

# In[15]:


#Ploating a scatterplot between density vs fixed acidity.
plt.figure(figsize=(6,6))
sns.scatterplot(x='density',y='fixed acidity',data=df)
plt.show()


# In[21]:


plt.figure(figsize=(4,4))
sns.scatterplot(x='citric acid',y='fixed acidity',data=df,color="Purple")
plt.show()


# In[22]:


plt.figure(figsize=(5,4))
sns.scatterplot(x='pH',y='fixed acidity',data=df,color="Green")
plt.show()


# In[24]:


plt.figure(figsize=(4,4))
sns.scatterplot(x='quality',y='alcohol',data=df,color="Brown")
plt.show()


# In[26]:


plt.figure(figsize=(5,5))
sns.scatterplot(x='quality',y='alcohol',data=df,color="Orange")
plt.show()


# # splitting data

# In[28]:


x = df.drop(["quality"],axis=1)
y = df["quality"]

from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test = train_test_split(x,y,test_size=0.4)
x.head()


# In[29]:


y.head()


# # logistic Regression

# In[30]:


from sklearn.linear_model import LogisticRegression
reg = LogisticRegression()
reg.fit(x_train,y_train)
regpred = reg.predict(x_test)

from sklearn.metrics import classification_report,confusion_matrix,accuracy_score
print(classification_report(y_test,regpred))
print("Accuracy of Logistic Regression is : ",accuracy_score(y_test,regpred)*100)


# In[32]:


from sklearn.metrics import mean_absolute_error,mean_squared_error,r2_score

print("Mean Absolute Error : ",mean_absolute_error(y_test,regpred))
print("Mean Squared Error : ",mean_squared_error(y_test,regpred))
print("Root Mean Squared Error : ",np.sqrt(mean_squared_error(y_test,regpred)))
print("R2 Score : ",r2_score(y_test,regpred))


# In[41]:


plt.figure(figsize=(6,4))
sns.heatmap(confusion_matrix(y_test,regpred),annot=True,cmap="Blues")
plt.xlabel("Actual")
plt.ylabel("Predicted")
plt.title("Confusion Matrix")
plt.show()


# # decision tree 

# In[34]:


from sklearn import tree
dtree = tree.DecisionTreeClassifier()
dtree.fit(x_train,y_train)
dtreepred = dtree.predict(x_test)

print(classification_report(y_test,dtreepred))
print("Accuracy of Decision Tree is : ",accuracy_score(y_test,dtreepred)*100)


# In[35]:


print("Mean Absolute Error : ",mean_absolute_error(y_test,dtreepred))
print("Mean Squared Error : ",mean_squared_error(y_test,dtreepred))
print("Root Mean Squared Error : ",np.sqrt(mean_squared_error(y_test,dtreepred)))
print("R2 Score : ",r2_score(y_test,dtreepred))


# In[39]:


plt.figure(figsize=(6,4))
sns.heatmap(confusion_matrix(y_test,dtreepred),annot=True,cmap="Reds")
plt.xlabel("Actual")
plt.ylabel("Predicted")
plt.title("Confusion Matrix")
plt.show()


# # Random forest classifier

# In[42]:


from sklearn.ensemble import RandomForestClassifier
rf = RandomForestClassifier(n_estimators=100)
rf.fit(x_train,y_train)
rfpred = rf.predict(x_test)

print(classification_report(y_test,rfpred))
print("Accuracy of Random Forest is is : ",accuracy_score(y_test,rfpred)*100)


# In[43]:


print("Mean Absolute Error : ",mean_absolute_error(y_test,rfpred))
print("Mean Squared Error : ",mean_squared_error(y_test,rfpred))
print("Root Mean Squared Error : ",np.sqrt(mean_squared_error(y_test,rfpred)))
print("R2 Score : ",r2_score(y_test,rfpred))


# In[44]:


plt.figure(figsize=(6,4))
sns.heatmap(confusion_matrix(y_test,rfpred),annot=True,cmap="Purples")
plt.xlabel("Actual")
plt.ylabel("Predicted")
plt.title("Confusion Matrix")
plt.show()


# # model performance 

# In[49]:


LR = accuracy_score(y_test,regpred)*100
DT = accuracy_score(y_test,dtreepred)*100
RF = accuracy_score(y_test,rfpred)*100

Model = ['LRg','DTree','RFrst']
Score = [LR, DT, RF]
barplot = plt.bar(x=Model,height=Score)
plt.show()


# # feature importance

# In[52]:


importances = rf.feature_importances_
feature_importances = pd.DataFrame({'feature': x.columns, 'importance': importances})

feature_importances = feature_importances.sort_values('importance', ascending=True)
print(feature_importances)


# # ***Conclusion from the above analysis***
# Random Forest leads with higher accuracy compared to Logistic Regression and Decision Tree.
# 
# According to Feature Importance, "alcohol","sulphates","volatile acidity" are the features with highest scores. Implies those are the dominating features used to predict the quality of wine.
# 
# Data is sightly imbalanced with the quality of wines ranging between "5" and "6" in the majority.
# 
# 

# In[ ]:




