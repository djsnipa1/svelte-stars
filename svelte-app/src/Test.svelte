<script>
  import { onMount } from "svelte";
  import { gsap } from "gsap";

  let size = 32;
  // let color = '#c9ff35';
  let color = "#fff";

  let stars;
  let stars3;
  let width = window.screen.width;
  let height = window.screen.height;

  console.log(width, height);
  function cssVariables(node, variables) {
    setCssVariables(node, variables);

    return {
      update(variables) {
        setCssVariables(node, variables);
      },
    };
  }
  function setCssVariables(node, variables) {
    for (const name in variables) {
      node.style.setProperty(`--${name}`, variables[name]);
    }
  }

  // animation timing
  let animTime = 50;
  function timing(x) {
    //var height2 = window.screen.height * 2;
    var speed = (height * 2) / x;
    return speed;
  }

  let smallTime = timing(50);

  let randNumber = (high) => {
    return Math.floor(Math.random() * (1 + high - 2)) + 2;
  };
  console.log(randNumber(2000));

  function multiBoxShadow(n) {
    let value = [];
    for (let i = 0; i < n; i = i + 2) {
      // let value1 = `${randNumber(2000)}px ${randNumber(2000)}px ${color}`
      // value += `${randNumber(2000)}px ${randNumber(2000)}px ${color},`

      let value1 = `${randNumber(width * 2)}px ${randNumber(
        height * 2
      )}px ${color}`;
      value += `${value1}, ${randNumber(width * 2)}px ${randNumber(
        height * 2
      )}px ${color},`;

      // return value
    }
    // console.log(value)
    return value;
    //console.log(value)
  }

  let smallStars = multiBoxShadow(200).slice(0, -1);
  let medStars = multiBoxShadow(100).slice(0, -1);
  let largeStars = multiBoxShadow(50).slice(0, -1);
  console.log(`largeStars: ${largeStars}`);
  console.log(`smallTime: ${smallTime}`);
  console.log(`timing: ${timing(50)}`);

  onMount(() => {
    const newStars = document.querySelector("#stars2");
    // let stars3;
    const suck = document.querySelector("#suck");
    console.log(stars, stars3);
    gsap.to(stars, { y: 1000, duration: 10 });
    gsap.fromTo(stars2, { duration: 5, x: 0 }, { x: 1000 });
    // const nd = root.querySelectorAll('.forminput');
    // Do something with nd, such as adding event listeners, styles, etc.
  });

  let optionsOpen = false;

  function onSelectClick(e) {
    optionsOpen = !optionsOpen;
  }

  function adjustPosition(node) {
    // this will run when <div class="options"> is added to the DOM
    node.style.top = "300px"; // or whatever you want to do
  }
</script>

<div class="select" on:click={onSelectClick}>
  Select
  {#if optionsOpen}
    <div class="options" use:adjustPosition>My Options</div>
  {/if}
</div>

<p id="suck">suck paragraph</p>

<input bind:value={size} type="range" min="12" max="50" />
<input bind:value={color} type="color" />
<p>font-size: {size}px, color: {color}</p>

<p use:cssVariables={{ size, color }}>Hello world</p>

<!-- <div id="stars" style="--box-shadow-style: {smallStars}"></div> -->
<div
  bind:this={stars}
  use:cssVariables={{
    smallStars: `${smallStars}`,
    animation: `animStar ${smallTime}s linear infinite;`,
    top: `${height}px;`,
  }}
  id="stars"
/>
<div use:cssVariables={{ medStars }} id="stars2" />
<div bind:this={stars3} use:cssVariables={{ largeStars }} id="stars3" />

<style>
  :root {
    height: 100%;
    background: radial-gradient(ellipse at bottom, #1b2735 0%, #090a0f 100%);
    overflow: hidden;
    font-size: calc(15px + 0.390625vw);
    color: #ffffff;
  }

  #stars {
    width: 1px;
    height: 1px;
    background: transparent;
    box-shadow: var(--smallStars);
    /*   animation: animStar var(--smallTime) linear infinite; */
    /*   animation: var(--animation); */
    /* animation: animStar 50s linear infinite; */
    position: absolute;
    top: 0;
    left: 0;
  }

  #stars::after {
    content: " ";
    position: absolute;
    top: 2000px;
    /*     top: var(--top); */
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
    position: absolute;
    top: 0;
    left: 0;
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
    position: absolute;
    top: 0;
    left: 0;
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
