;; H1: conversion by human causing forest degradation due to e.g. logging, from primary forests into secondary forests or from secondary forests into shrubs
;; H2: conversion by human into agiculture
;; H3: conversion by human into plantation 
;; H4: conversion by human into settlement
;; N1: natural transition, from secondary forests into primary forests
;; N2: natural transition, from shrubs into secondary forest

extensions[gis]

globals
[
  ;;color-landuse
  
  change-area-file
  
  year
  starting-year
  time-list
  area-primary-forest
  area-secondary-forest
  area-shrubs
  area-plantation
  area-settlement
  area-water-body
  area-dryland-agriculture
  area-rice-field
  area-swamp
  
  scenario
  areaname
  resolution
  outputDir
  
  
  ;; raster-maps
  map-driver
  map-droad
  map-landuse
  map-tghk
  map-slope
  map-dplant
  map-dagr
  map-dset
  map-dem
  map-pop
  map-hdi
  map-dcenter
  map-dport
  map-equake

  
  mean-driver
  mean-droad
  mean-slope
  mean-dem
  mean-pop
  mean-hdi
  mean-dcenter
  mean-dport
  mean-equake
  mean-dplant
  mean-dagr
  mean-dset
  
  sd-dplant
  sd-dset
  sd-dagr
  sd-driver
  sd-droad
  sd-slope
  sd-dem
  sd-pop
  sd-hdi
  sd-dcenter
  sd-dport
  sd-equake
  
  
  ;;H1
  
  mean-natural-capital-H1
  mean-attractiveness-H1
  sd-natural-capital-H1
  sd-attractiveness-H1
  
  area-H1
  weight-cost-H1
  weight-benefit-H1
  
  frequency-attractiveness-H1-1
  frequency-attractiveness-H1-2
  frequency-attractiveness-H1-3
  frequency-attractiveness-H1-4
  frequency-attractiveness-H1-5
  frequency-attractiveness-H1-6
  frequency-attractiveness-H1-7
  frequency-attractiveness-H1-8
  frequency-attractiveness-H1-9
  frequency-attractiveness-H1-10
  
  probability-attractiveness-H1-1
  probability-attractiveness-H1-2
  probability-attractiveness-H1-3
  probability-attractiveness-H1-4
  probability-attractiveness-H1-5
  probability-attractiveness-H1-6
  probability-attractiveness-H1-7
  probability-attractiveness-H1-8
  probability-attractiveness-H1-9
  probability-attractiveness-H1-10
  
  ;;H2
  
  mean-natural-capital-H2
  mean-attractiveness-H2
  sd-natural-capital-H2
  sd-attractiveness-H2
  
  area-H2
  weight-cost-H2
  weight-benefit-H2
  
  frequency-attractiveness-H2-1
  frequency-attractiveness-H2-2
  frequency-attractiveness-H2-3
  frequency-attractiveness-H2-4
  frequency-attractiveness-H2-5
  frequency-attractiveness-H2-6
  frequency-attractiveness-H2-7
  frequency-attractiveness-H2-8
  frequency-attractiveness-H2-9
  frequency-attractiveness-H2-10
  
  probability-attractiveness-H2-1
  probability-attractiveness-H2-2
  probability-attractiveness-H2-3
  probability-attractiveness-H2-4
  probability-attractiveness-H2-5
  probability-attractiveness-H2-6
  probability-attractiveness-H2-7
  probability-attractiveness-H2-8
  probability-attractiveness-H2-9
  probability-attractiveness-H2-10
  
  ;;H3
  
  mean-natural-capital-H3
  mean-attractiveness-H3
  sd-natural-capital-H3
  sd-attractiveness-H3
  
  area-H3
  weight-cost-H3
  weight-benefit-H3
  
  frequency-attractiveness-H3-1
  frequency-attractiveness-H3-2
  frequency-attractiveness-H3-3
  frequency-attractiveness-H3-4
  frequency-attractiveness-H3-5
  frequency-attractiveness-H3-6
  frequency-attractiveness-H3-7
  frequency-attractiveness-H3-8
  frequency-attractiveness-H3-9
  frequency-attractiveness-H3-10
  
  probability-attractiveness-H3-1
  probability-attractiveness-H3-2
  probability-attractiveness-H3-3
  probability-attractiveness-H3-4
  probability-attractiveness-H3-5
  probability-attractiveness-H3-6
  probability-attractiveness-H3-7
  probability-attractiveness-H3-8
  probability-attractiveness-H3-9
  probability-attractiveness-H3-10
  
  ;;H4
  
  mean-natural-capital-H4
  mean-attractiveness-H4
  sd-natural-capital-H4
  sd-attractiveness-H4
  
  area-H4
  weight-cost-H4
  weight-benefit-H4
  
  frequency-attractiveness-H4-1
  frequency-attractiveness-H4-2
  frequency-attractiveness-H4-3
  frequency-attractiveness-H4-4
  frequency-attractiveness-H4-5
  frequency-attractiveness-H4-6
  frequency-attractiveness-H4-7
  frequency-attractiveness-H4-8
  frequency-attractiveness-H4-9
  frequency-attractiveness-H4-10
  
  probability-attractiveness-H4-1
  probability-attractiveness-H4-2
  probability-attractiveness-H4-3
  probability-attractiveness-H4-4
  probability-attractiveness-H4-5
  probability-attractiveness-H4-6
  probability-attractiveness-H4-7
  probability-attractiveness-H4-8
  probability-attractiveness-H4-9
  probability-attractiveness-H4-10
  
  ;;
  
  simulation-year
  
  initial-forest-age
  initial-agriculture-age
  initial-plantation-age
  
  cell-area
  cell-size
  distance-upper-limit
]

patches-own
[
  value-driver
  value-droad
  value-landuse
  value-tghk
  value-slope
  value-dem
  value-dplant
  value-dagr
  value-dset
  value-pop
  value-hdi
  value-dcenter
  value-dport
  value-equake
  
  z-driver
  z-droad
  z-slope
  z-dplant
  z-dagr
  z-dset
  z-dem
  z-pop
  z-hdi
  z-dcenter
  z-dport
  z-equake
  
  class-driver
  class-droad
  class-slope
  class-dplant
  class-dagr
  class-dset
  class-dem
  class-pop
  class-hdi
  class-dcenter
  class-dport
  class-equake
  
  distance-to-agriculture
  
  forest-age
  agriculture-age
  plantation-age
  
  ;;H1
  natural-capital-H1
  z-natural-capital-H1
  z-attractiveness-H1
  class-natural-capital-H1
  class-attractiveness-H1
  attractiveness-H1
  probability-H1
  
  ;;H2
  natural-capital-H2
  z-natural-capital-H2
  z-attractiveness-H2
  class-natural-capital-H2
  class-attractiveness-H2
  attractiveness-H2
  probability-H2
  
  ;;H3
  natural-capital-H3
  z-natural-capital-H3
  z-attractiveness-H3
  class-natural-capital-H3
  class-attractiveness-H3
  attractiveness-H3
  probability-H3
  
  ;;H4
  natural-capital-H4
  z-natural-capital-H4
  z-attractiveness-H4
  class-natural-capital-H4
  class-attractiveness-H4
  attractiveness-H4
  probability-H4
]

to initialize-constant
  ;;weight cost
  ;;distance to river, distance to road, distance to economic center, distance to port, slope, elevation, earth quake (, neighborhood)
  set weight-cost-H1 [.25 1 .1 .1 .75 1 .5]
  set weight-cost-H2 [.5 .5 .25 .25 .25 .75 .25 1]
  set weight-cost-H3 [.5 .75 .5 .5 .25 .75 .25 1]
  set weight-cost-H4 [.25 .75 .75 .25 1 .75 .5 1]
  
  ;;weight natural-capital
  ;;natural capital, population, human development index
  set weight-benefit-H1 [1 0.25 0.25]
  set weight-benefit-H2 [1 0.5 0.25]
  set weight-benefit-H3 [1 0.25 0.5]
  set weight-benefit-H4 [1 1 0.75]
  
  ;;1=hutan primer, 2=hutan sekunder, 3=semak belukar, 4=perkebunan, 5=pemukiman, 6=badan air, 7=pertanian lahan kering, 8=sawah, 9=rawa
  set initial-forest-age[100 30 5 -9999 -9999 -9999 -9999 -9999 -9999]
  set initial-agriculture-age[-9999 -9999 -9999 -9999 -9999 -9999 25 25 -9999]
  set initial-plantation-age[-9999 -9999 -9999 0 -9999 -9999 -9999 -9999 -9999]
  
  set simulation-year 0
  
  ;;maximum conversion area (ha)
  set area-H1 []
  
  file-open word "data/input/demand/" word outputDir "/areah1.txt"
  while [not file-at-end?]
  [
    set area-H1 lput file-read area-H1
  ]
  file-close
  
  set area-H2 []
  
  file-open word "data/input/demand/" word outputDir "/areah2.txt"
  while [not file-at-end?]
  [
    set area-H2 lput file-read area-H2
  ]
  file-close
  
  set area-H3 []
  
  file-open word "data/input/demand/" word outputDir "/areah3.txt"
  while [not file-at-end?]
  [
    set area-H3 lput file-read area-H3
  ]
  file-close
  
  set area-H4 []
  
  file-open word "data/input/demand/" word outputDir "/areah4.txt"
  
  while [not file-at-end?]
  [
    set area-H4 lput file-read area-H4
  ]
  file-close

  file-open word "data/input/map/" word areaname word "/" word resolution "/mapdriver.asc"
    let temp file-read-line
    set temp file-read-line
    set temp file-read-line
    set temp file-read-line
    set temp file-read-line
    set temp remove "CELLSIZE " temp
    set cell-size read-from-string temp
  file-close
  
  set cell-area (cell-size ^ 2) / 10000
  
  ;;set color-landuse [52 54 65 125 15 105 45 25 35] 

end

to initialize-patch
  ask patches 
  [  
    
    set forest-age ifelse-value (value-landuse > 0)
    [
       item (value-landuse - 1) initial-forest-age
    ]
    [
      -9999
    ]
    
    set agriculture-age ifelse-value (value-landuse > 0)
    [
       item (value-landuse - 1) initial-agriculture-age
    ]
    [
      -9999
    ]
    
    set plantation-age ifelse-value (value-landuse > 0)
    [
       item (value-landuse - 1) initial-plantation-age
    ]
    [
      -9999
    ]
  ]
end

to setup[s a r y o]
  ca
  set scenario s
  set areaname a
  set resolution r
  set outputDir o
  set starting-year y
  set year starting-year
  
  set change-area-file word "data/output/" word outputDir "/changearea.json"
  
  if file-exists? change-area-file
  [
    file-delete change-area-file
  ]
  
  initialize-change-area
  initialize-constant
  read-raster-maps
  initialize-patch
  calculate-fixed-costs 
  ;;display-map-landuse
end


to simulate
  export-maps
  store-change-area
  convert-H
  convert-N
  update
  ;;display-map-landuse
end

