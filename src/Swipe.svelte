<script>
  import { swipe } from 'svelte-gestures';
  let direction;
  let target;

  function handler(event) {
    direction = event.detail.direction;
    target = event.detail.target;
  }
</script>

<div use:swipe={{ timeframe: 300, minSwipeDistance: 60 }} on:swipe={handler} style="width:100%;height:100%;border:1px solid pink;position: absolute;">
  direction: {direction}
</div>

