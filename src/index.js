// SIMPLE EXAMPLE
//import Counter from '../source/counter.wasm';
// const wasmHelloWorld = () => {  
//     const counter = new Counter({
//         'env': {
//           'memoryBase': 0,
//           'tableBase': 0,
//           'memory': new WebAssembly.Memory({initial: 256}),
//           'table': new WebAssembly.Table({initial: 0, element: 'anyfunc'})
//         }
//       });

//     counter
//         .then(module => {
//             console.log('Counter example', module.instance.exports._count());
//         })
//         .catch(error => console.log(error))
// }

import AES from '../source/aes.wasm';

const aesWasm = () => {
    const aes = new AES({
                        'env': {
                        'memoryBase': 0,
                        'tableBase': 0,
                        'memory': new WebAssembly.Memory({initial: 512}),
                        'table': new WebAssembly.Table({initial: 0, element: 'anyfunc'})
                    }
                });

    aes.then(module => {
        console.log(module.instance.exports);
    }).catch(error => console.log(error))
}

window.onload = aesWasm  