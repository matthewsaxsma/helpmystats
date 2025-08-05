content_random_variables1 <-
  "<h2 style='text-align: center;'>Random Variables</h1>
  
  
  <p>Random variables map the sample space of a random process
  to a real number.
  <br><br>Consider tossing two die. 
  Let's <i>assume</i> that these are fair die, so each roll of each die has an equal chance of being any number from 1 to 6.
  We can think of this as a <i>random process</i>, because
  we don't know what the outcome will be when we roll the die! <br><br> The <i>sample space</i>
  of rolling two die is the set of all possible outcomes.
  For example, the first die might be a 5 and the second a 3. 
  On another roll, the first die might be a 2 and the second a 1."


content_random_variables2 <-
  "If we assume the die are fair, each combination of two die has an equal chance of occurring.
The outcome (Die 1 = 5, Die 2 = 3) has the same chance of occurring as (Die 1 = 2, Die 2 = 1).
<br><br>


With this sample space, we can define a random variable
  such as the sum of the two die.
  Now the sample space is the set of all possible sums of the two die,
  which is the set of integers from 2 to 12."


content_random_variables3 <- "<br><br>
Notice that different outcomes can
yield the same sum. We can depict the sample space of the <i>sum</i> of two die graphically with a bar chart. <br><br>

Assuming the die are fair,
 when we roll two die, we would expect for the sum of two die to be 6, 7, or 8 more often than 2, 3, 11, or 12.
</p>"


content_statistics1 <- 
"Now, we arrive at an important definition.
A <b>statistic</b> is a function of a random variable.
In our dice example, we defined our random variable as the sum of two die. <br><br>
Let's bring in the average as a function. Recall that an average is the sum of the quantities you are averaging,
 divided by the number of quantities you are averaging.
We have sums of two die, so let's take their average. I will write it out in long format so the concept is clear:
"




content_normal <-  "
<h2 style='text-align: center;'>Distributions</h1>
<p>Distributions mathematically describe 
how values of a random variable are distributed
<p>

One of the most widely used and important distributions 
in statistics is the 
<a href='https://en.wikipedia.org/wiki/Normal_distribution' target=_blank style='text-decoration: none;'>normal distribution.</a>
The distribution of a normal random variable is defined with two parameters: 
the mean, and the standard deviation.<br><br>

The mean is the center of the distribution. 
It is the value the distribution is centered on.
It is typically represented with a \u03bc.
The standard deviaton quantifies how wide the distribution is.
It is typically represented with a \u03c3.<br><br>

A normal distribution with \u03bc = 0 and 
\u03c3 = 1 is called a standard normal distribution.</p>"


content_chisq <- 
"<p> The <a href='https://en.wikipedia.org/wiki/Chi-squared_distribution' target=_blank style='text-decoration: none;'>chi-squared distribution</a> is another common distribution
used in statistical analysis. 
It is a positive distribution, which means it only takes on values greater than or equal to zero. 
It is defined by a single parameter, the degrees of freedom.
Degrees of freedom is often represented with <i>df</i> or the letter \u03bd (nu).<br><br>
"

content_sample_est <- "
<h2 style='text-align: center;'>Sample Estimates</h1>

<p>Distributions like the normal distribution are 
theoretical entities. 

This means we cannot know the true parameter values given a finite set
 of data.<br><br>

However, we can estimate them using special methods. 
These methods include 'maximum likelihood' and 'method of moments'. 
We will come back to these terms in a later section.<br><br>

For now, just know that we can often estimate the expected value 
of a distribution (like the mean of a normal distribution)
by adding up our observations 
and dividing by the number of observations we have.</p> "

content_sampling_dist <- ""