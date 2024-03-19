let s:lightgrey = [ '#858db5', 244 ]
let s:bg = [ '#1f1f28', 0 ]
let s:white = [ $WHITE, 0 ]
let s:grey = [ $GREY, 0 ]
let s:yellow = [ $YELLOW, 0  ]
let s:red = [ $RED, 0 ]
let s:magenta = [ $MAGENTA, 0 ]
let s:blue = [ $BLUE, 0 ]
let s:cyan = [ $CYAN, 0 ]
let s:green = [ $GREEN, 0 ]

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

let s:p.normal.info = [ [ s:blue, s:bg ] ]
let s:p.normal.error = [ [ s:bg, s:red ] ]
let s:p.normal.warning = [ [ s:bg, s:yellow ] ]

let g:lightline#colorscheme#env#palette = lightline#colorscheme#flatten(s:p)
