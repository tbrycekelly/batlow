palette_map <- c(
  acton = "acton",
  bam = "bam",
  bam0 = "bamO",
  bamako = "bamako",
  batlow = "batlow",
  batlowK = "batlowK",
  batlowW = "batlowW",
  berlin = "berlin",
  bilbao = "bilbao",
  broc = "broc",
  broc0 = "brocO",
  buda = "buda",
  bukavu = "bukavu",
  cork = "cork",
  corkO = "corkO",
  davos = "davos",
  devon = "devon",
  fes = "fes",
  glasgow = "glasgow",
  grayC = "grayC",
  hawaii = "hawaii",
  imola = "imola",
  lajolla = "lajolla",
  lapaz = "lapaz",
  lipari = "lipari",
  lisbon = "lisbon",
  managua = "managua",
  navia = "navia",
  naviaW = "naviaW",
  nuuk = "nuuk",
  oleron = "oleron",
  oslo = "oslo",
  roma = "roma",
  romaO = "romaO",
  tofino = "tofino",
  tokyo = "tokyo",
  turku = "turku",
  vanimo = "vanimo",
  vik = "vik",
  vikO = "vikO"
)

get_palette_data <- function() {
  env <- new.env(parent = emptyenv())
  utils::data("palette", package = "batlow", envir = env)
  env$palette
}

test_that("exported palette data has the expected structure", {
  palette_data <- get_palette_data()

  expect_type(palette_data, "list")
  expect_equal(length(palette_data), 40)
  expect_setequal(names(palette_data), unname(palette_map))
  expect_true(all(vapply(palette_data, length, integer(1)) == 256))
})

test_that("palette wrappers work through the namespace without attaching the package", {
  palette_data <- get_palette_data()

  for (fn_name in names(palette_map)) {
    wrapper <- getExportedValue("batlow", fn_name)
    palette_name <- unname(palette_map[[fn_name]])
    expected <- grDevices::colorRampPalette(palette_data[[palette_name]])(7)

    expect_identical(wrapper(7), expected, info = fn_name)
  }
})

test_that("palette wrappers return valid hex colors at requested lengths", {
  for (fn_name in names(palette_map)) {
    wrapper <- getExportedValue("batlow", fn_name)
    cols <- wrapper(5)

    expect_equal(length(cols), 5, info = fn_name)
    expect_true(
      all(grepl("^#[0-9A-F]{6}$", cols)),
      info = fn_name
    )
  }
})

test_that("palette wrappers handle zero-length requests", {
  expect_identical(getExportedValue("batlow", "acton")(0), character())
  expect_identical(getExportedValue("batlow", "vik")(0), character())
})

test_that("palette wrappers reject invalid `n` values", {
  invalid_n <- list(-1, 1.5, NA_real_, Inf, .Machine$integer.max + 1, "a", c(1, 2))

  for (n in invalid_n) {
    expect_error(
      getExportedValue("batlow", "acton")(n),
      "`n` must be a single non-negative integer."
    )
  }
})
