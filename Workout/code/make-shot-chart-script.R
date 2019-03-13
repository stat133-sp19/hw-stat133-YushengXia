print("Title: Shot-chart")
print("Description: Charts on shots made for GSW")
print("Inputs: Data on Combines shots, Curry, Andre, Kevin, Draymond, and Klay")
print("Outputs: Merged shot chart images")

curry <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/stephen-curry.csv", header = TRUE, sep = ",")
andre <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/andre-iguodala.csv", header = TRUE, sep = ",")
kevin <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/kevin-durant.csv", header = TRUE, sep = ",")
draymond <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/draymond-green.csv", header = TRUE, sep = ",")
klay <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/klay-thompson.csv", header = TRUE, sep = ",")

court_file <- "/Users/yusheng/Desktop/stat133/Workout01/images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry') +
  theme_minimal()
ggsave('/Users/yusheng/Desktop/stat133/Workout01/images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)

andre_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala') +
  theme_minimal()
ggsave('/Users/yusheng/Desktop/stat133/Workout01/images/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5)

kevin_shot_chart <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant') +
  theme_minimal()
ggsave('/Users/yusheng/Desktop/stat133/Workout01/images/kevin-durant-shot-chart.pdf', width = 6.5, height = 5)

draymond_shot_chart <- ggplot(data = draymond) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green') +
  theme_minimal()
ggsave('/Users/yusheng/Desktop/stat133/Workout01/images/draymond-green-shot-chart.pdf', width = 6.5, height = 5)

klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson') +
  theme_minimal()
ggsave('/Users/yusheng/Desktop/stat133/Workout01/images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)

shots_data <- read.csv(file = "/Users/yusheng/Desktop/stat133/Workout01/data/shots-data.csv", header = TRUE, sep = ",")
gsw_shot_chart <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Golden State Warriors') +
  theme_minimal() + facet_wrap(~name)
ggsave('/Users/yusheng/Desktop/stat133/Workout01/images/gsw-shot-chart.pdf', width = 8, height = 7)
ggsave('/Users/yusheng/Desktop/stat133/Workout01/images/gsw-shot-chart.png', width = 8, height = 7)
