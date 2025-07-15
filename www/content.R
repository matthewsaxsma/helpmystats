content_random_variables1 <-
  "<p>Random variables are map the sample space of a random process
  to a real number.
  <br><br>Consider tossing two die. The <i>sample space</i>
  is the set of all possible outcomes of tossing the two die.
  For example, the first die might be a 3 and the second a 5."


content_random_variables2 <-
  "<br>With this sample space, we can define a random variable
  such as the sum of the two die.
  Now the sample space is the set of all possible sums of the two die,
  which is the set of integeers from 2 to 12."


content_normal <-  "<p>Distributions mathematically describe 
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

content_sample_est <- "<p>Distributions like the normal distribution are 
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