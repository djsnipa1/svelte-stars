<script>

  let size = 32;
	let color = '#c9ff35';

  let width = window.screen.width;
  let height = window.screen.height;
  
  console.log(width, height)
  function cssVariables(node, variables) {
		setCssVariables(node, variables);
		
		return {
			update(variables) {
				setCssVariables(node, variables);
			}
		}
	}
	function setCssVariables(node, variables) {
		for (const name in variables) {
			node.style.setProperty(`--${name}`, variables[name]);
		}
	}

  // animation timing
  let animTime = 50;
  function timing(x){
  //var height2 = window.screen.height * 2;
    var speed = height * 2 / x;
    return speed;
  }

  let smallTime = timing(50);
  



let  randNumber = (high) => {
    return Math.floor(Math.random() * (1 + high - 2)) + 2;
  }
  console.log(randNumber(2000))
  
  function multiBoxShadow(n){
    let value = [];
   // let value1 = `${randNumber(2000)}px ${randNumber(2000)}px ${color}`
      let value1 = `${randNumber(width * 2)}px ${randNumber(height * 2)}px ${color}`
    for(let i = 0; i < n; i = i+2) {
     value += `${value1}, ${randNumber(width * 2)}px ${randNumber(height * 2)}px ${color},`
   // return value
    }
    // console.log(value)
    
    return value;
    //console.log(value)
  }
let smallStars = multiBoxShadow(1400).slice(0, -1)
let medStars = multiBoxShadow(600).slice(0, -1)
let largeStars = multiBoxShadow(200).slice(0, -1)
  console.log(`largeStars: ${largeStars}`)
console.log(`smallTime: ${smallTime}`)
    console.log(`timing: ${timing(50)}`)
</script>

<input bind:value={size} type="range" min="12" max="50" />
<input bind:value={color} type="color" />
<p>font-size: {size}px, color: {color}</p>

<p use:cssVariables={{size, color}}>
	Hello world
</p>

<!-- <div id="stars" style="--box-shadow-style: {smallStars}"></div> -->
<div use:cssVariables={{ smallStars: `${smallStars}`, animation: `animStar ${smallTime}s linear infinite;` }} id="stars"></div> 
<div use:cssVariables={{ medStars }} id="stars2"></div>
<div use:cssVariables={{ largeStars }} id="stars3"></div>

<style> 
  :root {
    height: 100%;
  background: radial-gradient(ellipse at bottom, #1B2735 0%, #090A0F 100%);
  overflow: hidden;
  font-size: calc(15px + 0.390625vw);
  color: #ffffff;
  }
  
  #stars {
   width: 1px;
  height: 1px;
  background: transparent;
  box-shadow: var(--smallStars);
  /*animation: animStar var(--smallTime) linear infinite;*/
  animation: var(--animation);
  }

  #stars::after { 
    content: " ";
    position: absolute;
    top: 2000px;
    width: 1px;
    height: 1px;
    background: transparent;
    box-shadow: var(--smallStars);
}

    #stars2 {
   width: 2px;
  height: 2px;
  background: transparent;
  box-shadow: var(--medStars);
  animation: animStar 100s linear infinite;
  }

  #stars2::after { 
    content: " ";
    position: absolute;
    top: 2000px;
    width: 2px;
    height: 2px;
    background: transparent;
    box-shadow: var(--medStars);
}

    #stars3 {
   width: 3px;
  height: 3px;
  background: transparent;
  box-shadow: var(--largeStars);
  animation: animStar 150s linear infinite;
  }

  #stars3::after { 
    content: " ";
    position: absolute;
    top: 2000px;
    width: 3px;
    height: 3px;
    background: transparent;
    box-shadow: var(--largeStars);
}
  p {
		font-size: calc(var(--size) * 1px);
		color: var(--color);
		border: var(--color) 1px solid;
	}

  @keyframes animStar {
  from {
    transform: translateY(0px);
  }
  to {
    transform: translateY(-2000px);
  }
}

</style>