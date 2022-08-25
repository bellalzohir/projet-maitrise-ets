function main(params) {
    return {
        "fibonacciArray": fibonacciArray(params.n),
    };
}

function fibonacciArray(n) {
    var fibonacci = [0, 1];
    for (var i = 2; i <= n; i++) {
        fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2];
    }
    return fibonacci[n];
}
