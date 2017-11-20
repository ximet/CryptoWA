import Counter from '../source/counter.wasm'  
const wasmHelloWorld = () => {  
    const counter = new Counter({
        'env': {
          'memoryBase': 0,
          'tableBase': 0,
          'memory': new WebAssembly.Memory({initial: 256}),
          'table': new WebAssembly.Table({initial: 0, element: 'anyfunc'})
        }
      });

    counter
        .then(module => {
            console.log('Counter example', module.instance.exports._count());
        })
        .catch(error => console.log(error))
}
window.onload = wasmHelloWorld  