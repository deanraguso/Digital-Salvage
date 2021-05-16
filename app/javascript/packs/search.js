window.searchHandler = () => {
    let query = document.getElementById("search");
    window.location.replace(window.location.href.split("search")[0] + "search/" + query.value);
}