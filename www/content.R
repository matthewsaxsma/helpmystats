# RANDOM VARIABLES

content_random_variables1 <-
  "<h2 style='text-align: center;'>Random Variables</h2>
  
  <p>Random variables map the sample space of a random process to a real number. There are two broad kinds: discrete and continuous random variables. 
  <br><br>
Consider tossing two die. 
  Let's <i>assume</i> that these are fair die, so each roll of each die has an equal chance of being any number from 1 to 6.
  We can think of this as a <i>random process</i>, because
  we don't know what the outcome will be when we roll the die! <br><br> The <i>sample space</i>
  of rolling two die is the set of all possible outcomes.
  For example, the first die might be a 5 and the second a 3. On another roll, the first die might be a 2 and the second a 1."


content_random_variables2 <-
  "If we assume the die are fair, each combination of two die has an equal chance of occurring.
The outcome (Die 1 = 5, Die 2 = 3) has the same chance of occurring as (Die 1 = 2, Die 2 = 1).
<br><br>


With this sample space, we can define a random variable
  such as the sum of the two die.
  Now the sample space is the set of all possible sums of the two die,
  which is the set of integers from 2 to 12. Because the set of the outcomes of this random variable can be counted, it is a discrete random variable."


content_random_variables3 <- "<br><br>
Notice that different outcomes can
yield the same sum. There are many ways to present the outcomes of sum two die. For example, we can depict the sample space of the sum of two die graphically with a bar chart: <br><br>
</p>"



content_disc_ex <- "So, how do you use the idea of random variables in the real world, perhaps for something more interesting that tossing die??
<br><br>
Most anything that you can think of as a process which has outcomes that aren't predetermined can be considered a random variable. The number of dogs you see each day while walking on the sidewalk? Random variable. The number of minutes each NBA game this season lasts? Random variable. The number of times labubus pop up on your social media feed each hour? That can be a random variable.
<br><br>
Here's a kind of phenomenon that a lot of social and behavioral scientists treat as a random variable: survey responses.
<br>
Imagine I want to include the statement 'I am very satisfied with my life right now' in a survey. The people who take the survey can select one of the following options:<br><br>

1. Strongly disagree <br>
2. Disagree <br>
3. Neither agree nor disagree <br>
4. Agree <br>
5. Strongly agree <br><br>

Since I don't know how people will respond to this survey item until I give it to them, we can think of the responses to this survey item as a random variable. Each element of the sample space (Strongly disagree, Disagree, etc.) is mapped onto a real number (1, 2, etc.).
<br><br><br><br>
"






# DISTRIBUTIONS

content_distributions1 <- "
<h2 style='text-align: center;'>Distributions</h2>

Random variables let us begin to think statistically about things in the real world. But we still need some more concepts before really applying these concepts. Let's revisit that simple two-die example."

content_distributions2 <- "This bar chart nicely shows the <i>distribution</i> of the sum of two die rolls. A distribution describes the sample space of a random variable (x-axis of the barchart) and the probability measure each of element in the sample space (y-axis of the barchart). For a discrete random variable like this, this probability measure is called the mass.

<br><br>
So, what information is contained in the ditribution? We can see that the sum 7 has the tallest bar. This means that 7 is the most probable value of the random variable. Sums of 2 and 12 are the least probable values. This makes sense right? There are 36 unique combinations of 2 die, but how many of them yield a sum of 2?
"



content_normal <-  "
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




content_statistics1 <- 
"<h2 style='text-align: center;'>Statistics</h2>

<p>Now, we arrive at an important definition.
A <b>statistic</b> is a function of a random variable.
In our dice example, we defined our random variable as the sum of two die. <br><br>

Let's take the average of this random variable. The average is our function Recall that an average is the sum of the quantities you are averaging,
divided by the number of quantities you are averaging.
We have sums of two die, so let's take their average. I will write it out in long format so the concept is clear:
"
