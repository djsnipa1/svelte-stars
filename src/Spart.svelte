<script>

  import Sparticles from "sparticles";

  let sparticles,
      options = { color: "white", shape: "star", speed: 50 };

  function addSparticles(node) {
    new Sparticles(node, options, 400);
  }

</script>

<main use:addSparticles>
</main>