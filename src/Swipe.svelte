<script>
  import { swipe } from 'svelte-gestures';
  let direction;
  let target;

  function handler(event) {
    direction = event.detail.direction;
    target = event.detail.target;
      console.log(`dir: ${direction}
      target: ${target}`)
  }
</script>

<div class="wrapper">
<div id="swipe" use:swipe={{ timeframe: 300, minSwipeDistance: 60 }} on:swipe={handler} style="border:1px solid pink;position: absolute;">
  direction: {direction}
</div>


  <div class="box">{direction}</div>
</div>            
    
<style>
    #swipe {
        position: relative;
        z-index: 1;
        margin: 0 auto;
        padding: 0;
        height: 100vh;
        width: 100vw;
    }

    .wrapper {
  height: 100vh;
  width: 100vw;
  display: flex;
  align-items: center;
  justify-content: center;
}
    .box {
        background: pink;
        border: 3px solid purple;
        color: purple;
    }
</style>