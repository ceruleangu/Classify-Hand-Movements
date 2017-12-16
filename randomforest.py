
# coding: utf-8

# In[17]:


import scipy.io
import numpy as np
import matplotlib.pyplot as plt


X = scipy.io.loadmat('feature.mat')
y = scipy.io.loadmat('label.mat')

X = X['feature']
y = y['label']


# In[73]:


Y = map(lambda x: np.nonzero(x)[0][0], y)


# In[71]:


X.shape


# In[72]:


y.shape


# In[79]:


# PCA
from sklearn.decomposition import PCA
pca = PCA(n_components=800)
X_r = pca.fit(X).transform(X)

# Percentage of variance explained for each components
print('explained variance ratio: %s'
      % str(sum(pca.explained_variance_ratio_)))


# In[93]:


from sklearn.model_selection import train_test_split


# In[146]:


use_pca = False

if use_pca:
    X_train, X_test, Y_train, Y_test = train_test_split(X_r, Y, test_size=0.10)
else:
    X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.10)


# In[124]:


from sklearn.ensemble import AdaBoostClassifier, RandomForestClassifier
from sklearn.metrics import accuracy_score, confusion_matrix
from sklearn.tree import DecisionTreeClassifier


# In[118]:


# boosting (not work well, but should... so parameter problem)
bdt_real = AdaBoostClassifier(
    DecisionTreeClassifier(max_depth=4, criterion='entropy', max_features='sqrt'),
    n_estimators=2000,
    learning_rate=1.0)

bdt_real.fit(X_train, Y_train)


# In[119]:


# test error
real_test_errors = []
for real_test_predict in bdt_real.staged_predict(X_test):
    real_test_errors.append(
        1. - accuracy_score(real_test_predict, Y_test))

n_trees_real = len(bdt_real)


# In[120]:


# train error
real_estimator_errors = bdt_real.estimator_errors_[:n_trees_real]


# In[121]:


plt.figure(figsize=(15, 5))

plt.subplot(111)
plt.plot(range(1, n_trees_real + 1), real_estimator_errors,
         "r", label='train', alpha=.5)
plt.plot(range(1, n_trees_real + 1),
         real_test_errors, c='blue',
         linestyle='dashed', label='test')
plt.legend()
plt.ylim(0.01, 0.99)
plt.ylabel('Error')
plt.xlabel('Number of Trees')

plt.subplots_adjust(wspace=0.25)
plt.show()


# In[122]:


confusion_matrix(Y_test, real_test_predict)


# In[179]:


# random forest
rf = RandomForestClassifier(max_depth=20, criterion='entropy', n_estimators=5000, n_jobs=-1,
                            max_features='auto', verbose=1, oob_score=True, min_samples_split=4)
rf.fit(X_train, Y_train)


# In[180]:


# test accuracy
Y_pred = rf.predict(X_test)
accuracy_score(Y_pred, Y_test)


# In[181]:


# train accuracy
accuracy_score(rf.predict(X_train), Y_train)


# In[182]:


confusion_matrix(Y_test, Y_pred)


# In[183]:


rf.oob_score_

