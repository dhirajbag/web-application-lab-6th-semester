function hide() {
    var x = document.getElementById("image");
    var btn = document.getElementById("btn");
    if (x.style.display === "none") {
        x.style.display = "block";
        btn.innerText = "Hide Image";
    } else {
        x.style.display = "none";
        btn.innerText = "Show Image";
    }
}