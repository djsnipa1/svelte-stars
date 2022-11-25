<script>
  import { css } from "./cssVars.js";
  let size = 28;
  let color = "#ff0000";
  let fontSize = 2.5;
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans+SC:wght@100;300;400&family=Bahianita&family=Bebas+Neue&family=Berkshire+Swash&family=Big+Shoulders+Display:wght@100;200;300;400;500;600;700;800;900&family=Cinzel+Decorative:wght@400;700&family=DM+Serif+Display&family=Lalezar&family=Megrim&family=Righteous&family=Satisfy&family=Teko&display=swap"
  rel="stylesheet"
/>

<input bind:value={fontSize} type="range" min="1" max="5" step=".1" />
<input bind:value={color} type="color" />
<p use:css={{ color }}>font-size: {fontSize}px, color: {color}</p>

<!-- <p use:cssVariables={{ size, color }}>Hello world</p> -->

<div id="titleWrapper">
  <div id="cbDotCom"><span>chadboyce.com</span></div>
  <div use:css={{ fontSize }} id="title"><span>Coming Soon</span></div>
</div>

<style>
  #title {
    --fontSize: ;
    color: #fff;
    text-align: center;
    font-family: "Cinzel Decorative", cursive;
    font-weight: 200;
    font-size: calc(var(--fontSize) * 1rem);
    letter-spacing: 10px;
    margin-top: 60px;
  }

  span {
    /*     --fontSize:; */
    /*     --color:; */
    /*     color: var(--color); */
    /*     font-size: calc(var(--fontSize) * 1px); */
    background: -webkit-linear-gradient(white, #38495a);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  #cbDotCom {
    font-family: Teko, sans-serif;
    font-size: 3rem;
    font-weight: 400;
    text-align: center;
    letter-spacing: 0.4rem;
    overflow: hidden;
    /*     filter: blur(3px); */
  }

  p {
    --color: ;
    color: var(--color);
  }
</style>
