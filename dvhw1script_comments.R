## Data Visualization ICPSR Summer 2021> 
## Intro to R, Part 1 & 2> 
## Name: Sarah Warren
## Date: June 23

#################### TA NOTES ###########################################
# Rubric: 1 Question = 2 Points; 34 questions total
# TA: Shana (email sscogin@nd.edu with questions)
#
# Comments: This looks perfect - perhaps this one was all 
# review for you? Let us know if you had questions. Just one comment on
# the matrix question - I think you have yours inverted from what Robert
# did - clearly you got the right answer and understand all the 
# operations, so I don't think it matters, but I'll post his code so you
# can see what happens if one did it another way:
#
# # e. Add Neville and Jenny to the matrix. 
# new_grades <- c(81, 80, 78, 92, 87, 84)
# otherwiz <- matrix(new_grades, ncol = 3, byrow = TRUE) ### HERE HE HAS NCOL = 3
# avg2 <- rowMeans(otherwiz)
# otherwiz2 <- cbind(otherwiz, avg2); otherwiz2
# colnames(otherwiz2) <- c("test1", "test2", "test3", "avg")
# rownames(otherwiz2) <- c("Neville", "Jenny")
# otherwiz2
# 
# # f. Bind Neville and Jenny to the other wizard matrix. 
# 
# all_wiz_scores <- rbind(wiz_scores2, otherwiz2); all_wiz_scores
# all_wiz_scores
# 
# # g. Extract Hermione's 2nd and 3rd scores with matrix subsetting. 
# 
# all_wiz_scores["Hermione", c(2,3)] # More than one way to do this correctly. 
# 
# # h. Eliminate test 2 from the test matrix. RECALCULATE AVERAGES. 
# 
# # Rename to 'all_wiz_sub' in the HW instructions. 
# 
# all_wiz_sub <- all_wiz_scores[,-c(2,4)]; all_wiz_sub
# new_avg <- rowMeans(all_wiz_sub) # Create new average. 
# all_wiz_sub2 <- cbind(all_wiz_sub, new_avg); all_wiz_sub2
# 
# # i. Change Neville's test3 to a 98. 
# # ADD RECALCULATE AVERAGE SCORES TO INSTRUCTIONS. 
# 
# all_wiz_sub2[4,2] <- 98; all_wiz_sub2
# all_wiz_sub2[,3] <- rowMeans(all_wiz_sub2[,-3])
# all_wiz_sub2
#
# Let me know if you have any questions!
# GRADE: 68/68
#########################################################################

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