# Reproducible research: version control and R

Reproducible research assignment Q1-3 answers

****

See logistic_growth repo:
https://github.com/1075082/logistic_growth

****

Reproducible research assignment Q4 & 5 answers

****

**Question 4**

1. A script for simulating a random walk is provided in the question-4-code folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)

The code simulates 2 random walks and plots their paths. Each walk starts at (0,0) and takes 500 steps of length 0.25. When the code is executed, different paths are generated for the two walks despite their overall length being identical. This is because the angle of each step relative to its previous position is generated at random (between 0 and 2pi), and each walk was generated independently.

2. Investigate the term random seeds. What is a random seed and how does it work? (5 points)

A 'random seed' is the initial value used by a random number generator to produce a set of numbers. Using the same seed will always produce the same sequence of random numbers. This is important in ensuring reproducibility because they allow others to generate the exact same sequence of random numbers, leading to identical results in simulations or experiments if run again.

3. Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked reproducible-research homework repo. (10 points)

**_insert link to random_walk from question 4 code_**

4. Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the README.md of the fork). (5 points)

<img width="1134" alt="image" src="https://github.com/user-attachments/assets/172dd4a3-b163-44b7-822a-2e6f058430cc">

****

**Question 5** - see R code: https://github.com/1075082/reproducible-research_homework/blob/dev/viroid_analysis.R

1. Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the question-5-data folder). How many rows and columns does the table have? (3 points)

There are 33 rows and 13 columns in the table.

2. What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)

A log transformation can be applied as it results in a trend that appears close to linear.

3. Find the exponent (β) and scaling factor (α) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in Table 2 of the paper, did you find the same values? (10 points)

The relationship between virion volume (V) and genome length (L) is represented by the equation V = α(L^β). To linearise the equation the logarithm of both sides was taken, resulting in logV = logα + βlogL, where β is the gradient and logα is the intercept of the line. A linear model was then fitted to the log-transformed data to estimate β and logα. The following estimates were obtained:
   - **β = 1.5152**, p = 6.44e-10
   - **α = 1181.807** (logα = 7.0748), p = 2.28e-10

These values are identical to those found in the paper. 

4. Write the code to reproduce the figure shown below. (10 points)

https://github.com/1075082/reproducible-research_homework/blob/main/viroid_analysis.R

<img width="653" alt="image" src="https://github.com/user-attachments/assets/80b7f45d-aeba-4b00-b6d9-d36dffacc13d" />

5. What is the estimated volume of a 300 kb dsDNA virus? (4 points)

A 300kb dsDNA is estimated to have a volume of 6697000mm3.

https://github.com/1075082/reproducible-research_homework/blob/main/viroid_analysis.R

<img width="575" alt="image" src="https://github.com/user-attachments/assets/f96cf10b-97d2-4a79-ab92-9516a32f97ad" />

****

## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points. First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers (also make sure that your username has been anonymised). All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   a) A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points) \
   b) Investigate the term **random seeds**. What is a random seed and how does it work? (5 points) \
   c) Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points) \
   d) Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points) 

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \alpha L^{\beta}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   a) Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)\
   b) What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points) \
   c) Find the exponent ($\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points) \
   d) Write the code to reproduce the figure shown below. (10 points) 

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  e) What is the estimated volume of a 300 kb dsDNA virus? (4 points) 
