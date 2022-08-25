
function main(params) {
    let iter=generateDigitsOfPi();
    let piDecimals = [];
    let i = 0;
    while (i < params.n) {
        piDecimals.push(iter.next().value);
        i++;
        console.log("computed decimal number : " + i + " / value : " + piDecimals[i - 1]);
    }
    let pi=piDecimals.join("");
    return {
        //"computePi": computePi(params.n),
        "generateDigitsOfPi": pi
    };
}

// The higher n is, the more accurate the result is.
function computePi(n) {
    let pi = 0;
    let i = 0;
    while (i < n) {
        pi += 4 * (Math.pow(-1, i) / (2 * i + 1));
        i++;
    }
    return pi;
}

// https://stackoverflow.com/a/64286624
function * generateDigitsOfPi() {
    let q = 1n;
    let r = 180n;
    let t = 60n;
    let i = 2n;
    while (true) {
        let digit = ((i * 27n - 12n) * q + r * 5n) / (t * 5n);
        yield Number(digit);
        let u = i * 3n;
        u = (u + 1n) * 3n * (u + 2n);
        r = u * 10n * (q * (i * 5n - 2n) + r - t * digit);
        q *= 10n * i * (i++ * 2n - 1n);
        t *= u;
    }
}
