The Central Limit Theorem Show!
========================================================
author: Alicia Rodriguez
date: 04/29/2017
autosize: true
transition: rotate

Goal
========================================================

One of the main concepts in statistics is the well-known 
**Central Limit Theorem (CLT)**.

It establishes that, given certain conditions, the arithmetic mean of a sufficiently large number of independent random variables, will be approximately normally distributed, regardless of the underlying distribution.

The goal of the application presented is to visually demonstrate this theorem.

CLT Example
========================================================
Let's see a small example with an exponential distribution, comparing:
- 1 random variable (1000 samples), with respect to 
- the summation of 40 independent random variables (1000 samples each)

```r
set.seed(123456)
expsamples1<-matrix(rexp(rate=0.2, n=1*1000),1000,1)
expsamples40<-matrix(rexp(rate=0.2, n=40*1000),1000,40)

expmean1<-apply(expsamples1, 1, mean)
expmean40<-apply(expsamples40, 1, mean)
```

CLT Example Plot
========================================================
<small>Next observe the exponential shape of the 1 random variable (left), and the normal shape of the addition of 40 random variables (right).</small>

<img src="reproPitch-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

Try it out yourself! 
========================================================
Go to <a href="https://arcarrion.shinyapps.io/FinalAssignment/">the app</a> to try this out yourself, testing:
  - different distributions (normal, exponential, uniform)
  - different number of independent random variables (from 1 to 100)

and observe how each distribution behaves as the number of variables change.

**There is no better way to observe the Central Limit Theorem!**
