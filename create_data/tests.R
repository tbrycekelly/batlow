
pals::pal.bands(acton, bamako, batlow, batlowK, batlowK, bilbao, buda, davos, devon, grayC, glasgow,
                main = 'Sequential Color Palettes (Page 1)')

pals::pal.bands(hawaii, imola, lajolla, lipari, lapaz, navia, naviaW, oslo, tokyo, turku,
                main = 'Sequential Color Palettes (Page 2)')

pals::pal.bands(bam, bam0, broc, broc0, cork, corkO,
                roma, romaO, vik,vikO,
                main = 'Divergent Color Palettes (Page 1)')

pals::pal.bands(berlin, lisbon, managua, tofino, vanimo,
                main = 'Divergent Color Palettes (Page 2)')

pals::pal.bands(bukavu, fes, oleron,
                main = 'Other Color Palettes')



pals::pal.test(glasgow)


library(SimpleMapper)
library(SimpleBathy)

map = plotBasemap(lat = 60, lon = -150, scale = 2e3, land.col = '#00000000')
map = addBathy(map, zlim = c(-3e3, 3e3), pal = oleron(256))
map = addCoastline(map)
map = addRelief(map)
