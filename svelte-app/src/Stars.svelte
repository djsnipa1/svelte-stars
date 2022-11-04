<script>
  import Congrats from "./Congrats.svelte";

  // @function multiple-box-shadow ($n)
  // $value: '#{random(2000)}px #{random(2000)}px #FFF'
  // @for $i from 2 through $n
  //   $value: '#{$value} , #{random(2000)}px #{random(2000)}px #FFF'

  let randNumber = (high) => {
    return Math.floor(Math.random() * (1 + high - 2)) + 2;
  };
  console.log(randNumber(2000));

  function multiBoxShadow(n) {
    let value = [];
    let value1 = `${randNumber(2000)}px ${randNumber(2000)}px #FFF`;
    for (let i = 0; i < n; i = i + 2) {
      value += `${value1}, ${randNumber(2000)}px ${randNumber(2000)}px #FFF`;
      // return value
    }
    //console.log(value)

    return value;
    //console.log(value)
  }
  // @return unquote($value)

  console.log(`multiBoxShadow: ${multiBoxShadow(20)}`);

  let bgOpacity = 0.5;
  $: color = bgOpacity < 0.6 ? "#0ff" : "#fff";
</script>

<Congrats />
<h1>yo whuddup?</h1>
<p style="color: {color}; --opacity: {bgOpacity};">This is a paragraph.</p>

<p style:color style:--opacity={bgOpacity}>This is a paragraph.</p>

<style>
  :root {
    height: 100%;
    background: radial-gradient(ellipse at bottom, #1b2735 0%, #090a0f 100%);
    overflow: hidden;
    font-size: calc(15px + 0.390625vw);
    color: #ffffff;
  }
</style>
