<script>
    
	let user = { loggedIn: false };

	function toggle() {
		user.loggedIn = !user.loggedIn;
	}
</script>

{#if user.loggedIn}
	<button on:click={toggle}>
		Log out
	</button>
{/if}

{#if !user.loggedIn}
	<button on:click={toggle}>
		Log in
	</button>
<h1>DOPE</h1>
{/if}

<style>
    button {
        color: #ff00ff;
        background: #00eaFf;
    }
</style>