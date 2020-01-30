const {child_process, fetch, SERVER_API} = require("../config/index.js")

fetch(`${SERVER_API}/accounts-sync`)
    .then(res => res.json())
    .then(json => console.log(json));
