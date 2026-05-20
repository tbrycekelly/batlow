# Regenerate `data/palette.rda` from the Scientific Colour Maps source files.
# Download and extract the upstream archive into `data-raw/ScientificColourMaps8/`
# before running this script.

input_dir <- file.path("data-raw", "ScientificColourMaps8")

if (!dir.exists(input_dir)) {
  stop("Expected palette source files in `", input_dir, "`.", call. = FALSE)
}

palette_paths <- list.files(
  input_dir,
  pattern = "\\.txt$",
  full.names = TRUE,
  recursive = TRUE
)
palette_paths <- palette_paths[!grepl("Discrete", palette_paths)]
palette_paths <- palette_paths[!grepl("CategoricalPalettes", palette_paths)]

make_palette <- function(path) {
  rgb_values <- read.table(
    path,
    header = FALSE,
    col.names = c("R", "G", "B")
  )

  grDevices::rgb(rgb_values$R, rgb_values$G, rgb_values$B)
}

palette <- list()

for (path in palette_paths) {
  name <- basename(path)
  name <- sub("\\.txt$", "", name)
  palette[[name]] <- make_palette(path)
}

save(
  palette,
  file = file.path("data", "palette.rda"),
  compress = "bzip2",
  version = 2
)
