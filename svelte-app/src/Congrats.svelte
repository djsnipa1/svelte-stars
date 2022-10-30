<script>
	import { onMount } from 'svelte';

	let characters = ['🥳', '🎉', '✨'];

  let  randNumber = (low, high) => {
    return Math.floor(Math.random() * (1 + high - low)) + low;
  }
  
	let confetti = new Array(100).fill()
		.map((_, i) => {
			return {
				character: characters[i % characters.length],
				x: Math.random() * 100,
				y: -20 - Math.random() * 100,
				r: 0.1 + Math.random() * 1
			};
		})
		.sort((a, b) => a.r - b.r);

	onMount(() => {
		let frame;

		function loop() {
			frame = requestAnimationFrame(loop);

			confetti = confetti.map(emoji => {
				emoji.y += 0.7 * emoji.r;
				if (emoji.y > 120) emoji.y = -20;
				return emoji;
			});
		}

		loop();

		return () => cancelAnimationFrame(frame);
	});
 
  // $shadows-small:  multiple-box-shadow(1400)

  
</script>

{#each confetti as c}
	<span style="left: {c.x}%; top: {c.y}%; transform: scale({c.r})">{c.character}</span>
{/each}

<div id="stars"></div>

<style>
  :root {
    --small-shadow: 0px 0px #fff;
  }
	:global(body) {
		overflow: hidden;
	}

	span {
		position: absolute;
		font-size: 5vw;
		user-select: none;
	}

 #stars {
  width: 1px;
  height: 1px;
  background: transparent;
  box-shadow: var(--small-shadow);
  animation: animStar 50s linear infinite;
} 
#stars::after { 
    content: " ";
    position: absolute;
    top: 2000px;
    width: 1px;
    height: 1px;
    background: transparent;
    box-shadow: var(--small-shadow);
} 


  
</style>
