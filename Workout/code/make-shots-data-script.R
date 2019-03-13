print("Title: Shot-data")
print("Description: Data on shots made for GSW")
print("Inputs: Data on Curry, Andre, Kevin, Draymond, and Klay")
print("Outputs: Merged shot data, summary of data")

curry <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/stephen-curry.csv", header = TRUE, sep = ",")
andre <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/andre-iguodala.csv", header = TRUE, sep = ",")
kevin <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/kevin-durant.csv", header = TRUE, sep = ",")
draymond <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/draymond-green.csv", header = TRUE, sep = ",")
klay <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/klay-thompson.csv", header = TRUE, sep = ",")

curry <- mutate(curry, name = "Stephen Curry")
andre <- mutate(andre, name = "Andre Iguodala")
kevin <- mutate(kevin, name = "Kevin Durant")
draymond <- mutate(draymond, name = "Draymond Green")
klay <- mutate(klay, name = "Klay Thompson")

levels(curry$shot_made_flag) <- c(levels(curry$shot_made_flag), "shot_yes", "shot_no")
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
levels(andre$shot_made_flag) <- c(levels(andre$shot_made_flag), "shot_yes", "shot_no")
andre$shot_made_flag[andre$shot_made_flag == "y"] <- "shot_yes"
andre$shot_made_flag[andre$shot_made_flag == "n"] <- "shot_no"
levels(kevin$shot_made_flag) <- c(levels(kevin$shot_made_flag), "shot_yes", "shot_no")
kevin$shot_made_flag[kevin$shot_made_flag == "y"] <- "shot_yes"
kevin$shot_made_flag[kevin$shot_made_flag == "n"] <- "shot_no"
levels(draymond$shot_made_flag) <- c(levels(draymond$shot_made_flag), "shot_yes", "shot_no")
draymond$shot_made_flag[draymond$shot_made_flag == "y"] <- "shot_yes"
draymond$shot_made_flag[draymond$shot_made_flag == "n"] <- "shot_no"
levels(klay$shot_made_flag) <- c(levels(klay$shot_made_flag), "shot_yes", "shot_no")
klay$shot_made_flag[klay$shot_made_flag == "y"] <- "shot_yes"
klay$shot_made_flag[klay$shot_made_flag == "n"] <- "shot_no"

curry <- mutate(curry, minute = (curry$period * 12) - curry$minutes_remaining)
andre <- mutate(andre, minute = (andre$period * 12) - andre$minutes_remaining)
kevin <- mutate(kevin, minute = (kevin$period * 12) - kevin$minutes_remaining)
draymond <- mutate(draymond, minute = (draymond$period * 12) - draymond$minutes_remaining)
klay <- mutate(klay, minute = (klay$period * 12) - klay$minutes_remaining)

sink(file = '/Users/yusheng/Desktop/stat133/Workout01/output/stephen-curry-summary.txt')
summary(curry)
sink()
sink(file = '/Users/yusheng/Desktop/stat133/Workout01/output/andre-iguodala-summary.txt')
summary(andre)
sink()
sink(file = '/Users/yusheng/Desktop/stat133/Workout01/output/kevin-durant-summary.txt')
summary(kevin)
sink()
sink(file = '/Users/yusheng/Desktop/stat133/Workout01/output/draymond-green-summary.txt')
summary(draymond)
sink()
sink(file = '/Users/yusheng/Desktop/stat133/Workout01/output/klay-thompson-summary.txt')
summary(klay)
sink()

shots_data <- rbind(curry, andre, kevin, draymond, klay)
write.csv(x = shots_data, file = '/Users/yusheng/Desktop/stat133/Workout01/data/shots-data.csv')
sink(file = '/Users/yusheng/Desktop/stat133/Workout01/output/shots-data-summary.txt')
summary(shots_data)
sink()