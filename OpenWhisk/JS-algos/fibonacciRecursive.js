function main(params) {
    return {
        "fibonacciRecursive": fibonacciRecursive(params.n),
    };
}

function fibonacciRecursive(n) {
    if (n <= 1) {
        return n;
    }
    return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2);
}
