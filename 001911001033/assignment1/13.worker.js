console.log('web worker is running');

this.onmessage = function(e) {
    const val = e.data;
    prod = 1;
    for (i =2; i<=val; i++)
        prod = prod * i;
    this.postMessage(prod);
};