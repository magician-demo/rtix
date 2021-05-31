import { library, dom } from '@fortawesome/fontawesome-svg-core'

import { faCheck, faTimes } from '@fortawesome/free-solid-svg-icons'

import { faCalendarAlt } from '@fortawesome/free-regular-svg-icons'

library.add( faCalendarAlt , faCheck, faTimes)

dom.watch()
