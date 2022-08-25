function main(params) {
    return {
        "fibonacciIterative": fibonacciIterative(params.n),    
    };
}

function fibonacciIterative(n) {
    if (n <= 1) {
        return n;
    }
    var a = 0;
    var b = 1;
    var c = 0;
    for (var i = 2; i <= n; i++) {
        c = a + b;
        a = b;
        b = c;
    }
    return c;
}
