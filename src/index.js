import Counter from './src/counter.wasm'  
const wasmHelloWorld = () => {  
    const counter = new Counter();
    console.log("count function result is : " + counter.exports._count());
}
window.onload = wasmHelloWorld  