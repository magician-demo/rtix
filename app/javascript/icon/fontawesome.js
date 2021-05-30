import { library, dom } from '@fortawesome/fontawesome-svg-core'

import { faCalendarAlt as fasFaCalendarAlt, faGuitar, faAtlas, faPalette, faHeart, faUtensils, faMountain, faSearch, faTicketAlt } from '@fortawesome/free-solid-svg-icons'

import { faCalendarAlt as farFaCalendarAlt } from '@fortawesome/free-regular-svg-icons'

import { faFacebookSquare, faInstagramSquare, faGooglePlusSquare } from '@fortawesome/free-brands-svg-icons'



library.add(farFaCalendarAlt, fasFaCalendarAlt, faFacebookSquare, faInstagramSquare,faGooglePlusSquare, faGuitar, faAtlas, faPalette, faHeart, faUtensils, faMountain, faSearch, faTicketAlt )

dom.watch()

