import React from 'react'
import ReactDom from 'react-dom'

const Hello = () => {
  return(
    <div className='text-5xl text-red-700'>
      Hello React
    </div>
  )
}




document.addEventListener('DOMContentLoaded', ()=>{
  ReactDom.render( <Hello />, document.body.append(document.createElement('div')))
})