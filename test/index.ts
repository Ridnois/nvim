const foo: string = 'foo'

const foo2: number = 0

const greet: (name: string) => string = (name) => `Hello, ${name}!`
const weirdString = '//heheh'

console.log(weirdString)
console.log(greet('World'))

const someFunc = (prop: string) => {
  // read something
  const n: number = prop.length;
  for (let i = 0; i < n; i++) {
    // print the letter
    console.log(`Letter ${n} is ${prop[n]}`);
  }
  console.log("That's all!");
}