to calculate-fixed-costs
  set mean-driver mean [value-driver]of patches with[value-driver > -9999]
  set mean-droad mean [value-droad]of patches with[value-droad > -9999]
  set mean-slope mean [value-slope]of patches with[value-slope > -9999]
  set mean-dem mean [value-dem]of patches with[value-dem > -9999]
  set mean-dplant mean [value-dplant]of patches with[value-dplant > -9999]
  set mean-dagr mean [value-dagr]of patches with[value-dagr > -9999]
  set mean-dset mean [value-dset]of patches with[value-dset > -9999]
  set mean-pop mean [value-pop]of patches with[value-pop > -9999]
  set mean-hdi mean [value-hdi]of patches with[value-hdi > -9999]
  set mean-dcenter mean [value-dcenter]of patches with[value-dcenter > -9999]
  set mean-dport mean [value-dport]of patches with[value-dport > -9999]
  set mean-equake mean [value-equake]of patches with[value-equake > -9999]


  set sd-driver standard-deviation [value-driver]of patches with[value-driver > -9999]
  set sd-droad standard-deviation [value-droad]of patches with[value-droad > -9999]
  set sd-slope standard-deviation [value-slope]of patches with[value-slope > -9999]
  set sd-dem standard-deviation [value-dem]of patches with[value-dem > -9999]
  set sd-dplant standard-deviation [value-dplant]of patches with[value-dplant > -9999]
  set sd-dagr standard-deviation [value-dagr]of patches with[value-dagr > -9999]
  set sd-dset standard-deviation [value-dset]of patches with[value-dset > -9999]
  set sd-pop standard-deviation [value-pop]of patches with[value-pop > -9999]
  set sd-hdi standard-deviation [value-hdi]of patches with[value-hdi > -9999]
  set sd-dcenter standard-deviation [value-dcenter]of patches with[value-dcenter > -9999]
  set sd-dport standard-deviation [value-dport]of patches with[value-dport > -9999]
  set sd-equake standard-deviation [value-equake]of patches with[value-equake > -9999]

  
  ask patches
  [
    set z-driver ifelse-value(value-driver > -9999)
    [
      ifelse-value(sd-driver > 0)
      [
        (value-driver - mean-driver) / sd-driver
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    set z-droad ifelse-value(value-droad > -9999)
    [
      ifelse-value(sd-droad > 0)
      [
        (value-droad - mean-droad) / sd-droad
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    
    set z-slope ifelse-value(value-slope > -9999)
    [
      ifelse-value(sd-slope > 0)
      [
        (value-slope - mean-slope) / sd-slope
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    set z-dem ifelse-value(value-dem > -9999)
    [
      ifelse-value(sd-dem > 0)
      [
        (value-dem - mean-dem) / sd-dem
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    set z-dagr ifelse-value(value-dagr > -9999)
    [
      ifelse-value(sd-dagr > 0)
      [
        (value-dagr - mean-dagr) / sd-dagr
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    set z-dplant ifelse-value(value-dplant > -9999)
    [
      ifelse-value(sd-dplant > 0)
      [
        (value-dplant - mean-dplant) / sd-dplant
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    set z-dset ifelse-value(value-dset > -9999)
    [
      ifelse-value(sd-dset > 0)
      [
        (value-dset - mean-dset) / sd-dset
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
     set z-pop ifelse-value(value-pop > -9999)
    [
      ifelse-value(sd-pop > 0)
      [
        (value-pop - mean-pop) / sd-pop
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    set z-hdi ifelse-value(value-hdi > -9999)
    [
      ifelse-value(sd-hdi > 0)
      [
        (value-hdi - mean-hdi) / sd-hdi
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    
    set z-dcenter ifelse-value(value-dcenter > -9999)
    [
      ifelse-value(sd-dcenter > 0)
      [
        (value-dcenter - mean-dcenter) / sd-dcenter
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    set z-dport ifelse-value(value-dport > -9999)
    [
      ifelse-value(sd-dport > 0)
      [
        (value-dport - mean-dport) / sd-dport
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
    
    set z-equake ifelse-value(value-equake > -9999)
    [
      ifelse-value(sd-equake > 0)
      [
        (value-equake - mean-equake) / sd-equake
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
  ask patches
  [
     set class-driver ifelse-value (z-driver = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-driver > -9999 and z-driver < -4)
       [
         1
       ]
       [
         ifelse-value (z-driver >= -4 and z-driver < -3)
         [
           2
         ]
         [
           ifelse-value (z-driver >= -3 and z-driver < -2)
           [
             3
           ]
           [
             ifelse-value (z-driver >= -2 and z-driver < -1)
             [
               4
             ]
             [
               ifelse-value (z-driver >= -1 and z-driver < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-driver >= 0 and z-driver < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-driver >= 1 and z-driver < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-driver >= 2 and z-driver < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-driver >= 3 and z-driver < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
  ]
  
  ask patches
  [
     set class-droad ifelse-value (z-droad = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-droad > -9999 and z-droad < -4)
       [
         1
       ]
       [
         ifelse-value (z-droad >= -4 and z-droad < -3)
         [
           2
         ]
         [
           ifelse-value (z-droad >= -3 and z-droad < -2)
           [
             3
           ]
           [
             ifelse-value (z-droad >= -2 and z-droad < -1)
             [
               4
             ]
             [
               ifelse-value (z-droad >= -1 and z-droad < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-droad >= 0 and z-droad < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-droad >= 1 and z-droad < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-droad >= 2 and z-droad < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-droad >= 3 and z-droad < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-dplant ifelse-value (z-dplant = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-dplant > -9999 and z-dplant < -4)
       [
         1
       ]
       [
         ifelse-value (z-dplant >= -4 and z-dplant < -3)
         [
           2
         ]
         [
           ifelse-value (z-dplant >= -3 and z-dplant < -2)
           [
             3
           ]
           [
             ifelse-value (z-dplant >= -2 and z-dplant < -1)
             [
               4
             ]
             [
               ifelse-value (z-dplant >= -1 and z-dplant < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-dplant >= 0 and z-dplant < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-dplant >= 1 and z-dplant < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-dplant >= 2 and z-dplant < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-dplant >= 3 and z-dplant < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-dagr ifelse-value (z-dagr = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-dagr > -9999 and z-dagr < -4)
       [
         1
       ]
       [
         ifelse-value (z-dagr >= -4 and z-dagr < -3)
         [
           2
         ]
         [
           ifelse-value (z-dagr >= -3 and z-dagr < -2)
           [
             3
           ]
           [
             ifelse-value (z-dagr >= -2 and z-dagr < -1)
             [
               4
             ]
             [
               ifelse-value (z-dagr >= -1 and z-dagr < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-dagr >= 0 and z-dagr < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-dagr >= 1 and z-dagr < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-dagr >= 2 and z-dagr < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-dagr >= 3 and z-dagr < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-dset ifelse-value (z-dset = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-dset > -9999 and z-dset < -4)
       [
         1
       ]
       [
         ifelse-value (z-dset >= -4 and z-dset < -3)
         [
           2
         ]
         [
           ifelse-value (z-dset >= -3 and z-dset < -2)
           [
             3
           ]
           [
             ifelse-value (z-dset >= -2 and z-dset < -1)
             [
               4
             ]
             [
               ifelse-value (z-dset >= -1 and z-dset < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-dset >= 0 and z-dset < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-dset >= 1 and z-dset < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-dset >= 2 and z-dset < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-dset >= 3 and z-dset < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-slope ifelse-value (z-slope = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-slope > -9999 and z-slope < -4)
       [
         1
       ]
       [
         ifelse-value (z-slope >= -4 and z-slope < -3)
         [
           2
         ]
         [
           ifelse-value (z-slope >= -3 and z-slope < -2)
           [
             3
           ]
           [
             ifelse-value (z-slope >= -2 and z-slope < -1)
             [
               4
             ]
             [
               ifelse-value (z-slope >= -1 and z-slope < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-slope >= 0 and z-slope < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-slope >= 1 and z-slope < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-slope >= 2 and z-slope < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-slope >= 3 and z-slope < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-dem ifelse-value (z-dem = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-dem > -9999 and z-dem < -4)
       [
         1
       ]
       [
         ifelse-value (z-dem >= -4 and z-dem < -3)
         [
           2
         ]
         [
           ifelse-value (z-dem >= -3 and z-dem < -2)
           [
             3
           ]
           [
             ifelse-value (z-dem >= -2 and z-dem < -1)
             [
               4
             ]
             [
               ifelse-value (z-dem >= -1 and z-dem < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-dem >= 0 and z-dem < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-dem >= 1 and z-dem < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-dem >= 2 and z-dem < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-dem >= 3 and z-dem < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-pop ifelse-value (z-pop = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-pop > -9999 and z-pop < -4)
       [
         1
       ]
       [
         ifelse-value (z-pop >= -4 and z-pop < -3)
         [
           2
         ]
         [
           ifelse-value (z-pop >= -3 and z-pop < -2)
           [
             3
           ]
           [
             ifelse-value (z-pop >= -2 and z-pop < -1)
             [
               4
             ]
             [
               ifelse-value (z-pop >= -1 and z-pop < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-pop >= 0 and z-pop < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-pop >= 1 and z-pop < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-pop >= 2 and z-pop < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-pop >= 3 and z-pop < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
  ]
  
  ask patches
  [
     set class-hdi ifelse-value (z-hdi = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-hdi > -9999 and z-hdi < -4)
       [
         1
       ]
       [
         ifelse-value (z-hdi >= -4 and z-hdi < -3)
         [
           2
         ]
         [
           ifelse-value (z-hdi >= -3 and z-hdi < -2)
           [
             3
           ]
           [
             ifelse-value (z-hdi >= -2 and z-hdi < -1)
             [
               4
             ]
             [
               ifelse-value (z-hdi >= -1 and z-hdi < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-hdi >= 0 and z-hdi < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-hdi >= 1 and z-hdi < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-hdi >= 2 and z-hdi < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-hdi >= 3 and z-hdi < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-dcenter ifelse-value (z-dcenter = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-dcenter > -9999 and z-dcenter < -4)
       [
         1
       ]
       [
         ifelse-value (z-dcenter >= -4 and z-dcenter < -3)
         [
           2
         ]
         [
           ifelse-value (z-dcenter >= -3 and z-dcenter < -2)
           [
             3
           ]
           [
             ifelse-value (z-dcenter >= -2 and z-dcenter < -1)
             [
               4
             ]
             [
               ifelse-value (z-dcenter >= -1 and z-dcenter < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-dcenter >= 0 and z-dcenter < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-dcenter >= 1 and z-dcenter < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-dcenter >= 2 and z-dcenter < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-dcenter >= 3 and z-dcenter < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-equake ifelse-value (z-equake = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-equake > -9999 and z-equake < -4)
       [
         1
       ]
       [
         ifelse-value (z-equake >= -4 and z-equake < -3)
         [
           2
         ]
         [
           ifelse-value (z-equake >= -3 and z-equake < -2)
           [
             3
           ]
           [
             ifelse-value (z-equake >= -2 and z-equake < -1)
             [
               4
             ]
             [
               ifelse-value (z-equake >= -1 and z-equake < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-equake >= 0 and z-equake < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-equake >= 1 and z-equake < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-equake >= 2 and z-equake < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-equake >= 3 and z-equake < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  ask patches
  [
     set class-dport ifelse-value (z-dport = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-dport > -9999 and z-dport < -4)
       [
         1
       ]
       [
         ifelse-value (z-dport >= -4 and z-dport < -3)
         [
           2
         ]
         [
           ifelse-value (z-dport >= -3 and z-dport < -2)
           [
             3
           ]
           [
             ifelse-value (z-dport >= -2 and z-dport < -1)
             [
               4
             ]
             [
               ifelse-value (z-dport >= -1 and z-dport < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-dport >= 0 and z-dport < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-dport >= 1 and z-dport < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-dport >= 2 and z-dport < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-dport >= 3 and z-dport < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  
end

to calculate-attractiveness-H1
  set mean-natural-capital-H1 mean [natural-capital-H1]of patches with[natural-capital-H1 > -9999]
  set sd-natural-capital-H1 standard-deviation [natural-capital-H1]of patches with[natural-capital-H1 > -9999]
 
  ask patches
  [
    set z-natural-capital-H1 ifelse-value(natural-capital-H1 > -9999)
    [
      ifelse-value(sd-natural-capital-H1 > 0)
      [
        (natural-capital-H1 - mean-natural-capital-H1) / sd-natural-capital-H1
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
  
  ask patches
  [
     set class-natural-capital-H1 ifelse-value (z-natural-capital-H1 = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-natural-capital-H1 > -9999 and z-natural-capital-H1 < -4)
       [
         1
       ]
       [
         ifelse-value (z-natural-capital-H1 >= -4 and z-natural-capital-H1 < -3)
         [
           2
         ]
         [
           ifelse-value (z-natural-capital-H1 >= -3 and z-natural-capital-H1 < -2)
           [
             3
           ]
           [
             ifelse-value (z-natural-capital-H1 >= -2 and z-natural-capital-H1 < -1)
             [
               4
             ]
             [
               ifelse-value (z-natural-capital-H1 >= -1 and z-natural-capital-H1 < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-natural-capital-H1 >= 0 and z-natural-capital-H1 < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-natural-capital-H1 >= 1 and z-natural-capital-H1 < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-natural-capital-H1 >= 2 and z-natural-capital-H1 < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-natural-capital-H1 >= 3 and z-natural-capital-H1 < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
  ]
  
  ask patches
  [
    set attractiveness-H1 ifelse-value (z-natural-capital-H1 = -9999) 
    [
      -9999    
    ]
    [
      (
      (item 0 weight-benefit-H1 * class-natural-capital-H1) +
      (item 1 weight-benefit-H1 * class-pop) +
      (item 2 weight-benefit-H1 * class-hdi)
      )
      / 
      (1 + 
      (item 0 weight-cost-H1 * class-driver) + 
      (item 1 weight-cost-H1 * class-droad) + 
      (item 2 weight-cost-H1 * class-dcenter) + 
      (item 3 weight-cost-H1 * class-dport) +
      (item 4 weight-cost-H1 * class-slope) +
      (item 5 weight-cost-H1 * class-dem) +   
      (item 6 weight-cost-H1 * class-equake)
      )
    ]
  ]
  
  set mean-attractiveness-H1 mean [attractiveness-H1]of patches with[attractiveness-H1 > -9999]
  set sd-attractiveness-H1 standard-deviation [attractiveness-H1]of patches with[attractiveness-H1 > -9999]
  
  ask patches
  [
    set z-attractiveness-H1 ifelse-value(attractiveness-H1 > -9999)
    [
      ifelse-value(sd-attractiveness-H1 > 0)
      [
        (attractiveness-H1 - mean-attractiveness-H1) / sd-attractiveness-H1
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
  ask patches
  [
     ifelse scenario = "rtrw"
     [
       set class-attractiveness-H1 ifelse-value (z-attractiveness-H1 = -9999 or (value-tghk < 3 or value-tghk > 5) or value-landuse > 2 or value-slope > 40) 
       [
         -9999    
       ]
       [
         ifelse-value (z-attractiveness-H1 > -9999 and z-attractiveness-H1 < -4)
         [
           1
         ]
         [
           ifelse-value (z-attractiveness-H1 >= -4 and z-attractiveness-H1 < -3)
           [
             2
           ]
           [
             ifelse-value (z-attractiveness-H1 >= -3 and z-attractiveness-H1 < -2)
             [
               3
             ]
             [
               ifelse-value (z-attractiveness-H1 >= -2 and z-attractiveness-H1 < -1)
               [
                 4
               ]
               [
                 ifelse-value (z-attractiveness-H1 >= -1 and z-attractiveness-H1 < 0)
                 [
                   5
                 ]
                 [
                   ifelse-value (z-attractiveness-H1 >= 0 and z-attractiveness-H1 < 1)
                   [
                     6
                   ]
                   [
                     ifelse-value (z-attractiveness-H1 >= 1 and z-attractiveness-H1 < 2)
                     [
                       7
                     ]
                     [
                       ifelse-value (z-attractiveness-H1 >= 2 and z-attractiveness-H1 < 3)
                       [
                         8
                       ]
                       [
                         ifelse-value (z-attractiveness-H1 >= 3 and z-attractiveness-H1 < 4)
                         [
                           9
                         ]
                         [
                           10
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
     [
       ifelse scenario = "terbatas"
       [
         set class-attractiveness-H1 ifelse-value (z-attractiveness-H1 = -9999 or (value-tghk < 2 or value-tghk > 5) or value-landuse > 2 or value-slope > 40) 
         [
           -9999    
         ]
         [
           ifelse-value (z-attractiveness-H1 > -9999 and z-attractiveness-H1 < -4)
           [
             1
           ]
           [
             ifelse-value (z-attractiveness-H1 >= -4 and z-attractiveness-H1 < -3)
             [
               2
             ]
             [
               ifelse-value (z-attractiveness-H1 >= -3 and z-attractiveness-H1 < -2)
               [
                 3
               ]
               [
                 ifelse-value (z-attractiveness-H1 >= -2 and z-attractiveness-H1 < -1)
                 [
                   4
                 ]
                 [
                   ifelse-value (z-attractiveness-H1 >= -1 and z-attractiveness-H1 < 0)
                   [
                     5
                   ]
                   [
                     ifelse-value (z-attractiveness-H1 >= 0 and z-attractiveness-H1 < 1)
                     [
                       6
                     ]
                     [
                       ifelse-value (z-attractiveness-H1 >= 1 and z-attractiveness-H1 < 2)
                       [
                         7
                       ]
                       [
                         ifelse-value (z-attractiveness-H1 >= 2 and z-attractiveness-H1 < 3)
                         [
                           8
                         ]
                         [
                           ifelse-value (z-attractiveness-H1 >= 3 and z-attractiveness-H1 < 4)
                           [
                             9
                           ]
                           [
                             10
                           ]
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
       [
         set class-attractiveness-H1 ifelse-value (z-attractiveness-H1 = -9999 or (value-tghk = 6 or value-tghk = 8) or value-landuse > 2 or value-slope > 40) 
         [
           -9999    
         ]
         [
           ifelse-value (z-attractiveness-H1 > -9999 and z-attractiveness-H1 < -4)
           [
             1
           ]
           [
             ifelse-value (z-attractiveness-H1 >= -4 and z-attractiveness-H1 < -3)
             [
               2
             ]
             [
               ifelse-value (z-attractiveness-H1 >= -3 and z-attractiveness-H1 < -2)
               [
                 3
               ]
               [
                 ifelse-value (z-attractiveness-H1 >= -2 and z-attractiveness-H1 < -1)
                 [
                   4
                 ]
                 [
                   ifelse-value (z-attractiveness-H1 >= -1 and z-attractiveness-H1 < 0)
                   [
                     5
                   ]
                   [
                     ifelse-value (z-attractiveness-H1 >= 0 and z-attractiveness-H1 < 1)
                     [
                       6
                     ]
                     [
                       ifelse-value (z-attractiveness-H1 >= 1 and z-attractiveness-H1 < 2)
                       [
                         7
                       ]
                       [
                         ifelse-value (z-attractiveness-H1 >= 2 and z-attractiveness-H1 < 3)
                         [
                           8
                         ]
                         [
                           ifelse-value (z-attractiveness-H1 >= 3 and z-attractiveness-H1 < 4)
                           [
                             9
                           ]
                           [
                             10
                           ]
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  
  set frequency-attractiveness-H1-1 count patches with[class-attractiveness-H1 = 1]
  set frequency-attractiveness-H1-2 count patches with[class-attractiveness-H1 = 2]
  set frequency-attractiveness-H1-3 count patches with[class-attractiveness-H1 = 3]
  set frequency-attractiveness-H1-4 count patches with[class-attractiveness-H1 = 4]
  set frequency-attractiveness-H1-5 count patches with[class-attractiveness-H1 = 5]
  set frequency-attractiveness-H1-6 count patches with[class-attractiveness-H1 = 6]
  set frequency-attractiveness-H1-7 count patches with[class-attractiveness-H1 = 7]
  set frequency-attractiveness-H1-8 count patches with[class-attractiveness-H1 = 8]
  set frequency-attractiveness-H1-9 count patches with[class-attractiveness-H1 = 9]
  set frequency-attractiveness-H1-10 count patches with[class-attractiveness-H1 = 10]
end

to calculate-attractiveness-H2
  set mean-natural-capital-H2 mean [natural-capital-H2]of patches with[natural-capital-H2 > -9999]
  set sd-natural-capital-H2 standard-deviation [natural-capital-H2]of patches with[natural-capital-H2 > -9999]
 
  ask patches
  [
    set z-natural-capital-H2 ifelse-value(natural-capital-H2 > -9999)
    [
      ifelse-value(sd-natural-capital-H2 > 0)
      [
        (natural-capital-H2 - mean-natural-capital-H2) / sd-natural-capital-H2
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
  
  ask patches
  [
     set class-natural-capital-H2 ifelse-value (z-natural-capital-H2 = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-natural-capital-H2 > -9999 and z-natural-capital-H2 < -4)
       [
         1
       ]
       [
         ifelse-value (z-natural-capital-H2 >= -4 and z-natural-capital-H2 < -3)
         [
           2
         ]
         [
           ifelse-value (z-natural-capital-H2 >= -3 and z-natural-capital-H2 < -2)
           [
             3
           ]
           [
             ifelse-value (z-natural-capital-H2 >= -2 and z-natural-capital-H2 < -1)
             [
               4
             ]
             [
               ifelse-value (z-natural-capital-H2 >= -1 and z-natural-capital-H2 < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-natural-capital-H2 >= 0 and z-natural-capital-H2 < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-natural-capital-H2 >= 1 and z-natural-capital-H2 < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-natural-capital-H2 >= 2 and z-natural-capital-H2 < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-natural-capital-H2 >= 3 and z-natural-capital-H2 < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
  ]
  
  ask patches
  [
    set attractiveness-H2 ifelse-value (z-natural-capital-H2 = -9999) 
    [
      -9999    
    ]
    [
      (
      (item 0 weight-benefit-H2 * class-natural-capital-H2) +
      (item 1 weight-benefit-H2 * class-pop) +
      (item 2 weight-benefit-H2 * class-hdi)
      ) 
      / 
      (1 + 
      (item 0 weight-cost-H2 * class-driver) + 
      (item 1 weight-cost-H2 * class-droad) + 
      (item 2 weight-cost-H2 * class-dcenter) + 
      (item 3 weight-cost-H2 * class-dport) +
      (item 4 weight-cost-H2 * class-slope) +
      (item 5 weight-cost-H2 * class-dem) +   
      (item 6 weight-cost-H2 * class-equake) +
      (item 7 weight-cost-H2 * class-dagr)
      )
    ]
  ]
  
  set mean-attractiveness-H2 mean [attractiveness-H2]of patches with[attractiveness-H2 > -9999]
  set sd-attractiveness-H2 standard-deviation [attractiveness-H2]of patches with[attractiveness-H2 > -9999]
  
  ask patches
  [
    set z-attractiveness-H2 ifelse-value(attractiveness-H2 > -9999)
    [
      ifelse-value(sd-attractiveness-H2 > 0)
      [
        (attractiveness-H2 - mean-attractiveness-H2) / sd-attractiveness-H2
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
  ask patches
  [
     ifelse scenario = "rtrw"
     [
       set class-attractiveness-H2 ifelse-value 
       (
         z-attractiveness-H2 = -9999 or 
         (value-tghk = 1 or value-tghk = 2 or value-tghk = 4 or value-tghk = 7 or value-tghk = 8) or 
         (value-landuse = 1 or (value-landuse = 4 and plantation-age < 25) or value-landuse >= 5) or
         value-slope > 40
         ) 
       [
         -9999    
       ]
       [
         ifelse-value (z-attractiveness-H2 > -9999 and z-attractiveness-H2 < -4)
         [
           1
         ]
         [
           ifelse-value (z-attractiveness-H2 >= -4 and z-attractiveness-H2 < -3)
           [
             2
           ]
           [
             ifelse-value (z-attractiveness-H2 >= -3 and z-attractiveness-H2 < -2)
             [
               3
             ]
             [
               ifelse-value (z-attractiveness-H2 >= -2 and z-attractiveness-H2 < -1)
               [
                 4
               ]
               [
                 ifelse-value (z-attractiveness-H2 >= -1 and z-attractiveness-H2 < 0)
                 [
                   5
                 ]
                 [
                   ifelse-value (z-attractiveness-H2 >= 0 and z-attractiveness-H2 < 1)
                   [
                     6
                   ]
                   [
                     ifelse-value (z-attractiveness-H2 >= 1 and z-attractiveness-H2 < 2)
                     [
                       7
                     ]
                     [
                       ifelse-value (z-attractiveness-H2 >= 2 and z-attractiveness-H2 < 3)
                       [
                         8
                       ]
                       [
                         ifelse-value (z-attractiveness-H2 >= 3 and z-attractiveness-H2 < 4)
                         [
                           9
                         ]
                         [
                           10
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
     [
       ifelse scenario = "terbatas"
       [
         set class-attractiveness-H2 ifelse-value 
         (
           z-attractiveness-H2 = -9999 or 
           (value-tghk = 1 or value-tghk = 2 or value-tghk = 7 or value-tghk = 8) or 
           (value-landuse = 1 or (value-landuse = 4 and plantation-age < 25) or value-landuse >= 5) or
           value-slope > 40
           ) 
         [
           -9999    
         ]
         [
           ifelse-value (z-attractiveness-H2 > -9999 and z-attractiveness-H2 < -4)
           [
             1
           ]
           [
             ifelse-value (z-attractiveness-H2 >= -4 and z-attractiveness-H2 < -3)
             [
               2
             ]
             [
               ifelse-value (z-attractiveness-H2 >= -3 and z-attractiveness-H2 < -2)
               [
                 3
               ]
               [
                 ifelse-value (z-attractiveness-H2 >= -2 and z-attractiveness-H2 < -1)
                 [
                   4
                 ]
                 [
                   ifelse-value (z-attractiveness-H2 >= -1 and z-attractiveness-H2 < 0)
                   [
                     5
                   ]
                   [
                     ifelse-value (z-attractiveness-H2 >= 0 and z-attractiveness-H2 < 1)
                     [
                       6
                     ]
                     [
                       ifelse-value (z-attractiveness-H2 >= 1 and z-attractiveness-H2 < 2)
                       [
                         7
                       ]
                       [
                         ifelse-value (z-attractiveness-H2 >= 2 and z-attractiveness-H2 < 3)
                         [
                           8
                         ]
                         [
                           ifelse-value (z-attractiveness-H2 >= 3 and z-attractiveness-H2 < 4)
                           [
                             9
                           ]
                           [
                             10
                           ]
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
       [
         set class-attractiveness-H2 ifelse-value 
         (
           z-attractiveness-H2 = -9999 or 
           (value-tghk = 1 or value-tghk = 7 or value-tghk = 8) or 
           (value-landuse = 1 or (value-landuse = 4 and plantation-age < 25) or value-landuse >= 5) or
           value-slope > 40
           ) 
         [
           -9999    
         ]
         [
           ifelse-value (z-attractiveness-H2 > -9999 and z-attractiveness-H2 < -4)
           [
             1
           ]
           [
             ifelse-value (z-attractiveness-H2 >= -4 and z-attractiveness-H2 < -3)
             [
               2
             ]
             [
               ifelse-value (z-attractiveness-H2 >= -3 and z-attractiveness-H2 < -2)
               [
                 3
               ]
               [
                 ifelse-value (z-attractiveness-H2 >= -2 and z-attractiveness-H2 < -1)
                 [
                   4
                 ]
                 [
                   ifelse-value (z-attractiveness-H2 >= -1 and z-attractiveness-H2 < 0)
                   [
                     5
                   ]
                   [
                     ifelse-value (z-attractiveness-H2 >= 0 and z-attractiveness-H2 < 1)
                     [
                       6
                     ]
                     [
                       ifelse-value (z-attractiveness-H2 >= 1 and z-attractiveness-H2 < 2)
                       [
                         7
                       ]
                       [
                         ifelse-value (z-attractiveness-H2 >= 2 and z-attractiveness-H2 < 3)
                         [
                           8
                         ]
                         [
                           ifelse-value (z-attractiveness-H2 >= 3 and z-attractiveness-H2 < 4)
                           [
                             9
                           ]
                           [
                             10
                           ]
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]

  ]
  
  
  set frequency-attractiveness-H2-1 count patches with[class-attractiveness-H2 = 1]
  set frequency-attractiveness-H2-2 count patches with[class-attractiveness-H2 = 2]
  set frequency-attractiveness-H2-3 count patches with[class-attractiveness-H2 = 3]
  set frequency-attractiveness-H2-4 count patches with[class-attractiveness-H2 = 4]
  set frequency-attractiveness-H2-5 count patches with[class-attractiveness-H2 = 5]
  set frequency-attractiveness-H2-6 count patches with[class-attractiveness-H2 = 6]
  set frequency-attractiveness-H2-7 count patches with[class-attractiveness-H2 = 7]
  set frequency-attractiveness-H2-8 count patches with[class-attractiveness-H2 = 8]
  set frequency-attractiveness-H2-9 count patches with[class-attractiveness-H2 = 9]
  set frequency-attractiveness-H2-10 count patches with[class-attractiveness-H2 = 10]
end

to calculate-attractiveness-H3
  set mean-natural-capital-H3 mean [natural-capital-H3]of patches with[natural-capital-H3 > -9999]
  set sd-natural-capital-H3 standard-deviation [natural-capital-H3]of patches with[natural-capital-H3 > -9999]
 
  ask patches
  [
    set z-natural-capital-H3 ifelse-value(natural-capital-H3 > -9999)
    [
      ifelse-value(sd-natural-capital-H3 > 0)
      [
        (natural-capital-H3 - mean-natural-capital-H3) / sd-natural-capital-H3
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
  
  ask patches
  [
     set class-natural-capital-H3 ifelse-value (z-natural-capital-H3 = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-natural-capital-H3 > -9999 and z-natural-capital-H3 < -4)
       [
         1
       ]
       [
         ifelse-value (z-natural-capital-H3 >= -4 and z-natural-capital-H3 < -3)
         [
           2
         ]
         [
           ifelse-value (z-natural-capital-H3 >= -3 and z-natural-capital-H3 < -2)
           [
             3
           ]
           [
             ifelse-value (z-natural-capital-H3 >= -2 and z-natural-capital-H3 < -1)
             [
               4
             ]
             [
               ifelse-value (z-natural-capital-H3 >= -1 and z-natural-capital-H3 < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-natural-capital-H3 >= 0 and z-natural-capital-H3 < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-natural-capital-H3 >= 1 and z-natural-capital-H3 < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-natural-capital-H3 >= 2 and z-natural-capital-H3 < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-natural-capital-H3 >= 3 and z-natural-capital-H3 < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
  ]
  
  ask patches
  [
    set attractiveness-H3 ifelse-value (z-natural-capital-H3 = -9999) 
    [
      -9999    
    ]
    [
      (
      (item 0 weight-benefit-H3 * class-natural-capital-H3) +
      (item 1 weight-benefit-H3 * class-pop) +
      (item 2 weight-benefit-H3 * class-hdi)
      )
      / 
      (1 + 
      (item 0 weight-cost-H3 * class-driver) + 
      (item 1 weight-cost-H3 * class-droad) + 
      (item 2 weight-cost-H3 * class-dcenter) + 
      (item 3 weight-cost-H3 * class-dport) +
      (item 4 weight-cost-H3 * class-slope) +
      (item 5 weight-cost-H3 * class-dem) +   
      (item 6 weight-cost-H3 * class-equake) +
      (item 7 weight-cost-H3 * class-dplant)
      )
    ]
  ]
  
  set mean-attractiveness-H3 mean [attractiveness-H3]of patches with[attractiveness-H3 > -9999]
  set sd-attractiveness-H3 standard-deviation [attractiveness-H3]of patches with[attractiveness-H3 > -9999]
  
  ask patches
  [
    set z-attractiveness-H3 ifelse-value(attractiveness-H3 > -9999)
    [
      ifelse-value(sd-attractiveness-H3 > 0)
      [
        (attractiveness-H3 - mean-attractiveness-H3) / sd-attractiveness-H3
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
 ask patches
  [
     ifelse scenario = "rtrw"
     [
       set class-attractiveness-H3 ifelse-value 
       (
         z-attractiveness-H3 = -9999 or 
         (value-tghk = 1 or value-tghk = 2 or value-tghk = 4 or value-tghk = 7 or value-tghk = 8) or 
         (value-landuse = 1 or ((value-landuse = 7 or value-landuse = 8) and agriculture-age < 25) or value-landuse = 5 or value-landuse = 6 or value-landuse = 9) or
         value-slope > 40
       ) 
       [
         -9999    
       ]
       [
         ifelse-value (z-attractiveness-H3 > -9999 and z-attractiveness-H3 < -4)
         [
           1
         ]
         [
           ifelse-value (z-attractiveness-H3 >= -4 and z-attractiveness-H3 < -3)
           [
             2
           ]
           [
             ifelse-value (z-attractiveness-H3 >= -3 and z-attractiveness-H3 < -2)
             [
               3
             ]
             [
               ifelse-value (z-attractiveness-H3 >= -2 and z-attractiveness-H3 < -1)
               [
                 4
               ]
               [
                 ifelse-value (z-attractiveness-H3 >= -1 and z-attractiveness-H3 < 0)
                 [
                   5
                 ]
                 [
                   ifelse-value (z-attractiveness-H3 >= 0 and z-attractiveness-H3 < 1)
                   [
                     6
                   ]
                   [
                     ifelse-value (z-attractiveness-H3 >= 1 and z-attractiveness-H3 < 2)
                     [
                       7
                     ]
                     [
                       ifelse-value (z-attractiveness-H3 >= 2 and z-attractiveness-H3 < 3)
                       [
                         8
                       ]
                       [
                         ifelse-value (z-attractiveness-H3 >= 3 and z-attractiveness-H3 < 4)
                         [
                           9
                         ]
                         [
                           10
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
     [
       ifelse scenario = "terbatas"
       [
         set class-attractiveness-H3 ifelse-value 
         (
           z-attractiveness-H3 = -9999 or 
           (value-tghk = 1 or value-tghk = 2 or value-tghk = 7 or value-tghk = 8) or 
           (value-landuse = 1 or ((value-landuse = 7 or value-landuse = 8) and agriculture-age < 25) or value-landuse = 5 or value-landuse = 6 or value-landuse = 9) or
           value-slope > 40
         ) 
         [
           -9999    
         ]
         [
           ifelse-value (z-attractiveness-H3 > -9999 and z-attractiveness-H3 < -4)
           [
             1
           ]
           [
             ifelse-value (z-attractiveness-H3 >= -4 and z-attractiveness-H3 < -3)
             [
               2
             ]
             [
               ifelse-value (z-attractiveness-H3 >= -3 and z-attractiveness-H3 < -2)
               [
                 3
               ]
               [
                 ifelse-value (z-attractiveness-H3 >= -2 and z-attractiveness-H3 < -1)
                 [
                   4
                 ]
                 [
                   ifelse-value (z-attractiveness-H3 >= -1 and z-attractiveness-H3 < 0)
                   [
                     5
                   ]
                   [
                     ifelse-value (z-attractiveness-H3 >= 0 and z-attractiveness-H3 < 1)
                     [
                       6
                     ]
                     [
                       ifelse-value (z-attractiveness-H3 >= 1 and z-attractiveness-H3 < 2)
                       [
                         7
                       ]
                       [
                         ifelse-value (z-attractiveness-H3 >= 2 and z-attractiveness-H3 < 3)
                         [
                           8
                         ]
                         [
                           ifelse-value (z-attractiveness-H3 >= 3 and z-attractiveness-H3 < 4)
                           [
                             9
                           ]
                           [
                             10
                           ]
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
       [
         set class-attractiveness-H3 ifelse-value 
         (
           z-attractiveness-H3 = -9999 or 
           (value-tghk = 1 or value-tghk = 7 or value-tghk = 8) or 
           (value-landuse = 1 or ((value-landuse = 7 or value-landuse = 8) and agriculture-age < 25) or value-landuse = 5 or value-landuse = 6 or value-landuse = 9) or
           value-slope > 40
         ) 
         [
           -9999    
         ]
         [
           ifelse-value (z-attractiveness-H3 > -9999 and z-attractiveness-H3 < -4)
           [
             1
           ]
           [
             ifelse-value (z-attractiveness-H3 >= -4 and z-attractiveness-H3 < -3)
             [
               2
             ]
             [
               ifelse-value (z-attractiveness-H3 >= -3 and z-attractiveness-H3 < -2)
               [
                 3
               ]
               [
                 ifelse-value (z-attractiveness-H3 >= -2 and z-attractiveness-H3 < -1)
                 [
                   4
                 ]
                 [
                   ifelse-value (z-attractiveness-H3 >= -1 and z-attractiveness-H3 < 0)
                   [
                     5
                   ]
                   [
                     ifelse-value (z-attractiveness-H3 >= 0 and z-attractiveness-H3 < 1)
                     [
                       6
                     ]
                     [
                       ifelse-value (z-attractiveness-H3 >= 1 and z-attractiveness-H3 < 2)
                       [
                         7
                       ]
                       [
                         ifelse-value (z-attractiveness-H3 >= 2 and z-attractiveness-H3 < 3)
                         [
                           8
                         ]
                         [
                           ifelse-value (z-attractiveness-H3 >= 3 and z-attractiveness-H3 < 4)
                           [
                             9
                           ]
                           [
                             10
                           ]
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
  ]
  
  
  set frequency-attractiveness-H3-1 count patches with[class-attractiveness-H3 = 1]
  set frequency-attractiveness-H3-2 count patches with[class-attractiveness-H3 = 2]
  set frequency-attractiveness-H3-3 count patches with[class-attractiveness-H3 = 3]
  set frequency-attractiveness-H3-4 count patches with[class-attractiveness-H3 = 4]
  set frequency-attractiveness-H3-5 count patches with[class-attractiveness-H3 = 5]
  set frequency-attractiveness-H3-6 count patches with[class-attractiveness-H3 = 6]
  set frequency-attractiveness-H3-7 count patches with[class-attractiveness-H3 = 7]
  set frequency-attractiveness-H3-8 count patches with[class-attractiveness-H3 = 8]
  set frequency-attractiveness-H3-9 count patches with[class-attractiveness-H3 = 9]
  set frequency-attractiveness-H3-10 count patches with[class-attractiveness-H3 = 10]
end

to calculate-attractiveness-H4
  set mean-natural-capital-H4 mean [natural-capital-H4]of patches with[natural-capital-H4 > -9999]
  set sd-natural-capital-H4 standard-deviation [natural-capital-H4]of patches with[natural-capital-H4 > -9999]
 
  ask patches
  [
    set z-natural-capital-H4 ifelse-value(natural-capital-H4 > -9999)
    [
      ifelse-value(sd-natural-capital-H4 > 0)
      [
        (natural-capital-H4 - mean-natural-capital-H4) / sd-natural-capital-H4
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
  
  ask patches
  [
     set class-natural-capital-H4 ifelse-value (z-natural-capital-H4 = -9999) 
     [
        -9999    
     ]
     [
       ifelse-value (z-natural-capital-H4 > -9999 and z-natural-capital-H4 < -4)
       [
         1
       ]
       [
         ifelse-value (z-natural-capital-H4 >= -4 and z-natural-capital-H4 < -3)
         [
           2
         ]
         [
           ifelse-value (z-natural-capital-H4 >= -3 and z-natural-capital-H4 < -2)
           [
             3
           ]
           [
             ifelse-value (z-natural-capital-H4 >= -2 and z-natural-capital-H4 < -1)
             [
               4
             ]
             [
               ifelse-value (z-natural-capital-H4 >= -1 and z-natural-capital-H4 < 0)
               [
                 5
               ]
               [
                 ifelse-value (z-natural-capital-H4 >= 0 and z-natural-capital-H4 < 1)
                 [
                   6
                 ]
                 [
                   ifelse-value (z-natural-capital-H4 >= 1 and z-natural-capital-H4 < 2)
                   [
                     7
                   ]
                   [
                     ifelse-value (z-natural-capital-H4 >= 2 and z-natural-capital-H4 < 3)
                     [
                       8
                     ]
                     [
                       ifelse-value (z-natural-capital-H4 >= 3 and z-natural-capital-H4 < 4)
                       [
                         9
                       ]
                       [
                         10
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
  ]
  
  ask patches
  [
    set attractiveness-H4 ifelse-value (z-natural-capital-H4 = -9999) 
    [
      -9999    
    ]
    [
      (
      (item 0 weight-benefit-H4 * class-natural-capital-H4) +
      (item 1 weight-benefit-H4 * class-pop) +
      (item 2 weight-benefit-H4 * class-hdi)
      )
      / 
      (1 + 
      (item 0 weight-cost-H4 * class-driver) + 
      (item 1 weight-cost-H4 * class-droad) + 
      (item 2 weight-cost-H4 * class-dcenter) + 
      (item 3 weight-cost-H4 * class-dport) +
      (item 4 weight-cost-H4 * class-slope) +
      (item 5 weight-cost-H4 * class-dem) +   
      (item 6 weight-cost-H4 * class-equake) +
      (item 7 weight-cost-H4 * class-dset)
      )
    ]
  ]
  
  set mean-attractiveness-H4 mean [attractiveness-H4]of patches with[attractiveness-H4 > -9999]
  set sd-attractiveness-H4 standard-deviation [attractiveness-H4]of patches with[attractiveness-H4 > -9999]
  
  ask patches
  [
    set z-attractiveness-H4 ifelse-value(attractiveness-H4 > -9999)
    [
      ifelse-value(sd-attractiveness-H4 > 0)
      [
        (attractiveness-H4 - mean-attractiveness-H4) / sd-attractiveness-H4
      ]
      [
        10
      ]
    ]
    [
      -9999
    ]
  ]
  
  ask patches
  [
     ifelse scenario = "rtrw"
     [
       set class-attractiveness-H4 ifelse-value 
       (
         z-attractiveness-H4 = -9999 or 
         (value-tghk = 1 or value-tghk = 2 or value-tghk = 4 or value-tghk = 7 or value-tghk = 8) or 
         (value-landuse = 1 or value-landuse = 5 or value-landuse = 6 or value-landuse = 9) or
         ((value-landuse = 7 or value-landuse = 8) and agriculture-age < 25) or
         ((value-landuse = 4) and plantation-age < 25) or
         value-slope > 40
       ) 
       [
         -9999    
       ]
       [
         ifelse-value (z-attractiveness-H4 > -9999 and z-attractiveness-H4 < -4)
         [
           1
         ]
         [
           ifelse-value (z-attractiveness-H4 >= -4 and z-attractiveness-H4 < -3)
           [
             2
           ]
           [
             ifelse-value (z-attractiveness-H4 >= -3 and z-attractiveness-H4 < -2)
             [
               3
             ]
             [
               ifelse-value (z-attractiveness-H4 >= -2 and z-attractiveness-H4 < -1)
               [
                 4
               ]
               [
                 ifelse-value (z-attractiveness-H4 >= -1 and z-attractiveness-H4 < 0)
                 [
                   5
                 ]
                 [
                   ifelse-value (z-attractiveness-H4 >= 0 and z-attractiveness-H4 < 1)
                   [
                     6
                   ]
                   [
                     ifelse-value (z-attractiveness-H4 >= 1 and z-attractiveness-H4 < 2)
                     [
                       7
                     ]
                     [
                       ifelse-value (z-attractiveness-H4 >= 2 and z-attractiveness-H4 < 3)
                       [
                         8
                       ]
                       [
                         ifelse-value (z-attractiveness-H4 >= 3 and z-attractiveness-H4 < 4)
                         [
                           9
                         ]
                         [
                           10
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
     [
       ifelse scenario = "terbatas"
       [
         set class-attractiveness-H4 ifelse-value 
         (
           z-attractiveness-H4 = -9999 or 
           (value-landuse = 1 or value-landuse = 5 or value-landuse = 6 or value-landuse = 9) or
           ((value-landuse = 7 or value-landuse = 8) and agriculture-age < 25) or
           ((value-landuse = 4) and plantation-age < 25) or
           value-slope > 40
         ) 
         [
           -9999    
         ]
         [
           ifelse-value (z-attractiveness-H4 > -9999 and z-attractiveness-H4 < -4)
           [
             1
           ]
           [
             ifelse-value (z-attractiveness-H4 >= -4 and z-attractiveness-H4 < -3)
             [
               2
             ]
             [
               ifelse-value (z-attractiveness-H4 >= -3 and z-attractiveness-H4 < -2)
               [
                 3
               ]
               [
                 ifelse-value (z-attractiveness-H4 >= -2 and z-attractiveness-H4 < -1)
                 [
                   4
                 ]
                 [
                   ifelse-value (z-attractiveness-H4 >= -1 and z-attractiveness-H4 < 0)
                   [
                     5
                   ]
                   [
                     ifelse-value (z-attractiveness-H4 >= 0 and z-attractiveness-H4 < 1)
                     [
                       6
                     ]
                     [
                       ifelse-value (z-attractiveness-H4 >= 1 and z-attractiveness-H4 < 2)
                       [
                         7
                       ]
                       [
                         ifelse-value (z-attractiveness-H4 >= 2 and z-attractiveness-H4 < 3)
                         [
                           8
                         ]
                         [
                           ifelse-value (z-attractiveness-H4 >= 3 and z-attractiveness-H4 < 4)
                           [
                             9
                           ]
                           [
                             10
                           ]
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
       [
         set class-attractiveness-H4 ifelse-value 
         (
           z-attractiveness-H4 = -9999 or 
           (value-tghk = 1 or value-tghk = 7 or value-tghk = 8) or 
           (value-landuse = 1 or value-landuse = 5 or value-landuse = 6 or value-landuse = 9) or
           ((value-landuse = 7 or value-landuse = 8) and agriculture-age < 25) or
           ((value-landuse = 4) and plantation-age < 25) or
           value-slope > 40
         ) 
         [
           -9999    
         ]
         [
           ifelse-value (z-attractiveness-H4 > -9999 and z-attractiveness-H4 < -4)
           [
             1
           ]
           [
             ifelse-value (z-attractiveness-H4 >= -4 and z-attractiveness-H4 < -3)
             [
               2
             ]
             [
               ifelse-value (z-attractiveness-H4 >= -3 and z-attractiveness-H4 < -2)
               [
                 3
               ]
               [
                 ifelse-value (z-attractiveness-H4 >= -2 and z-attractiveness-H4 < -1)
                 [
                   4
                 ]
                 [
                   ifelse-value (z-attractiveness-H4 >= -1 and z-attractiveness-H4 < 0)
                   [
                     5
                   ]
                   [
                     ifelse-value (z-attractiveness-H4 >= 0 and z-attractiveness-H4 < 1)
                     [
                       6
                     ]
                     [
                       ifelse-value (z-attractiveness-H4 >= 1 and z-attractiveness-H4 < 2)
                       [
                         7
                       ]
                       [
                         ifelse-value (z-attractiveness-H4 >= 2 and z-attractiveness-H4 < 3)
                         [
                           8
                         ]
                         [
                           ifelse-value (z-attractiveness-H4 >= 3 and z-attractiveness-H4 < 4)
                           [
                             9
                           ]
                           [
                             10
                           ]
                         ]
                       ]
                     ]
                   ]
                 ]
               ]
             ]
           ]
         ]
       ]
     ]
  ]
  
  
  set frequency-attractiveness-H4-1 count patches with[class-attractiveness-H4 = 1]
  set frequency-attractiveness-H4-2 count patches with[class-attractiveness-H4 = 2]
  set frequency-attractiveness-H4-3 count patches with[class-attractiveness-H4 = 3]
  set frequency-attractiveness-H4-4 count patches with[class-attractiveness-H4 = 4]
  set frequency-attractiveness-H4-5 count patches with[class-attractiveness-H4 = 5]
  set frequency-attractiveness-H4-6 count patches with[class-attractiveness-H4 = 6]
  set frequency-attractiveness-H4-7 count patches with[class-attractiveness-H4 = 7]
  set frequency-attractiveness-H4-8 count patches with[class-attractiveness-H4 = 8]
  set frequency-attractiveness-H4-9 count patches with[class-attractiveness-H4 = 9]
  set frequency-attractiveness-H4-10 count patches with[class-attractiveness-H4 = 10]
end


to execute-H1[area]
  set probability-attractiveness-H1-10 ifelse-value (frequency-attractiveness-H1-10 > 0)  
  [
    min list area frequency-attractiveness-H1-10 / frequency-attractiveness-H1-10
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-9 ifelse-value (frequency-attractiveness-H1-9 > 0)  
  [
    (max list 0 min list (area - frequency-attractiveness-H1-10) frequency-attractiveness-H1-9) / frequency-attractiveness-H1-9
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-8 ifelse-value (frequency-attractiveness-H1-8 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H1-10 + frequency-attractiveness-H1-9)) frequency-attractiveness-H1-8) / frequency-attractiveness-H1-8
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-7 ifelse-value (frequency-attractiveness-H1-7 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H1-10 + frequency-attractiveness-H1-9 + frequency-attractiveness-H1-8)) frequency-attractiveness-H1-7) / frequency-attractiveness-H1-7
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-6 ifelse-value (frequency-attractiveness-H1-6 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H1-10 + frequency-attractiveness-H1-9 + frequency-attractiveness-H1-8 + frequency-attractiveness-H1-7)) frequency-attractiveness-H1-6) / frequency-attractiveness-H1-6
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-5 ifelse-value (frequency-attractiveness-H1-5 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H1-10 + frequency-attractiveness-H1-9 + frequency-attractiveness-H1-8 + frequency-attractiveness-H1-7 + frequency-attractiveness-H1-6)) frequency-attractiveness-H1-5) / frequency-attractiveness-H1-5
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-4 ifelse-value (frequency-attractiveness-H1-4 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H1-10 + frequency-attractiveness-H1-9 + frequency-attractiveness-H1-8 + frequency-attractiveness-H1-7 + frequency-attractiveness-H1-6 + frequency-attractiveness-H1-5)) frequency-attractiveness-H1-4) / frequency-attractiveness-H1-4
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-3 ifelse-value (frequency-attractiveness-H1-3 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H1-10 + frequency-attractiveness-H1-9 + frequency-attractiveness-H1-8 + frequency-attractiveness-H1-7 + frequency-attractiveness-H1-6 + frequency-attractiveness-H1-5 + frequency-attractiveness-H1-4)) frequency-attractiveness-H1-3) / frequency-attractiveness-H1-3
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-2 ifelse-value (frequency-attractiveness-H1-2 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H1-10 + frequency-attractiveness-H1-9 + frequency-attractiveness-H1-8 + frequency-attractiveness-H1-7 + frequency-attractiveness-H1-6 + frequency-attractiveness-H1-5 + frequency-attractiveness-H1-4 + frequency-attractiveness-H1-3)) frequency-attractiveness-H1-2) / frequency-attractiveness-H1-2
  ]
  [
    0
  ]
  
  set probability-attractiveness-H1-1 ifelse-value (frequency-attractiveness-H1-1 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H1-10 + frequency-attractiveness-H1-9 + frequency-attractiveness-H1-8 + frequency-attractiveness-H1-7 + frequency-attractiveness-H1-6 + frequency-attractiveness-H1-5 + frequency-attractiveness-H1-4 + frequency-attractiveness-H1-3 + frequency-attractiveness-H1-2)) frequency-attractiveness-H1-1) / frequency-attractiveness-H1-1
  ]
  [
    0
  ]
  
  ask patches
  [
     set probability-H1 ifelse-value (class-attractiveness-H1 = -9999) 
     [
        0    
     ]
     [
       ifelse-value (class-attractiveness-H1 = 1)
       [
         probability-attractiveness-H1-1
       ]
       [
         ifelse-value (class-attractiveness-H1 = 2)
         [
           probability-attractiveness-H1-2
         ]
         [
            ifelse-value (class-attractiveness-H1 = 3)
            [
              probability-attractiveness-H1-3
            ]
            [
              ifelse-value (class-attractiveness-H1 = 4)
              [
                probability-attractiveness-H1-4
              ]
              [
                ifelse-value (class-attractiveness-H1 = 5)
                [
                  probability-attractiveness-H1-5
                ]
                [
                  ifelse-value (class-attractiveness-H1 = 6)
                  [
                    probability-attractiveness-H1-6
                  ]
                  [
                   ifelse-value (class-attractiveness-H1 = 7)
                   [
                     probability-attractiveness-H1-7
                   ]
                   [
                     ifelse-value (class-attractiveness-H1 = 8)
                     [
                       probability-attractiveness-H1-8
                     ]
                     [
                       ifelse-value (class-attractiveness-H1 = 9)
                       [
                         probability-attractiveness-H1-9
                       ]
                       [
                         probability-attractiveness-H1-10
                       ] 
                     ]
                   ]   
                  ]
                ]
              ]
            ]
         ]
       ]
     ]
  ]
  
  ask patches with[value-landuse = 1]
  [
    if (random-float 1 < probability-H1)
    [
      set value-landuse 2
      set forest-age 50
    ]
  ]
  
  ask patches with[value-landuse = 2]
  [
    if (random-float 1 < probability-H1)
    [
      set value-landuse 3
      set forest-age 5
    ]
  ]
end

to execute-H2[area]
  set probability-attractiveness-H2-10 ifelse-value (frequency-attractiveness-H2-10 > 0)  
  [
    min list area frequency-attractiveness-H2-10 / frequency-attractiveness-H2-10
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-9 ifelse-value (frequency-attractiveness-H2-9 > 0)  
  [
    (max list 0 min list (area - frequency-attractiveness-H2-10) frequency-attractiveness-H2-9) / frequency-attractiveness-H2-9
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-8 ifelse-value (frequency-attractiveness-H2-8 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H2-10 + frequency-attractiveness-H2-9)) frequency-attractiveness-H2-8) / frequency-attractiveness-H2-8
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-7 ifelse-value (frequency-attractiveness-H2-7 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H2-10 + frequency-attractiveness-H2-9 + frequency-attractiveness-H2-8)) frequency-attractiveness-H2-7) / frequency-attractiveness-H2-7
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-6 ifelse-value (frequency-attractiveness-H2-6 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H2-10 + frequency-attractiveness-H2-9 + frequency-attractiveness-H2-8 + frequency-attractiveness-H2-7)) frequency-attractiveness-H2-6) / frequency-attractiveness-H2-6
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-5 ifelse-value (frequency-attractiveness-H2-5 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H2-10 + frequency-attractiveness-H2-9 + frequency-attractiveness-H2-8 + frequency-attractiveness-H2-7 + frequency-attractiveness-H2-6)) frequency-attractiveness-H2-5) / frequency-attractiveness-H2-5
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-4 ifelse-value (frequency-attractiveness-H2-4 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H2-10 + frequency-attractiveness-H2-9 + frequency-attractiveness-H2-8 + frequency-attractiveness-H2-7 + frequency-attractiveness-H2-6 + frequency-attractiveness-H2-5)) frequency-attractiveness-H2-4) / frequency-attractiveness-H2-4
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-3 ifelse-value (frequency-attractiveness-H2-3 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H2-10 + frequency-attractiveness-H2-9 + frequency-attractiveness-H2-8 + frequency-attractiveness-H2-7 + frequency-attractiveness-H2-6 + frequency-attractiveness-H2-5 + frequency-attractiveness-H2-4)) frequency-attractiveness-H2-3) / frequency-attractiveness-H2-3
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-2 ifelse-value (frequency-attractiveness-H2-2 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H2-10 + frequency-attractiveness-H2-9 + frequency-attractiveness-H2-8 + frequency-attractiveness-H2-7 + frequency-attractiveness-H2-6 + frequency-attractiveness-H2-5 + frequency-attractiveness-H2-4 + frequency-attractiveness-H2-3)) frequency-attractiveness-H2-2) / frequency-attractiveness-H2-2
  ]
  [
    0
  ]
  
  set probability-attractiveness-H2-1 ifelse-value (frequency-attractiveness-H2-1 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H2-10 + frequency-attractiveness-H2-9 + frequency-attractiveness-H2-8 + frequency-attractiveness-H2-7 + frequency-attractiveness-H2-6 + frequency-attractiveness-H2-5 + frequency-attractiveness-H2-4 + frequency-attractiveness-H2-3 + frequency-attractiveness-H2-2)) frequency-attractiveness-H2-1) / frequency-attractiveness-H2-1
  ]
  [
    0
  ]
  
  ask patches
  [
     set probability-H2 ifelse-value (class-attractiveness-H2 = -9999) 
     [
        0    
     ]
     [
       ifelse-value (class-attractiveness-H2 = 1)
       [
         probability-attractiveness-H2-1
       ]
       [
         ifelse-value (class-attractiveness-H2 = 2)
         [
           probability-attractiveness-H2-2
         ]
         [
            ifelse-value (class-attractiveness-H2 = 3)
            [
              probability-attractiveness-H2-3
            ]
            [
              ifelse-value (class-attractiveness-H2 = 4)
              [
                probability-attractiveness-H2-4
              ]
              [
                ifelse-value (class-attractiveness-H2 = 5)
                [
                  probability-attractiveness-H2-5
                ]
                [
                  ifelse-value (class-attractiveness-H2 = 6)
                  [
                    probability-attractiveness-H2-6
                  ]
                  [
                   ifelse-value (class-attractiveness-H2 = 7)
                   [
                     probability-attractiveness-H2-7
                   ]
                   [
                     ifelse-value (class-attractiveness-H2 = 8)
                     [
                       probability-attractiveness-H2-8
                     ]
                     [
                       ifelse-value (class-attractiveness-H2 = 9)
                       [
                         probability-attractiveness-H2-9
                       ]
                       [
                         probability-attractiveness-H2-10
                       ] 
                     ]
                   ]   
                  ]
                ]
              ]
            ]
         ]
       ]
     ]
  ]
  
  ask patches with[value-landuse = 2 or value-landuse = 3]
  [
    if (random-float 1 < probability-H2)
    [
      set value-landuse ifelse-value (value-driver > 1000)
      [
        7
      ]
      [
        8
      ]
      set forest-age -9999
      set agriculture-age 0
    ]
  ]
  
  ask patches with[value-landuse = 4 and plantation-age >= 25]
  [
    if (random-float 1 < probability-H2)
    [
      set value-landuse ifelse-value (value-driver > 1000)
      [
        7
      ]
      [
        8
      ]
      set plantation-age -9999
      set agriculture-age 0
    ]
  ]
  
end

to execute-H3[area]
  set probability-attractiveness-H3-10 ifelse-value (frequency-attractiveness-H3-10 > 0)  
  [
    min list area frequency-attractiveness-H3-10 / frequency-attractiveness-H3-10
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-9 ifelse-value (frequency-attractiveness-H3-9 > 0)  
  [
    (max list 0 min list (area - frequency-attractiveness-H3-10) frequency-attractiveness-H3-9) / frequency-attractiveness-H3-9
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-8 ifelse-value (frequency-attractiveness-H3-8 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H3-10 + frequency-attractiveness-H3-9)) frequency-attractiveness-H3-8) / frequency-attractiveness-H3-8
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-7 ifelse-value (frequency-attractiveness-H3-7 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H3-10 + frequency-attractiveness-H3-9 + frequency-attractiveness-H3-8)) frequency-attractiveness-H3-7) / frequency-attractiveness-H3-7
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-6 ifelse-value (frequency-attractiveness-H3-6 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H3-10 + frequency-attractiveness-H3-9 + frequency-attractiveness-H3-8 + frequency-attractiveness-H3-7)) frequency-attractiveness-H3-6) / frequency-attractiveness-H3-6
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-5 ifelse-value (frequency-attractiveness-H3-5 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H3-10 + frequency-attractiveness-H3-9 + frequency-attractiveness-H3-8 + frequency-attractiveness-H3-7 + frequency-attractiveness-H3-6)) frequency-attractiveness-H3-5) / frequency-attractiveness-H3-5
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-4 ifelse-value (frequency-attractiveness-H3-4 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H3-10 + frequency-attractiveness-H3-9 + frequency-attractiveness-H3-8 + frequency-attractiveness-H3-7 + frequency-attractiveness-H3-6 + frequency-attractiveness-H3-5)) frequency-attractiveness-H3-4) / frequency-attractiveness-H3-4
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-3 ifelse-value (frequency-attractiveness-H3-3 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H3-10 + frequency-attractiveness-H3-9 + frequency-attractiveness-H3-8 + frequency-attractiveness-H3-7 + frequency-attractiveness-H3-6 + frequency-attractiveness-H3-5 + frequency-attractiveness-H3-4)) frequency-attractiveness-H3-3) / frequency-attractiveness-H3-3
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-2 ifelse-value (frequency-attractiveness-H3-2 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H3-10 + frequency-attractiveness-H3-9 + frequency-attractiveness-H3-8 + frequency-attractiveness-H3-7 + frequency-attractiveness-H3-6 + frequency-attractiveness-H3-5 + frequency-attractiveness-H3-4 + frequency-attractiveness-H3-3)) frequency-attractiveness-H3-2) / frequency-attractiveness-H3-2
  ]
  [
    0
  ]
  
  set probability-attractiveness-H3-1 ifelse-value (frequency-attractiveness-H3-1 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H3-10 + frequency-attractiveness-H3-9 + frequency-attractiveness-H3-8 + frequency-attractiveness-H3-7 + frequency-attractiveness-H3-6 + frequency-attractiveness-H3-5 + frequency-attractiveness-H3-4 + frequency-attractiveness-H3-3 + frequency-attractiveness-H3-2)) frequency-attractiveness-H3-1) / frequency-attractiveness-H3-1
  ]
  [
    0
  ]
  
  ask patches
  [
     set probability-H3 ifelse-value (class-attractiveness-H3 = -9999) 
     [
        0    
     ]
     [
       ifelse-value (class-attractiveness-H3 = 1)
       [
         probability-attractiveness-H3-1
       ]
       [
         ifelse-value (class-attractiveness-H3 = 2)
         [
           probability-attractiveness-H3-2
         ]
         [
            ifelse-value (class-attractiveness-H3 = 3)
            [
              probability-attractiveness-H3-3
            ]
            [
              ifelse-value (class-attractiveness-H3 = 4)
              [
                probability-attractiveness-H3-4
              ]
              [
                ifelse-value (class-attractiveness-H3 = 5)
                [
                  probability-attractiveness-H3-5
                ]
                [
                  ifelse-value (class-attractiveness-H3 = 6)
                  [
                    probability-attractiveness-H3-6
                  ]
                  [
                   ifelse-value (class-attractiveness-H3 = 7)
                   [
                     probability-attractiveness-H3-7
                   ]
                   [
                     ifelse-value (class-attractiveness-H3 = 8)
                     [
                       probability-attractiveness-H3-8
                     ]
                     [
                       ifelse-value (class-attractiveness-H3 = 9)
                       [
                         probability-attractiveness-H3-9
                       ]
                       [
                         probability-attractiveness-H3-10
                       ] 
                     ]
                   ]   
                  ]
                ]
              ]
            ]
         ]
       ]
     ]
  ]
  
  ask patches with[value-landuse = 2 or value-landuse = 3]
  [
    if (random-float 1 < probability-H3)
    [
      set value-landuse 4
      set forest-age -9999
      set plantation-age 0
    ]
  ]
  
  ask patches with[value-landuse = 7 or value-landuse = 8]
  [
    if (random-float 1 < probability-H3)
    [
      set value-landuse 4
      set agriculture-age -9999
      set plantation-age 0
    ]
  ]
end

to execute-H4[area]
  set probability-attractiveness-H4-10 ifelse-value (frequency-attractiveness-H4-10 > 0)  
  [
    min list area frequency-attractiveness-H4-10 / frequency-attractiveness-H4-10
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-9 ifelse-value (frequency-attractiveness-H4-9 > 0)  
  [
    (max list 0 min list (area - frequency-attractiveness-H4-10) frequency-attractiveness-H4-9) / frequency-attractiveness-H4-9
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-8 ifelse-value (frequency-attractiveness-H4-8 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H4-10 + frequency-attractiveness-H4-9)) frequency-attractiveness-H4-8) / frequency-attractiveness-H4-8
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-7 ifelse-value (frequency-attractiveness-H4-7 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H4-10 + frequency-attractiveness-H4-9 + frequency-attractiveness-H4-8)) frequency-attractiveness-H4-7) / frequency-attractiveness-H4-7
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-6 ifelse-value (frequency-attractiveness-H4-6 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H4-10 + frequency-attractiveness-H4-9 + frequency-attractiveness-H4-8 + frequency-attractiveness-H4-7)) frequency-attractiveness-H4-6) / frequency-attractiveness-H4-6
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-5 ifelse-value (frequency-attractiveness-H4-5 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H4-10 + frequency-attractiveness-H4-9 + frequency-attractiveness-H4-8 + frequency-attractiveness-H4-7 + frequency-attractiveness-H4-6)) frequency-attractiveness-H4-5) / frequency-attractiveness-H4-5
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-4 ifelse-value (frequency-attractiveness-H4-4 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H4-10 + frequency-attractiveness-H4-9 + frequency-attractiveness-H4-8 + frequency-attractiveness-H4-7 + frequency-attractiveness-H4-6 + frequency-attractiveness-H4-5)) frequency-attractiveness-H4-4) / frequency-attractiveness-H4-4
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-3 ifelse-value (frequency-attractiveness-H4-3 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H4-10 + frequency-attractiveness-H4-9 + frequency-attractiveness-H4-8 + frequency-attractiveness-H4-7 + frequency-attractiveness-H4-6 + frequency-attractiveness-H4-5 + frequency-attractiveness-H4-4)) frequency-attractiveness-H4-3) / frequency-attractiveness-H4-3
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-2 ifelse-value (frequency-attractiveness-H4-2 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H4-10 + frequency-attractiveness-H4-9 + frequency-attractiveness-H4-8 + frequency-attractiveness-H4-7 + frequency-attractiveness-H4-6 + frequency-attractiveness-H4-5 + frequency-attractiveness-H4-4 + frequency-attractiveness-H4-3)) frequency-attractiveness-H4-2) / frequency-attractiveness-H4-2
  ]
  [
    0
  ]
  
  set probability-attractiveness-H4-1 ifelse-value (frequency-attractiveness-H4-1 > 0)  
  [
    (max list 0 min list (area - (frequency-attractiveness-H4-10 + frequency-attractiveness-H4-9 + frequency-attractiveness-H4-8 + frequency-attractiveness-H4-7 + frequency-attractiveness-H4-6 + frequency-attractiveness-H4-5 + frequency-attractiveness-H4-4 + frequency-attractiveness-H4-3 + frequency-attractiveness-H4-2)) frequency-attractiveness-H4-1) / frequency-attractiveness-H4-1
  ]
  [
    0
  ]
  
  ask patches
  [
     set probability-H4 ifelse-value (class-attractiveness-H4 = -9999) 
     [
        0    
     ]
     [
       ifelse-value (class-attractiveness-H4 = 1)
       [
         probability-attractiveness-H4-1
       ]
       [
         ifelse-value (class-attractiveness-H4 = 2)
         [
           probability-attractiveness-H4-2
         ]
         [
            ifelse-value (class-attractiveness-H4 = 3)
            [
              probability-attractiveness-H4-3
            ]
            [
              ifelse-value (class-attractiveness-H4 = 4)
              [
                probability-attractiveness-H4-4
              ]
              [
                ifelse-value (class-attractiveness-H4 = 5)
                [
                  probability-attractiveness-H4-5
                ]
                [
                  ifelse-value (class-attractiveness-H4 = 6)
                  [
                    probability-attractiveness-H4-6
                  ]
                  [
                   ifelse-value (class-attractiveness-H4 = 7)
                   [
                     probability-attractiveness-H4-7
                   ]
                   [
                     ifelse-value (class-attractiveness-H4 = 8)
                     [
                       probability-attractiveness-H4-8
                     ]
                     [
                       ifelse-value (class-attractiveness-H4 = 9)
                       [
                         probability-attractiveness-H4-9
                       ]
                       [
                         probability-attractiveness-H4-10
                       ] 
                     ]
                   ]   
                  ]
                ]
              ]
            ]
         ]
       ]
     ]
  ]
  
  ask patches with[value-landuse = 2 or value-landuse = 3]
  [
    if (random-float 1 < probability-H4)
    [
      set value-landuse 5
      set forest-age -9999
    ]
  ]
  
  ask patches with[value-landuse = 4]
  [
    if (random-float 1 < probability-H4)
    [
      set value-landuse 5
      set plantation-age -9999
    ]
  ]
  
  ask patches with[value-landuse = 7 or value-landuse = 8]
  [
    if (random-float 1 < probability-H4)
    [
      set value-landuse 5
      set agriculture-age -9999
    ]
  ]
end

to calculate-natural-capital-H1
  ask patches
  [
     set natural-capital-H1 ifelse-value(value-landuse > -9999)
     [
       ifelse-value(value-landuse = 1) ;;primary forests 
       [
         10
       ] 
       [
         ifelse-value(value-landuse = 2) ;;secondary forests 
         [
           5
         ]
         [
           0
         ]
       ]
     ]
     [
       -9999
     ]
  ]
  
  ask patches
  [
     ifelse scenario = "rtrw"
     [
     
       set natural-capital-H1 ifelse-value(natural-capital-H1 > -9999)
       [
         ifelse-value(value-tghk = 5) ;;hutan produksi konversi
         [
           natural-capital-H1
         ] 
         [
           ifelse-value(value-tghk = 3) ;;hutan produksi tetap
           [
             .5 * natural-capital-H1
           ]
           [
             ifelse-value(value-tghk = 4) ;;hutan produksi terbatas
             [
               .25 * natural-capital-H1
             ]
             [
               0
             ]
           ]
         ]
       ]
       [
         -9999
       ]
     ]
     [
       ifelse scenario = "terbatas"
       [
     
         set natural-capital-H1 ifelse-value(natural-capital-H1 > -9999)
         [
           ifelse-value(value-tghk = 5 or value-tghk = 3) ;;hutan produksi konversi or hutan produksi tetap
           [
             natural-capital-H1
           ] 
           [
             ifelse-value(value-tghk = 4) ;;hutan produksi terbatas
             [
                .5 * natural-capital-H1
             ]
             [
               ifelse-value(value-tghk = 2) ;;hutan lindung
               [
                  .25 * natural-capital-H1
               ]
               [
                 0
               ]
             ]
           ]
         ]
         [
           -9999
         ]
       ]
       [
         set natural-capital-H1 ifelse-value(natural-capital-H1 > -9999)
         [
           ifelse-value(value-tghk = 5 or value-tghk = 3 or value-tghk = 4) ;;hutan produksi konversi or hutan produksi tetap or hutan produksi terbatas
           [
             natural-capital-H1
           ] 
           [
             ifelse-value(value-tghk = 2) ;;hutan lindung
             [
               .5 * natural-capital-H1
             ]
             [
               ifelse-value(value-tghk = 1 or value-tghk = 7) ;;suaka margasatwa or cagar alam
               [
                 .25 * natural-capital-H1
               ]
               [
                 0
               ]
             ]
           ]
         ]
         [
           -9999
         ]
       ]
     ]
  ]
end

to calculate-natural-capital-H2
  ask patches
  [
     set natural-capital-H2 ifelse-value(value-landuse > -9999)
     [
       ifelse-value(value-landuse = 2) ;;secondary forests
       [
         10
       ] 
       [
         ifelse-value(value-landuse = 3) ;;shrubs
         [
           5
         ]
         [
           ifelse-value(value-landuse = 4 and plantation-age >= 25) ;;plantations
           [
             2.5
           ]
           [
             0
           ]
         ]
       ]
     ]
     [
       -9999
     ]
  ]
  
  ask patches
  [
     ifelse scenario = "rtrw"
     [
     
       set natural-capital-H2 ifelse-value(natural-capital-H2 > -9999)
       [
         ifelse-value(value-tghk = 6) ;;apl
         [
           natural-capital-H2
         ] 
         [
           ifelse-value(value-tghk = 5) ;;hutan produksi konversi
           [
             .5 * natural-capital-H2
           ]
           [
             ifelse-value(value-tghk = 3) ;;hutan produksi tetap
             [
               .25 * natural-capital-H2
             ]
             [
               0
             ]
           ]
         ]
       ]
       [
         -9999
       ]
     ]
     [
       ifelse scenario = "terbatas"
       [
     
         set natural-capital-H2 ifelse-value(natural-capital-H2 > -9999)
         [
           ifelse-value(value-tghk = 6 or value-tghk = 5) ;;apl or hutan produksi konversi
           [
             natural-capital-H2
           ] 
           [
             ifelse-value(value-tghk = 3) ;;hutan produksi tetap
             [
               .5 * natural-capital-H2
             ]
             [
               ifelse-value(value-tghk = 4) ;;hutan produksi terbatas
               [
                 .25 * natural-capital-H2
               ]
               [
                 0
               ]
             ]
           ]
         ]
         [
           -9999
         ]
       ]
       [
         set natural-capital-H2 ifelse-value(natural-capital-H2 > -9999)
         [
           ifelse-value(value-tghk = 6 or value-tghk = 5 or value-tghk = 3) ;;apl or hutan produksi konversi or hutan produksi tetap
           [
             natural-capital-H2
           ] 
           [
             ifelse-value(value-tghk = 4) ;;hutan produksi terbatas
             [
               .5 * natural-capital-H2
             ]
             [
               ifelse-value(value-tghk = 2) ;;hutan lindung
               [
                 .25 * natural-capital-H2
               ]
               [
                 0
               ]
             ]
           ]
         ]
         [
           -9999
         ]
       ]
     ]
  ]
end

to calculate-natural-capital-H3
  ask patches
  [
     set natural-capital-H3 ifelse-value(value-landuse > -9999)
     [
       ifelse-value(value-landuse = 2) ;;secondary forests
       [
         10
       ] 
       [
         ifelse-value(value-landuse = 3) ;;shrubs
         [
           5
         ]
         [
           ifelse-value((value-landuse = 7 or value-landuse = 8) and agriculture-age >= 25) ;;agriculture
           [
             2.5
           ]
           [
             0
           ]
         ]
       ]
     ]
     [
       -9999
     ]
  ]
  
  ask patches
  [
     ifelse scenario = "rtrw"
     [
     
       set natural-capital-H3 ifelse-value(natural-capital-H3 > -9999)
       [
         ifelse-value(value-tghk = 6) ;;apl
         [
           natural-capital-H3
         ] 
         [
           ifelse-value(value-tghk = 5) ;;hutan produksi konversi
           [
             .5 * natural-capital-H3
           ]
           [
             ifelse-value(value-tghk = 3) ;;hutan produksi tetap
             [
               .25 * natural-capital-H3
             ]
             [
               0
             ]
           ]
         ]
       ]
       [
         -9999
       ]
     ]
     [
       ifelse scenario = "terbatas"
       [
     
         set natural-capital-H3 ifelse-value(natural-capital-H3 > -9999)
         [
           ifelse-value(value-tghk = 6 or value-tghk = 5) ;;apl or hutan produksi konversi
           [
             natural-capital-H3
           ] 
           [
             ifelse-value(value-tghk = 3) ;;hutan produksi tetap
             [
               .5 * natural-capital-H3
             ]
             [
               ifelse-value(value-tghk = 4) ;;hutan produksi terbatas
               [
                 .25 * natural-capital-H3
               ]
               [
                 0
               ]
             ]
           ]
         ]
         [
           -9999
         ]
       ]
       [
         set natural-capital-H3 ifelse-value(natural-capital-H3 > -9999)
         [
           ifelse-value(value-tghk = 6 or value-tghk = 5 or value-tghk = 3) ;;apl or hutan produksi konversi or hutan produksi tetap
           [
             natural-capital-H3
           ] 
           [
             ifelse-value(value-tghk = 4) ;;hutan produksi terbatas
             [
               .5 * natural-capital-H3
             ]
             [
               ifelse-value(value-tghk = 2) ;;hutan lindung
               [
                 .25 * natural-capital-H3
               ]
               [
                 0
               ]
             ]
           ]
         ]
         [
           -9999
         ]
       ]
     ]
  ]
end

to calculate-natural-capital-H4
  ask patches
  [
     set natural-capital-H4 ifelse-value(value-landuse > -9999)
     [
       ifelse-value(value-landuse = 2) ;;secondary forests
       [
         2.5
       ] 
       [
         ifelse-value(value-landuse = 4 and plantation-age >= 25) ;;plantation
         [
           7.5
         ]
         [
           ifelse-value((value-landuse = 7 or value-landuse = 8) and agriculture-age >= 25) ;;agriculture
           [
             10
           ]
           [
             ifelse-value(value-landuse = 3) ;;shrubs
             [
               5
             ]
             [
               0
             ]
           ]
         ]
       ]
     ]
     [
       -9999
     ]
  ]
  
  ask patches
  [
     ifelse scenario = "rtrw"
     [
     
       set natural-capital-H4 ifelse-value(natural-capital-H4 > -9999)
       [
         ifelse-value(value-tghk = 6) ;;apl
         [
           natural-capital-H4
         ] 
         [
           ifelse-value(value-tghk = 5) ;;hutan produksi konversi
           [
             .5 * natural-capital-H4
           ]
           [
             ifelse-value(value-tghk = 3) ;;hutan produksi tetap
             [
               .25 * natural-capital-H4
             ]
             [
               0
             ]
           ]
         ]
       ]
       [
         -9999
       ]
     ]
     [
       ifelse scenario = "terbatas"
       [
     
         set natural-capital-H4 ifelse-value(natural-capital-H4 > -9999)
         [
           ifelse-value(value-tghk = 6 or value-tghk = 5) ;;apl or hutan produksi konversi
           [
             natural-capital-H4
           ] 
           [
             ifelse-value(value-tghk = 3) ;;hutan produksi tetap
             [
               .5 * natural-capital-H4
             ]
             [
               ifelse-value(value-tghk = 4) ;;hutan produksi terbatas
               [
                 .25 * natural-capital-H4
               ]
               [
                 0
               ]
             ]
           ]
         ]
         [
           -9999
         ]
       ]
       [
         set natural-capital-H4 ifelse-value(natural-capital-H4 > -9999)
         [
           ifelse-value(value-tghk = 6 or value-tghk = 5 or value-tghk = 3) ;;apl or hutan produksi konversi or hutan produksi tetap
           [
             natural-capital-H4
           ] 
           [
             ifelse-value(value-tghk = 4) ;;hutan produksi terbatas
             [
               .5 * natural-capital-H4
             ]
             [
               ifelse-value(value-tghk = 2) ;;hutan lindung
               [
                 .25 * natural-capital-H4
               ]
               [
                 0
               ]
             ]
           ]
         ]
         [
           -9999
         ]
       ]
     ]
  ]
end

to convert-H1
  calculate-natural-capital-H1
  calculate-attractiveness-H1
end

to convert-H2
  calculate-natural-capital-H2
  calculate-attractiveness-H2
end

to convert-H3
  calculate-natural-capital-H3
  calculate-attractiveness-H3
end

to convert-H4
  calculate-natural-capital-H4
  calculate-attractiveness-H4
end

to convert-H
  if simulation-year < length area-H1
  [
	let h1 round ((item simulation-year area-H1) / cell-area) 
	let h2 round ((item simulation-year area-H2) / cell-area)  
	let h3 round ((item simulation-year area-H3) / cell-area) 
	let h4 round ((item simulation-year area-H4) / cell-area) 
        
    let h1? false
    let h2? false
    let h3? false
    let h4? false
    
    let h sort-by [?1 > ?2] lput h4 lput h3 list h1 h2
    let a first h
    ifelse a = h1 and not h1?
    [
      convert-H1
      execute-H1 h1
      set h1? true
    ]
    [
      ifelse a = h2 and not h2?
      [
        convert-H2
        execute-H2 h2
        set h2? true
      ]
      [
        ifelse a = h3 and not h3?
        [
          convert-H3
          execute-H3 h3
          set h3? true
        ]
        [
          ifelse a = h4 and not h4?
          [
            convert-H4
            execute-H4 h4
            set h4? true
          ]
          [
          ]
        ]
      ]
    ]
    
    repeat 3
    [
      set h bf h
      set a first h
      ifelse a = h1 and not h1?
      [
        convert-H1
        execute-H1 h1
        set h1? true
      ]
      [
        ifelse a = h2 and not h2?
        [
          convert-H2
          execute-H2 h2
          set h2? true
        ]
        [
          ifelse a = h3 and not h3?
          [
            convert-H3
            execute-H3 h3
            set h3? true
          ]
          [
            ifelse a = h4 and not h4?
            [
              convert-H4
              execute-H4 h4
              set h4? true
            ]
            [
            ]
          ]
        ]
      ]
    ]
    
  ]
end

to convert-N
  ask patches 
  [
    set value-landuse ifelse-value (forest-age >= 5 and forest-age < 30) 
    [
      3
    ]
    [
      ifelse-value (forest-age >= 30 and forest-age < 100)
      [
        2
      ]
      [
        ifelse-value (forest-age >= 100)
        [
          1
        ]
        [
          value-landuse
        ]
      ]
    ]
  ]
end


to update
  set simulation-year simulation-year + 1
  set year year + 1
  
  ask patches with[value-landuse >= 1 and value-landuse <= 3]
  [  
     set forest-age forest-age + 1
  ]
  
  ask patches with[value-landuse = 7 or value-landuse = 8]
  [  
     set agriculture-age agriculture-age + 1
  ]
end


to read-raster-maps  
  set map-driver read-map word "data/input/map/" word areaname word "/" word resolution "/mapdriver.asc"
  resize map-driver
  gis:apply-raster map-driver value-driver
  
  set map-droad read-map word "data/input/map/" word areaname word "/" word resolution "/mapdroad.asc"
  gis:apply-raster map-droad value-droad
  
  ;;1=hutan primer, 2=hutan sekunder, 3=semak belukar, 4=perkebunan, 5=pemukiman, 6=badan air, 7=pertanian lahan kering, 8=sawah, 9=rawa
  set map-landuse read-map word "data/input/map/" word areaname word "/" word resolution "/maplanduse.asc"
  gis:apply-raster map-landuse value-landuse
  
  ;;1=suaka margasatwa, 2=hutan lindung, 3=hutan produksi, 4=hutan produksi terbatas, 5=hutan produksi konversi, 6=apl, 7=cagar alam, 8=danau
  set map-tghk read-map word "data/input/map/" word areaname word "/" word resolution "/maptghk.asc"
  gis:apply-raster map-tghk value-tghk
  
  set map-slope read-map word "data/input/map/" word areaname word "/" word resolution "/mapslope.asc"
  gis:apply-raster map-slope value-slope
  
  set map-dplant read-map word "data/input/map/" word areaname word "/" word resolution "/mapdplant.asc"
  gis:apply-raster map-dplant value-dplant
  
  set map-dagr read-map word "data/input/map/" word areaname word "/" word resolution "/mapdagr.asc"
  gis:apply-raster map-dagr value-dagr
  
  set map-dset read-map word "data/input/map/" word areaname word "/" word resolution "/mapdset.asc"
  gis:apply-raster map-dset value-dset
  
  set map-dem read-map word "data/input/map/" word areaname word "/" word resolution "/mapdem.asc"
  gis:apply-raster map-dem value-dem
  
  set map-pop read-map word "data/input/map/" word areaname word "/" word resolution "/mappop.asc"
  gis:apply-raster map-pop value-pop
  
  set map-hdi read-map word "data/input/map/" word areaname word "/" word resolution "/maphdi.asc"
  gis:apply-raster map-hdi value-hdi
  
  set map-dcenter read-map word "data/input/map/" word areaname word "/" word resolution "/mapdcenter.asc"
  gis:apply-raster map-dcenter value-dcenter
  
  set map-dport read-map word "data/input/map/" word areaname word "/" word resolution "/mapdport.asc"
  gis:apply-raster map-dport value-dport
  
  set map-equake read-map word "data/input/map/" word areaname word "/" word resolution "/mapequake.asc"
  gis:apply-raster map-equake value-equake
  
  ask patches
  [
    set value-driver ifelse-value (value-driver <= 0 or value-driver >= 0)
    [
      value-driver
    ]
    [
      -9999
    ]
  
    set value-droad ifelse-value (value-droad <= 0 or value-droad >= 0)
    [
      value-droad
    ]
    [
      -9999
    ]
    
    set value-dplant ifelse-value (value-dplant <= 0 or value-dplant >= 0)
    [
      value-dplant
    ]
    [
      -9999
    ]
    
    set value-dagr ifelse-value (value-dagr <= 0 or value-dagr >= 0)
    [
      value-dagr
    ]
    [
      -9999
    ]
    
    set value-dset ifelse-value (value-dset <= 0 or value-dset >= 0)
    [
      value-dset
    ]
    [
      -9999
    ]
  
    set value-landuse ifelse-value (value-landuse <= 0 or value-landuse >= 0)
    [
      value-landuse
    ]
    [
      -9999
    ]
    
    set value-tghk ifelse-value (value-tghk <= 0 or value-tghk >= 0)
    [
      value-tghk
    ]
    [
      -9999
    ]
    
    set value-slope ifelse-value (value-slope <= 0 or value-slope >= 0)
    [
      value-slope
    ]
    [
      -9999
    ]
    
    set value-dem ifelse-value (value-dem <= 0 or value-dem >= 0)
    [
      value-dem
    ]
    [
      -9999
    ]
    
    set value-pop ifelse-value (value-pop <= 0 or value-pop >= 0)
    [
      value-pop
    ]
    [
      -9999
    ]
    
    set value-hdi ifelse-value (value-hdi <= 0 or value-hdi >= 0)
    [
      value-hdi
    ]
    [
      -9999
    ]
    
    set value-dcenter ifelse-value (value-dcenter <= 0 or value-dcenter >= 0)
    [
      value-dcenter
    ]
    [
      -9999
    ]
    
    set value-dport ifelse-value (value-dport <= 0 or value-dport >= 0)
    [
      value-dport
    ]
    [
      -9999
    ]
    
    set value-equake ifelse-value (value-equake <= 0 or value-equake >= 0)
    [
      value-equake
    ]
    [
      -9999
    ]
    
  ]
end

;;to read raster map
to-report read-map[m]
  let r gis:load-dataset m
  gis:set-world-envelope gis:envelope-of r  
  report r
end

to export-maps
  set map-landuse gis:patch-dataset value-landuse
  let f word "data/output/" word outputDir word "/" word (word "landuse" simulation-year) ".asc"
  gis:store-dataset map-landuse f
end

;;to resize world
to resize[r]
  resize-world min-pxcor (min-pycor + gis:width-of r) min-pycor (min-pycor + gis:height-of r)
end

to initialize-change-area
  set time-list []
  set area-primary-forest []
  set area-secondary-forest []
  set area-shrubs []
  set area-plantation []
  set area-settlement []
  set area-water-body []
  set area-dryland-agriculture []
  set area-rice-field []
  set area-swamp []
end 

to store-change-area
  set time-list lput year time-list
  set area-primary-forest lput (count patches with[value-landuse = 1] * cell-area) area-primary-forest
  set area-secondary-forest lput (count patches with[value-landuse = 2] * cell-area) area-secondary-forest
  set area-shrubs lput (count patches with[value-landuse = 3] * cell-area) area-shrubs
  set area-plantation lput (count patches with[value-landuse = 4] * cell-area) area-plantation
  set area-settlement lput (count patches with[value-landuse = 5] * cell-area) area-settlement
  set area-water-body lput (count patches with[value-landuse = 6] * cell-area) area-water-body
  set area-dryland-agriculture lput (count patches with[value-landuse = 7] * cell-area) area-dryland-agriculture
  set area-rice-field lput (count patches with[value-landuse = 8] * cell-area) area-rice-field
  set area-swamp lput (count patches with[value-landuse = 9] * cell-area) area-swamp
end

to write-list[h l]
  let space " "
  let header h
  let data-list l
  
  file-write header
  file-type space
  file-type ":"
  file-type space
  file-type "["
  foreach bl data-list
  [
    file-type ?
    file-type ","
    file-type space
  ]
  file-type item ((length data-list) - 1) data-list
  file-type "]"
end

to report-change-area
  let space " "
  let comma ","
  
  file-open change-area-file
  file-type "{"
  file-type space
  
  write-list "year" time-list
  file-type comma
  file-type space
  
  write-list "primaryForest" area-primary-forest
  file-type comma
  file-type space
  
  write-list "secondaryForest" area-secondary-forest
  file-type comma
  file-type space
  
  write-list "shrubs" area-shrubs
  file-type comma
  file-type space
  
  write-list "plantation" area-plantation
  file-type comma
  file-type space
  
  write-list "settlement" area-settlement
  file-type comma
  file-type space
  
  write-list "waterBody" area-water-body
  file-type comma
  file-type space
  
  write-list "drylandAgriculture" area-dryland-agriculture
  file-type comma
  file-type space
  
  write-list "riceField" area-rice-field
  file-type comma
  file-type space
  
  write-list "swamp" area-swamp
  file-type space
 
  file-type "}"
  
  file-close
end

;to display-map-landuse
;  ask patches 
;  [  
;    set pcolor ifelse-value (value-landuse > 0)
;    [
;       item (value-landuse - 1) color-landuse
;    ]
;    [
;      white
;    ]
;  ]
;end

@#$#@#$#@
GRAPHICS-WINDOW
213
10
739
419
-1
-1
1.6634
1
48
1
1
1
0
0
0
1
0
310
0
227
0
0
1
ticks

@#$#@#$#@
WHAT IS IT?
-----------
This section could give a general understanding of what the model is trying to show or explain.


HOW IT WORKS
------------
This section could explain what rules the agents use to create the overall behavior of the model.


HOW TO USE IT
-------------
This section could explain how to use the model, including a description of each of the items in the interface tab.


THINGS TO NOTICE
----------------
This section could give some ideas of things for the user to notice while running the model.


THINGS TO TRY
-------------
This section could give some ideas of things for the user to try to do (move sliders, switches, etc.) with the model.


EXTENDING THE MODEL
-------------------
This section could give some ideas of things to add or change in the procedures tab to make the model more complicated, detailed, accurate, etc.


NETLOGO FEATURES
----------------
This section could point out any especially interesting or unusual features of NetLogo that the model makes use of, particularly in the Procedures tab.  It might also point out places where workarounds were needed because of missing features.


RELATED MODELS
--------------
This section could give the names of models in the NetLogo Models Library or elsewhere which are of related interest.


CREDITS AND REFERENCES
----------------------
This section could contain a reference to the model's URL on the web if it has one, as well as any other necessary credits or references.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 4.1.3
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
