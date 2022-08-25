function main(params) {
    var openwhisk = require("openwhisk")
    var ow = openwhisk({
        ignore_certs : true
    });
    return ow.actions.invoke([
        {name: "arraySum_chained", blocking: true, result: true, params: {n: 2}}, 
        {name: "arraySum_chained", blocking: true, result: true, params: {n: 2}}
    ]).then(([act1, act2]) => {
        var result1 = ow.activations.get("arraySum_chained");
        console.log(result1);
        //return {"test" : "test"};
        return result1;
    }).then(activation => {
        return {"res": activation}
    }).catch(err => {
        console.error('failed to invoke actions', err);
        return 1;
    });
}

exports.main = main;