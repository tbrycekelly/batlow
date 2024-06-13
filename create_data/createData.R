## Create color palettes from Crameri, F. (2023). Scientific colour maps (8.0.1). Zenodo. https://doi.org/10.5281/zenodo.8409685



input = '~/Downloads/ScientificColourMaps8/'

pals = list.files(input, '.txt', full.names = T, recursive = T)
pals = pals[!grepl('Discrete', pals)]
pals = pals[!grepl('CategoricalPalettes', pals)]


makePal = function(path) {
  tmp = read.table(path, header = F, col.names = c('R', 'G', 'B'))
  col = rgb(tmp$R, tmp$G, tmp$B)
}

palette = list()

for (p in pals) {
  name = strsplit(p, '/')[[1]]
  name = name[length(name)]
  name = gsub('.txt', '', name)

  pal = makePal(p)
  palette[[name]] = pal
}

save(palette, file = 'data/palette.rda')
