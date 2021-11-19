library(targets)
create_plot <- function(data) {
    ggplot(data) + geom_histogram(aes(x = Ozone), bins = 10) + 
        theme_gray(24)
}
