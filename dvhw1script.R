## Data Visualization ICPSR Summer 2021> 
## Intro to R, Part 1 & 2> 
## Name: Sarah Warren
## Date: June 23

#1
Harry <- 50
print(Harry)

Hermione <- 47
print(Hermione)

Ron <- 44
print(Ron)

Jenny <- 40
print(Jenny)

Harry + Jenny > Ron + Hermione

Snape <- 49
print(Snape)

Voldemort <- 1/50

Harry*Voldemort

#2
7546 + 9918
3467-8493
(37*47) + 30
(3+67)*(8-29)
(23/53) + 656
74^2 # or 74*74
999 %% 7

# 3
wizards1 <- c(Harry, Hermione)
print(wizards1)
wizards2 <- c(Jenny, Ron)
print(wizards2)
wizards <- c(wizards1, wizards2)
print(wizards)
names(wizards) <- c("Harry", "Hermione", "Jenny", "Ron")
print(wizards)

remove(Snape, Voldemort)
Snape
Voldemort
#errors as expected

wizards[3] # Extract Jenny's values
wizards[c(2,4)]
wizards[2:4]
wizards < 45

#4
scores <- c(75,49, 68, 83, 97, 91, 98, 89, 91)
wizscores <- matrix(scores, nrow=3, ncol=3, byrow=TRUE); wizscores
rownames(wizscores) <- c("test1", "test2", "test3")
colnames(wizscores) <- c("Ron", "Harry", "Hermione")
print(wizscores)

av <- colMeans(wizscores); av
wizscores2 <- rbind(wizscores, av); wizscores2
rownames(wizscores2) <- c("test1", "test2", "test3", "average")

scores2 <- c(81,  80,  78,  92,  87, 84)
otherwiz <- matrix(scores2, nrow=3, ncol=2, byrow=TRUE); otherwiz
rownames(otherwiz) <- c("test1", "test2", "test3")
colnames(otherwiz) <- c("Neville", "Jenny")
av2 <- colMeans(otherwiz); av2
otherwiz <- rbind(otherwiz, av2); otherwiz
rownames(otherwiz) <- c("test1", "test2", "test3", "average"); otherwiz

all_wiz_scores <- cbind(otherwiz, wizscores2); all_wiz_scores

all_wiz_scores[2:3,5]

matrixwiz_scores2 <- all_wiz_scores[-2,][-3,]; matrixwiz_scores2
thenewavg <- colMeans(matrixwiz_scores2); thenewavg
matrixwiz_scores2 <- rbind(matrixwiz_scores2, thenewavg); matrixwiz_scores2


matrixwiz_scores2[2, 1] <- 98; matrixwiz_scores2
matrixwiz_scores2 <- matrixwiz_scores2[-3,]; matrixwiz_scores2
finalavg <- colMeans(matrixwiz_scores2); finalavg
matrixwiz_scores2 <- rbind(matrixwiz_scores2, finalavg); matrixwiz_scores2