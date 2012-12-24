CoffeeScript + Require.js + Paper.js Working Example
=

Overview
-

I wanted to create a working example using these three tools together before I actually implemented on a live project. I had some problems getting the vanilla paper.js library to load in using require.js's shim config setting. I wrapped it in an AMD define function.

I export the paper variable to work with and actually use the dot notation where I use paper js because I don't want to install it on the global window and would prefer to keep it modularized.

