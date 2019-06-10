let s:lightgrey = [ '#858db5', 244 ]
let s:bg = [ $BACKGROUND, $BACKGROUND_256]
let s:white = [ $WHITE, $WHITE_256]
let s:grey = [ $GREY, $GREY_256]
let s:yellow = [ $YELLOW, $YELLOW_256 ]
let s:red = [ $RED, $RED_256 ]
let s:magenta = [ $MAGENTA, $MAGENTA_256 ]
let s:blue = [ $BLUE, $BLUE_256 ]
let s:cyan = [ $CYAN, $CYAN_256 ]
let s:green = [ $GREEN, $GREEN_256 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'command': {}}
let s:p.normal.left = [ [ s:bg, s:green ], [ s:lightgrey, s:bg ] ]
let s:p.normal.right = copy(s:p.normal.left)

let s:p.inactive.right = [ [ s:bg, s:grey ], [ s:lightgrey, s:bg ] ]
let s:p.inactive.left =  copy(s:p.inactive.right)

let s:p.insert.left = [ [ s:bg, s:blue ], [ s:lightgrey, s:bg ] ]
let s:p.insert.right = copy(s:p.insert.left)

let s:p.replace.left = [ [ s:bg, s:red ], [ s:lightgrey, s:bg ] ]
let s:p.replace.right = copy(s:p.replace.left)

let s:p.visual.left = [ [ s:bg, s:magenta ], [ s:lightgrey, s:bg ] ]
let s:p.visual.right = copy(s:p.visual.left)

let s:p.normal.middle = [ [ s:lightgrey, s:bg ] ]
let s:p.inactive.middle = [ [ s:grey, s:bg ] ]

let s:p.tabline.left = [ [ s:white, s:grey ] ]
let s:p.tabline.tabsel = copy(s:p.tabline.left)
let s:p.tabline.middle = copy(s:p.tabline.left)
let s:p.tabline.right = copy(s:p.normal.left)

let s:p.command.left = [ [ s:bg, s:yellow ], [ s:lightgrey, s:bg ] ]
let s:p.command.right = copy(s:p.command.left)

let s:p.normal.error = [ [ s:red, s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]

let g:lightline#colorscheme#env#palette = lightline#colorscheme#flatten(s:p)
