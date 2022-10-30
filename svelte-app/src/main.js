//import './app.css'
import App from './App.svelte'
import Star from './Star.svelte'
// import Stars from './Stars.svelte'
import Congrats from './Congrats.svelte'
 
const app = new Star({
  target: document.getElementById('app')
})

export default app