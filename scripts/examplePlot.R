# Purpose: Create a sample scatterplot (A vs log10(C) by group D)
# and save it as a PNG to output/plots/demo/, using the script filename as the image name.

## ------------------------------------------------------------
## 1. Create sample data 
## ------------------------------------------------------------

set.seed(123)  # For reproducible random data
mydata <- data.frame(
  A = sample(1:50, 20),                      # x-variable (numeric)
  B = sample(1:15, 20, replace = TRUE),
  C = sample(1:20, 20, replace = TRUE),      # y-variable (numeric, >0)
  D = sample(c("a", "b", "c"), 20, replace = TRUE)  # Group factor for shapes
)

## ------------------------------------------------------------
## 2. Build ggplot object with custom theme and shapes
## ------------------------------------------------------------

p <- ggplot(mydata, aes(x = A, y = C)) + 
  geom_point(aes(shape = D), size = 4, color = "#7C4DFF") + 
  scale_shape_manual(values = c(
    "a" = 1,   # open circle
    "b" = 16,  # filled circle
    "c" = 15   # filled square
  )) +
  scale_y_log10() + 
  theme_minimal(base_size = 11) +
  labs(
    title    = "Scatterplot of A vs Log10(C) by Group",
    subtitle = "Each point is one observation (groups: a, b, c)",
    x        = "Label A Index",
    y        = "Log10(C)",
    caption  = "Figure 1: Log-scaled scatterplot by group D"
  ) +
  theme(
    plot.background  = element_rect(fill = "white", colour = NA),
    panel.background = element_rect(fill = "white", colour = "black", size = 0.6),
    panel.grid.major = element_line(color = "#E0E0E0"),
    panel.grid.minor = element_blank(),
    plot.title    = element_text(hjust = 0.5, size = 13, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 11, color = "#546E7A"),
    plot.caption  = element_text(hjust = 0,  size = 9,  color = "#78909C"),
    axis.title = element_text(size = 11, face = "bold"),
    axis.text  = element_text(size = 10),
    plot.margin = margin(t = 8, r = 8, b = 8, l = 8)
  )

print(p)  # optional when run non-interactively

## ------------------------------------------------------------
## 3. Ensure output directory exists (output/plots/demo)
## ------------------------------------------------------------

out_dir <- file.path("output", "plots", "demo")
if (!dir.exists(out_dir)) {
  dir.create(out_dir, recursive = TRUE)
}

## ------------------------------------------------------------
## 4. Determine script base name for image filename
## ------------------------------------------------------------

script_base <- "exampledemo"

img_file <- file.path(out_dir, paste0(script_base, ".png"))

## ------------------------------------------------------------
## 5. Save plot to disk with controlled size and resolution
## ------------------------------------------------------------

ggsave(
  filename = img_file,
  plot     = p,
  width    = 6,
  height   = 4,
  units    = "in",
  dpi      = 300
)

message("Output is Saved plot to: ", img_file)
