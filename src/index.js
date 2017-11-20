import Counter from '../source/counter.wasm'  
const wasmHelloWorld = () => {  
    const counter = new Counter();

    counter
        .then(result => console.log(result))
        .catch(error => console.log(error))
}
window.onload = wasmHelloWorld  