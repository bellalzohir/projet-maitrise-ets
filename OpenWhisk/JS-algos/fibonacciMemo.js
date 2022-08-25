function main(params) {
    return {
        "fibonacciRecursiveMemo": fibonacciRecursiveMemo(params.n),
    };
}

function fibonacciRecursiveMemo(n, memo=[]) {
    if (n <= 1) {
        return n;
    }
    if (memo[n] === undefined) {
        memo[n] = fibonacciRecursiveMemo(n - 1, memo) + fibonacciRecursiveMemo(n - 2, memo);
    }
    return memo[n];
}
