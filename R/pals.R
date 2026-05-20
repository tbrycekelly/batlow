# Internal cache for palette data so wrappers work via `batlow::foo()`
# without requiring the package to be attached.
.batlow_env <- new.env(parent = emptyenv())

.get_palette_data <- function() {
  if (!exists("palette", envir = .batlow_env, inherits = FALSE)) {
    utils::data("palette", package = "batlow", envir = .batlow_env)
  }

  if (!exists("palette", envir = .batlow_env, inherits = FALSE)) {
    stop("Could not load `palette` data from the batlow package.", call. = FALSE)
  }

  get("palette", envir = .batlow_env, inherits = FALSE)
}

.validate_n <- function(n) {
  if (!is.numeric(n) || length(n) != 1L || is.na(n) || !is.finite(n) ||
      n < 0 || n > .Machine$integer.max || n != trunc(n)) {
    stop("`n` must be a single non-negative integer.", call. = FALSE)
  }

  as.integer(n)
}

.palette_wrapper <- function(name, n) {
  dat <- .get_palette_data()[[name]]

  if (is.null(dat)) {
    stop("Unknown palette `", name, "`.", call. = FALSE)
  }

  n <- .validate_n(n)

  grDevices::colorRampPalette(dat)(n)
}

#' Batlow Palette Functions
#'
#' Generate a vector of colors from one of the included batlow palettes.
#'
#' @name batlow_palettes
#' @param n A single non-negative integer giving the number of colors to
#'   generate.
#' @return A character vector of hex colors.
#' @examples
#' acton(8)
#' batlow(16)
#' vik(32)
NULL

#' @rdname batlow_palettes
#' @export
acton <- function(n) .palette_wrapper("acton", n)

#' @rdname batlow_palettes
#' @export
bam <- function(n) .palette_wrapper("bam", n)

#' @rdname batlow_palettes
#' @export
bam0 <- function(n) .palette_wrapper("bamO", n)

#' @rdname batlow_palettes
#' @export
bamako <- function(n) .palette_wrapper("bamako", n)

#' @rdname batlow_palettes
#' @export
batlow <- function(n) .palette_wrapper("batlow", n)

#' @rdname batlow_palettes
#' @export
batlowK <- function(n) .palette_wrapper("batlowK", n)

#' @rdname batlow_palettes
#' @export
batlowW <- function(n) .palette_wrapper("batlowW", n)

#' @rdname batlow_palettes
#' @export
berlin <- function(n) .palette_wrapper("berlin", n)

#' @rdname batlow_palettes
#' @export
bilbao <- function(n) .palette_wrapper("bilbao", n)

#' @rdname batlow_palettes
#' @export
broc <- function(n) .palette_wrapper("broc", n)

#' @rdname batlow_palettes
#' @export
broc0 <- function(n) .palette_wrapper("brocO", n)

#' @rdname batlow_palettes
#' @export
buda <- function(n) .palette_wrapper("buda", n)

#' @rdname batlow_palettes
#' @export
bukavu <- function(n) .palette_wrapper("bukavu", n)

#' @rdname batlow_palettes
#' @export
cork <- function(n) .palette_wrapper("cork", n)

#' @rdname batlow_palettes
#' @export
corkO <- function(n) .palette_wrapper("corkO", n)

#' @rdname batlow_palettes
#' @export
davos <- function(n) .palette_wrapper("davos", n)

#' @rdname batlow_palettes
#' @export
devon <- function(n) .palette_wrapper("devon", n)

#' @rdname batlow_palettes
#' @export
fes <- function(n) .palette_wrapper("fes", n)

#' @rdname batlow_palettes
#' @export
glasgow <- function(n) .palette_wrapper("glasgow", n)

#' @rdname batlow_palettes
#' @export
grayC <- function(n) .palette_wrapper("grayC", n)

#' @rdname batlow_palettes
#' @export
hawaii <- function(n) .palette_wrapper("hawaii", n)

#' @rdname batlow_palettes
#' @export
imola <- function(n) .palette_wrapper("imola", n)

#' @rdname batlow_palettes
#' @export
lajolla <- function(n) .palette_wrapper("lajolla", n)

#' @rdname batlow_palettes
#' @export
lapaz <- function(n) .palette_wrapper("lapaz", n)

#' @rdname batlow_palettes
#' @export
lipari <- function(n) .palette_wrapper("lipari", n)

#' @rdname batlow_palettes
#' @export
lisbon <- function(n) .palette_wrapper("lisbon", n)

#' @rdname batlow_palettes
#' @export
managua <- function(n) .palette_wrapper("managua", n)

#' @rdname batlow_palettes
#' @export
navia <- function(n) .palette_wrapper("navia", n)

#' @rdname batlow_palettes
#' @export
naviaW <- function(n) .palette_wrapper("naviaW", n)

#' @rdname batlow_palettes
#' @export
nuuk <- function(n) .palette_wrapper("nuuk", n)

#' @rdname batlow_palettes
#' @export
oleron <- function(n) .palette_wrapper("oleron", n)

#' @rdname batlow_palettes
#' @export
oslo <- function(n) .palette_wrapper("oslo", n)

#' @rdname batlow_palettes
#' @export
roma <- function(n) .palette_wrapper("roma", n)

#' @rdname batlow_palettes
#' @export
romaO <- function(n) .palette_wrapper("romaO", n)

#' @rdname batlow_palettes
#' @export
tofino <- function(n) .palette_wrapper("tofino", n)

#' @rdname batlow_palettes
#' @export
tokyo <- function(n) .palette_wrapper("tokyo", n)

#' @rdname batlow_palettes
#' @export
turku <- function(n) .palette_wrapper("turku", n)

#' @rdname batlow_palettes
#' @export
vanimo <- function(n) .palette_wrapper("vanimo", n)

#' @rdname batlow_palettes
#' @export
vik <- function(n) .palette_wrapper("vik", n)

#' @rdname batlow_palettes
#' @export
vikO <- function(n) .palette_wrapper("vikO", n)
