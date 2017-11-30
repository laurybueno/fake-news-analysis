# Melhores modelos de regressão logística mapeados

Abaixo, temos as variáveis usadas e seus modelos correspondentes.

## "headline", "accuracy_bool", "DP_INCOME", "DP_USHHI2_der", "USRACE4_der", "HCAL_REGION1_Label_abbreviation_US", "resp_gender"

```
Logistic Regression Model

 lrm(formula = accuracy_bool ~ ., data = dados_regressao, x = TRUE,
     y = TRUE)

                       Model Likelihood     Discrimination    Rank Discrim.
                          Ratio Test           Indexes           Indexes
 Obs          4135    LR chi2     207.09    R2       0.077    C       0.655
  False        852    d.f.            15    g        0.666    Dxy     0.310
  True        3283    Pr(> chi2) <0.0001    gr       1.947    gamma   0.312
 max |deriv| 2e-12                          gp       0.102    tau-a   0.101
                                            Brier    0.155

                                    Coef    S.E.   Wald Z Pr(>|Z|)
 Intercept                           1.1655 0.2347  4.96  <0.0001
 headline=B                          1.1805 0.2057  5.74  <0.0001
 headline=C                          0.2967 0.1590  1.87  0.0620
 headline=D                          0.6616 0.1709  3.87  0.0001
 headline=E                          0.8922 0.2187  4.08  <0.0001
 headline=F                          0.8744 0.1785  4.90  <0.0001
 headline=G                          0.9265 0.1765  5.25  <0.0001
 headline=H                          0.8925 0.1598  5.58  <0.0001
 headline=I                          0.4340 0.1600  2.71  0.0067
 headline=J                          1.6253 0.2882  5.64  <0.0001
 headline=K                          1.7457 0.1624 10.75  <0.0001
 DP_INCOME                           0.2841 0.0918  3.09  0.0020
 DP_USHHI2_der                      -0.1463 0.0509 -2.87  0.0041
 USRACE4_der                        -0.0139 0.0614 -0.23  0.8208
 HCAL_REGION1_Label_abbreviation_US -0.0045 0.0027 -1.68  0.0932
 resp_gender                        -0.3089 0.0797 -3.88  0.0001
```

```
> validate(modelo, method="boot", B=1000)
          index.orig training   test optimism index.corrected    n
Dxy           0.3097   0.3195 0.3006   0.0189          0.2908 1000
R2            0.0765   0.0818 0.0716   0.0101          0.0664 1000
Intercept     0.0000   0.0000 0.0810  -0.0810          0.0810 1000
Slope         1.0000   1.0000 0.9331   0.0669          0.9331 1000
Emax          0.0000   0.0000 0.0301   0.0301          0.0301 1000
D             0.0498   0.0534 0.0466   0.0068          0.0430 1000
U            -0.0005  -0.0005 0.0002  -0.0007          0.0002 1000
Q             0.0503   0.0538 0.0463   0.0075          0.0428 1000
B             0.1554   0.1546 0.1561  -0.0015          0.1569 1000
g             0.6663   0.6903 0.6411   0.0492          0.6171 1000
gp            0.1021   0.1050 0.0986   0.0064          0.0957 1000
```

## "accuracy_bool", "DP_GENAGE"

```
Logistic Regression Model

 lrm(formula = accuracy_bool ~ ., data = dados_regressao, x = TRUE,
     y = TRUE)

                       Model Likelihood     Discrimination    Rank Discrim.
                          Ratio Test           Indexes           Indexes
 Obs          4135    LR chi2      21.85    R2       0.008    C       0.552
  False        852    d.f.             1    g        0.204    Dxy     0.105
  True        3283    Pr(> chi2) <0.0001    gr       1.227    gamma   0.126
 max |deriv| 1e-12                          gp       0.033    tau-a   0.034
                                            Brier    0.163

           Coef    S.E.   Wald Z Pr(>|Z|)
 Intercept  1.7066 0.0876 19.47  <0.0001
 DP_GENAGE -0.1039 0.0223 -4.66  <0.0001
```

## "accuracy_bool", "DP_EDUCATION_BAN"

```
Logistic Regression Model

 lrm(formula = accuracy_bool ~ ., data = dados_regressao, x = TRUE,
     y = TRUE)

                      Model Likelihood     Discrimination    Rank Discrim.
                         Ratio Test           Indexes           Indexes
 Obs          4135    LR chi2      1.32    R2       0.001    C       0.517
  False        852    d.f.            1    g        0.049    Dxy     0.034
  True        3283    Pr(> chi2) 0.2498    gr       1.050    gamma   0.044
 max |deriv| 2e-11                         gp       0.008    tau-a   0.011
                                           Brier    0.164

                  Coef   S.E.   Wald Z Pr(>|Z|)
 Intercept        1.1912 0.1417 8.41   <0.0001
 DP_EDUCATION_BAN 0.0299 0.0259 1.15   0.2491
```


## "accuracy_bool", "DP_EDUCATION_BAN", "DP_GENAGE"

```
Logistic Regression Model

 lrm(formula = accuracy_bool ~ ., data = dados_regressao, x = TRUE,
     y = TRUE)

                       Model Likelihood     Discrimination    Rank Discrim.
                          Ratio Test           Indexes           Indexes
 Obs          4135    LR chi2      21.90    R2       0.008    C       0.554
  False        852    d.f.             2    g        0.206    Dxy     0.108
  True        3283    Pr(> chi2) <0.0001    gr       1.229    gamma   0.115
 max |deriv| 5e-13                          gp       0.034    tau-a   0.035
                                            Brier    0.163

                  Coef    S.E.   Wald Z Pr(>|Z|)
 Intercept         1.6715 0.1788  9.35  <0.0001
 DP_EDUCATION_BAN  0.0060 0.0266  0.22  0.8221
 DP_GENAGE        -0.1029 0.0227 -4.53  <0.0001
```

## "accuracy_bool", "DP_HISPANIC_BAN"

```
Logistic Regression Model

 lrm(formula = accuracy_bool ~ ., data = dados_regressao, x = TRUE,
     y = TRUE)

                      Model Likelihood     Discrimination    Rank Discrim.
                         Ratio Test           Indexes           Indexes
 Obs          4135    LR chi2     11.20    R2       0.004    C       0.518
  False        852    d.f.            1    g        0.079    Dxy     0.035
  True        3283    Pr(> chi2) 0.0008    gr       1.082    gamma   0.236
 max |deriv| 3e-12                         gp       0.012    tau-a   0.012
                                           Brier    0.163

                 Coef    S.E.   Wald Z Pr(>|Z|)
 Intercept        2.2734 0.2914  7.80  <0.0001
 DP_HISPANIC_BAN -0.4778 0.1484 -3.22  0.0013
```
